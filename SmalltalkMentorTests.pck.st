'From Cuis7.9 [latest update: #8113] on 19 August 2026 at 8:27:31 am'!
'Description '!
!provides: 'SmalltalkMentorTests' 1 7!
!requires: 'SmalltalkMentor' nil nil nil!
SystemOrganization addCategory: #SmalltalkMentorTests!


!classDefinition: #SmalltalkMentorFixedHeuristicTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorFixedHeuristicTest
	instanceVariableNames: 'review fixtures'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorFixedHeuristicTest class' category: #SmalltalkMentorTests!
SmalltalkMentorFixedHeuristicTest class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorHeuristicTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorHeuristicTest
	instanceVariableNames: 'mentor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorHeuristicTest class' category: #SmalltalkMentorTests!
SmalltalkMentorHeuristicTest class
	instanceVariableNames: ''!


!SmalltalkMentorFixedHeuristicTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
setUp

	"The static verifications are pure (they take the class to check as an argument), so a bare
	review instance is enough - no mentor or LLM is needed."

	review := SmalltalkMentorClassReview new.
	fixtures := OrderedCollection new! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
tearDown

	fixtures reverse do: [ :eachFixtureClass | eachFixtureClass removeFromSystem ].
	fixtures := OrderedCollection new! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
includesSubstring: aSubstring in: aString

	^(review firstIndexOf: aSubstring in: aString) > 0! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
newFixtureClassNamed: aClassNameSymbol superclass: aSuperclass

	"A throwaway class (removed in tearDown) used to build small hierarchies. Its category is
	outside every SmalltalkMentor package so no package ever claims it."

	| createdClass |

	createdClass := aSuperclass subclass: aClassNameSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'SMMentorFixtures'.
	fixtures add: createdClass.
	^createdClass! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
newFixtureInstanceVariableNames: instanceNames classVariableNames: classNames

	"A throwaway class (removed in tearDown) used to exercise one static heuristic. Its category is
	outside every SmalltalkMentor package so no package ever claims it."

	| createdClass |

	createdClass := Object subclass: #SMMentorFixture
		instanceVariableNames: instanceNames
		classVariableNames: classNames
		poolDictionaries: ''
		category: 'SMMentorFixtures'.
	fixtures add: createdClass.
	^createdClass! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testClassMustBeReferenced

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	findings := review classReferencedFindingsFor: classToVerify.
	self assert: findings notEmpty.
	"a class that other classes reference is not flagged"
	self assert: (review classReferencedFindingsFor: SmalltalkMentorFinding) isEmpty! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testClassVariableMustBeReadAndWritten

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: 'UnusedClassVariable'.
	findings := review classVariableFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | finding editKind = #variable and: [ finding editTarget value = 'UnusedClassVariable' ] ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testInstanceVariableMustBeReadAndWritten

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: 'unusedInstanceVariable' classVariableNames: ''.
	findings := review instanceVariableFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | finding editKind = #variable and: [ finding editTarget value = 'unusedInstanceVariable' ] ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testMethodMustBeCategorized

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'looseMethod ^1' classified: 'as yet unclassified'.
	findings := review uncategorizedMethodsFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | finding editTarget value asString = 'looseMethod' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testMethodMustHaveSenders

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'orphanMethodXyz ^42' classified: 'accessing'.
	findings := review methodsWithoutSendersFindingsFor: classToVerify.
	"Compare by asString, not the #orphanMethodXyz literal: a Symbol literal here would itself
	count as a sender and defeat the heuristic."
	self assert: (findings anySatisfy: [ :finding | finding editTarget value asString = 'orphanMethodXyz' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testSentMessageMustHaveImplementer

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'callsMissing ^self zzzNoSuchSelectorXyz' classified: 'accessing'.
	findings := review messagesWithoutImplementersFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | self includesSubstring: 'zzzNoSuchSelectorXyz' in: finding title ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testSharedLeafSubclassProtocolMustBeInRoot

	| rootClass firstLeaf secondLeaf findings |

	rootClass := self newFixtureClassNamed: #SMFixtureRoot superclass: Object.
	firstLeaf := self newFixtureClassNamed: #SMFixtureFirstLeaf superclass: rootClass.
	secondLeaf := self newFixtureClassNamed: #SMFixtureSecondLeaf superclass: rootClass.
	firstLeaf compile: 'sharedOperation ^1' classified: 'operations'.
	secondLeaf compile: 'sharedOperation ^2' classified: 'operations'.
	firstLeaf compile: 'onlyInOneLeaf ^0' classified: 'operations'.
	findings := review commonLeafSubclassProtocolFindingsFor: rootClass.
	"answered by every leaf but missing in the root -> flagged"
	self assert: (findings anySatisfy: [ :finding | self includesSubstring: 'sharedOperation' in: finding title ]).
	"answered by only one leaf -> not flagged"
	self deny: (findings anySatisfy: [ :finding | self includesSubstring: 'onlyInOneLeaf' in: finding title ]).
	"once the root declares it (even as subclassResponsibility) it is no longer flagged"
	rootClass compile: 'sharedOperation ^self subclassResponsibility' classified: 'operations'.
	findings := review commonLeafSubclassProtocolFindingsFor: rootClass.
	self deny: (findings anySatisfy: [ :finding | self includesSubstring: 'sharedOperation' in: finding title ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testUnusedAndWriteOnlyTemporariesAreFlaggedButUsedAndCapturedAreNot

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'withTemporaries
	| usedTemporary reallyUnused writeOnly |
	usedTemporary := 1.
	writeOnly := 2.
	^usedTemporary' classified: 'accessing'.
	classToVerify compile: 'withCapture
	| shared |
	[ shared := 5 ] value.
	^shared' classified: 'accessing'.
	findings := review unusedTemporariesFindingsFor: classToVerify.
	self assert: 2 equals: findings size.
	self assert: (findings anySatisfy: [ :finding | self includesSubstring: 'reallyUnused' in: finding title ]).
	self assert: (findings anySatisfy: [ :finding | self includesSubstring: 'writeOnly' in: finding title ]).
	self deny: (findings anySatisfy: [ :finding | self includesSubstring: 'usedTemporary' in: finding title ]).
	self deny: (findings anySatisfy: [ :finding | self includesSubstring: 'shared' in: finding title ])! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
assertHeuristic: heuristicId caughtIn: methodSource fix: aFixBlock

	"Best-of-3 (lenient): up to 3 Opus reviews of methodSource. A run counts if the suggested
	code applies the heuristic (aFixBlock answers true for the suggestedSource) OR the rationale
	cites the heuristic id. Passes if ANY of the 3 runs counts - robust to LLM non-determinism.
	Stops early on the first success."

	| last caught |

	caught := false.
	1 to: 3 do: [ :i |
		caught ifFalse: [ | proposal suggested rationale |
			proposal := self reviewOf: methodSource.
			last := proposal.
			suggested := proposal at: 'suggestedSource' ifAbsent: [ '' ].
			rationale := proposal at: 'rationale' ifAbsent: [ '' ].
			caught := (aFixBlock value: suggested) or: [ self does: rationale include: heuristicId ] ] ].
	self assert: caught description:
		'Heuristic [', heuristicId, '] not caught in 3 Opus runs.', String newLineString,
		'Last suggestion: ', (last ifNil: [ '' ] ifNotNil: [ :p | p at: 'suggestedSource' ifAbsent: [ '' ] ]), String newLineString,
		'Last rationale: ', (last ifNil: [ '' ] ifNotNil: [ :p | p at: 'rationale' ifAbsent: [ '' ] ])! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
does: aString include: aSubstring

	"Case-insensitive substring test."

	| lowercaseString lowercaseSubstring |

	lowercaseString := aString asString asLowercase.
	lowercaseSubstring := aSubstring asString asLowercase.
	lowercaseSubstring isEmpty ifTrue: [ ^true ].
	lowercaseSubstring size > lowercaseString size ifTrue: [ ^false ].
	1 to: lowercaseString size - lowercaseSubstring size + 1 do: [ :scanIndex |
		(lowercaseString copyFrom: scanIndex to: scanIndex + lowercaseSubstring size - 1) = lowercaseSubstring ifTrue: [ ^true ] ].
	^false! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
firstIndexOf: aSubstring in: aString

	"First 1-based index of aSubstring in aString (case-insensitive), or 0 if absent."

	| lowercaseString lowercaseSubstring |

	lowercaseString := aString asString asLowercase.
	lowercaseSubstring := aSubstring asString asLowercase.
	(lowercaseSubstring isEmpty or: [ lowercaseSubstring size > lowercaseString size ]) ifTrue: [ ^0 ].
	1 to: lowercaseString size - lowercaseSubstring size + 1 do: [ :scanIndex |
		(lowercaseString copyFrom: scanIndex to: scanIndex + lowercaseSubstring size - 1) = lowercaseSubstring ifTrue: [ ^scanIndex ] ].
	^0! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
firstLineOf: aString

	"The first non-blank line of aString, trimmed - useful for reading a suggested method's
	selector line."

	| lines |

	lines := aString lines select: [ :l | l withBlanksTrimmed notEmpty ].
	^lines isEmpty ifTrue: [ '' ] ifFalse: [ lines first withBlanksTrimmed ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
provider

	"These tests pin Claude Opus, independent of the globally selected provider."

	^AnthropicProvider new model: 'claude-opus-4-8'; yourself! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
reviewOf: methodSource

	"Ask Claude Opus to review methodSource against the current heuristics; answer the parsed
	{canImprove, suggestedSource, rationale} proposal. Blocks on the network call."

	| answer |

	answer := self provider completionForMessages: {
		mentor userMessage: (mentor promptFor: methodSource) }.
	^mentor parseProposalFrom: answer! !

!SmalltalkMentorHeuristicTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
setUp

	"A fresh mentor per test, used to build the prompt and parse replies."

	mentor := SmalltalkMentor new! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testAvoidBreakingEncapsulation

	self
		assertHeuristic: 'avoid-breaking-encapsulation'
		caughtIn: 'canWithdraw: anAmount from: anAccount
	^anAccount balance >= anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testAvoidNil

	self
		assertHeuristic: 'avoid-nil'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^nil ].
	^owner name'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testAvoidSettersUseSyncWith

	self
		assertHeuristic: 'avoid-setters-use-syncWith'
		caughtIn: 'name: aName
	name := aName'
		fix: [ :s | self does: s include: 'syncWith:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testCompleteObjects

	self
		assertHeuristic: 'complete-objects'
		caughtIn: 'createAccount
	| account |
	account := Account new.
	account balance: 0.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testErrorMessagesAsClassMethods

	self
		assertHeuristic: 'error-messages-as-class-methods'
		caughtIn: 'withdraw: anAmount
	anAmount > balance ifTrue: [ ^self error: ''Insufficient funds'' ].
	balance := balance - anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testGetterReturnsCopy

	self
		assertHeuristic: 'getter-returns-copy'
		caughtIn: 'movements
	^movements'
		fix: [ :s | self does: s include: 'copy' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testInstanceCreationFormat

	self
		assertHeuristic: 'instance-creation-format'
		caughtIn: 'withOwner: anOwner balance: aBalance
	| account |
	account := self new.
	account setOwner: anOwner balance: aBalance.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 11:24:57 am (UTC)'!
testMethodComplexity

	self
		assertHeuristic: 'method-complexity'
		caughtIn: 'printReport
	| report |
	report := WriteStream on: String new.
	report nextPutAll: self title; nextPut: Character lf.
	report nextPutAll: self author name; nextPut: Character lf.
	report nextPutAll: self date printString; nextPut: Character lf.
	report nextPutAll: self body trimmed; nextPut: Character lf.
	report nextPutAll: self footer name asUppercase.
	^report contents'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 11:25:04 am (UTC)'!
testMethodDeclarativity

	self
		assertHeuristic: 'method-declarativity'
		caughtIn: 'netPrice
	^(self basePrice * self quantity) - ((self basePrice * self quantity) * self discountRate)'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testPreferImmutable

	self
		assertHeuristic: 'prefer-immutable'
		caughtIn: 'balance: aBalance
	balance := aBalance'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testReplaceIfWithPolymorphism

	self
		assertHeuristic: 'replace-if-with-polymorphism'
		caughtIn: 'describe
	type = #savings ifTrue: [ ^''Savings account'' ] ifFalse: [ ^''Checking account'' ]'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testValidObjects

	self
		assertHeuristic: 'valid-objects'
		caughtIn: 'withBalance: aBalance
	^self new initializeWithBalance: aBalance'
		fix: [ :s | self does: s include: 'assert' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testDenyOverAssertNot

	self
		assertHeuristic: 'deny-over-assert-not'
		caughtIn: 'testNewAccountHasNoMovements
	self assert: account hasMovements not'
		fix: [ :s | self does: s include: 'deny:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testExceptionBlockShouldNotHaveAssignment

	self
		assertHeuristic: 'exception-block-should-not-have-assignment'
		caughtIn: 'testWithdrawSignalsError
	| result |
	result := [ account withdraw: 1000 ] on: Error do: [ :e | e ].
	self assert: result isNil'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testExceptionBlockSingleSend

	self
		assertHeuristic: 'exception-block-single-send'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ | amount | amount := account balance + 1. account withdraw: amount ] raise: Error withMessageText: ''Insufficient funds'''
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testOneThingPerTest

	self
		assertHeuristic: 'one-thing-per-test'
		caughtIn: 'testAccount
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100.
	account deposit: 50.
	self assert: account balance equals: 150.
	self deny: account isBlocked'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testTestNPrefixPreserved

	self
		assertHeuristic: 'testN-prefix-preserved'
		caughtIn: 'test1
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | ((self firstLineOf: s) beginsWith: 'test1') and: [ (self firstLineOf: s) size > 5 ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testTestNameConvention

	self
		assertHeuristic: 'test-name-convention'
		caughtIn: 'testBalance
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testTestingForEquality

	self
		assertHeuristic: 'testing-for-equality'
		caughtIn: 'testAddition
	self assert: 3 = (1 + 2)'
		fix: [ :s | self does: s include: 'equals:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testTestingForExceptionWithSideEffect

	self
		assertHeuristic: 'testing-for-exception-with-side-effect'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ account withdraw: 1000 ] raise: Error'
		fix: [ :s | self does: s include: 'withExceptionDo:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testTestingForExceptionWithoutSideEffect

	self
		assertHeuristic: 'testing-for-exception-without-side-effect'
		caughtIn: 'testCannotCreateWithNegativeBalance
	[ Account withBalance: -100 ] on: Error do: [ :e | self assert: e messageText = ''Balance must be positive'' ]'
		fix: [ :s | self does: s include: 'withMessageText:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testDoNotUseAbbreviatedName

	"The names reveal their roles, so this targets the abbreviation heuristic specifically rather
	than [variable-name-reveals-role]: calc (calculate), aColl (a collection), tot (total),
	elem (element)."

	self
		assertHeuristic: 'do-not-use-abbreviated-name'
		caughtIn: 'calcTotalFor: aColl
	| tot |
	tot := 0.
	aColl do: [ :elem | tot := tot + elem price ].
	^tot'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testMessageKeywordsNames

	self
		assertHeuristic: 'message-keywords-names'
		caughtIn: 'DepositAmount: anAmount
	balance := balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testMessageNames

	self
		assertHeuristic: 'message-names'
		caughtIn: 'calc: anAmount
	^balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testNoSetGet

	self
		assertHeuristic: 'no-set-get'
		caughtIn: 'getBalance
	^balance'
		fix: [ :s | (self firstLineOf: s) notEmpty and: [ ((self firstLineOf: s) asLowercase beginsWith: 'get') not ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testParameterPrefix

	self
		assertHeuristic: 'parameter-prefix'
		caughtIn: 'withBalance: balance
	^self new initializeWithBalance: balance'
		fix: [ :s | self does: s include: 'aBalance' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testVariableNameRevealsRole

	self
		assertHeuristic: 'variable-name-reveals-role'
		caughtIn: 'total
	| aCollection |
	aCollection := self movements.
	^aCollection inject: 0 into: [ :acc :each | acc + each amount ]'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testAndOrOverBooleanOperators

	self
		assertHeuristic: 'and-or-over-&&-||'
		caughtIn: 'isValid
	^(balance > 0) && (owner notNil)'
		fix: [ :s | self does: s include: 'and:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testAndOrTakeBlocks

	self
		assertHeuristic: 'and-or-take-blocks'
		caughtIn: 'isValid
	^balance > 0 and: owner notNil'
		fix: [ :s | self does: s include: 'and: [' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testIfEmptyOverIsEmptyIfTrue

	self
		assertHeuristic: 'ifEmpty-over-isEmpty-ifTrue'
		caughtIn: 'firstMovementOrDefault
	movements isEmpty ifTrue: [ ^self defaultMovement ].
	^movements first'
		fix: [ :s | self does: s include: 'ifEmpty:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testIfNilOverIsNilIfTrue

	self
		assertHeuristic: 'ifNil-over-isNil-ifTrue'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^self defaultName ].
	^owner name'
		fix: [ :s | self does: s include: 'ifNil:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testIfTrueIfFalse

	self
		assertHeuristic: 'ifTrue-ifFalse'
		caughtIn: 'label
	^self isBlocked ifFalse: [ ''Active'' ] ifTrue: [ ''Blocked'' ]'
		fix: [ :s | | t f |
			t := self firstIndexOf: 'ifTrue:' in: s.
			f := self firstIndexOf: 'ifFalse:' in: s.
			t > 0 and: [ f = 0 or: [ t < f ] ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testIsNilOverEqualNil

	self
		assertHeuristic: 'isNil-over-equal-nil'
		caughtIn: 'hasNoOwner
	^owner = nil'
		fix: [ :s | self does: s include: 'isNil' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testPreferEqualOverIdentity

	self
		assertHeuristic: 'prefer-equal-over-identity'
		caughtIn: 'hasSameNameAs: anAccount
	^name == anAccount name'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testRedundantIfTrueCondition

	self
		assertHeuristic: 'redundant-ifTrue-condition'
		caughtIn: 'currentBalance
	self isActive = true ifTrue: [ ^self balance ].
	^0'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'syntax heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testNoExtraParenthesis

	self
		assertHeuristic: 'no-extra-parenthesis'
		caughtIn: 'negatedBalance
	^(self balance) negated'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'collection heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testIsEmptyOverSizeEqualZero

	self
		assertHeuristic: 'isEmpty-over-size-equal-zero'
		caughtIn: 'hasNoMovements
	^movements size = 0'
		fix: [ :s | self does: s include: 'isEmpty' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'aconcagua heuristics tests' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
testDoNotUseAmount

	self
		assertHeuristic: 'do-not-use-amount'
		caughtIn: 'isPositiveBalance
	^balance amount strictlyPositive'
		fix: [ :s | false ]! !
