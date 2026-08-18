'From Cuis7.9 [latest update: #8113] on 18 August 2026 at 3:56:40 pm'!
'Description '!
!provides: 'SmalltalkMentorTests' 1 5!
!requires: 'SmalltalkMentor' nil nil nil!
SystemOrganization addCategory: #SmalltalkMentorTests!


!classDefinition: #SmalltalkMentorFixedRuleTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorFixedRuleTest
	instanceVariableNames: 'review fixtures'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorFixedRuleTest class' category: #SmalltalkMentorTests!
SmalltalkMentorFixedRuleTest class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorRuleTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorRuleTest
	instanceVariableNames: 'mentor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorRuleTest class' category: #SmalltalkMentorTests!
SmalltalkMentorRuleTest class
	instanceVariableNames: ''!


!SmalltalkMentorFixedRuleTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
setUp

	"The static verifications are pure (they take the class to check as an argument), so a bare
	review instance is enough - no mentor or LLM is needed."

	review := SmalltalkMentorClassReview new.
	fixtures := OrderedCollection new! !

!SmalltalkMentorFixedRuleTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
tearDown

	fixtures reverse do: [ :eachFixtureClass | eachFixtureClass removeFromSystem ].
	fixtures := OrderedCollection new! !

!SmalltalkMentorFixedRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
includesSubstring: aSubstring in: aString

	^(review firstIndexOf: aSubstring in: aString) > 0! !

!SmalltalkMentorFixedRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentorFixedRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
newFixtureInstanceVariableNames: instanceNames classVariableNames: classNames

	"A throwaway class (removed in tearDown) used to exercise one static rule. Its category is
	outside every SmalltalkMentor package so no package ever claims it."

	| createdClass |

	createdClass := Object subclass: #SMMentorFixture
		instanceVariableNames: instanceNames
		classVariableNames: classNames
		poolDictionaries: ''
		category: 'SMMentorFixtures'.
	fixtures add: createdClass.
	^createdClass! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testClassMustBeReferenced

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	findings := review classReferencedFindingsFor: classToVerify.
	self assert: findings notEmpty.
	"a class that other classes reference is not flagged"
	self assert: (review classReferencedFindingsFor: SmalltalkMentorFinding) isEmpty! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testClassVariableMustBeReadAndWritten

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: 'UnusedClassVariable'.
	findings := review classVariableFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | finding editKind = #variable and: [ finding editTarget value = 'UnusedClassVariable' ] ])! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testInstanceVariableMustBeReadAndWritten

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: 'unusedInstanceVariable' classVariableNames: ''.
	findings := review instanceVariableFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | finding editKind = #variable and: [ finding editTarget value = 'unusedInstanceVariable' ] ])! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testMethodMustBeCategorized

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'looseMethod ^1' classified: 'as yet unclassified'.
	findings := review uncategorizedMethodsFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | finding editTarget value asString = 'looseMethod' ])! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testMethodMustHaveSenders

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'orphanMethodXyz ^42' classified: 'accessing'.
	findings := review methodsWithoutSendersFindingsFor: classToVerify.
	"Compare by asString, not the #orphanMethodXyz literal: a Symbol literal here would itself
	count as a sender and defeat the rule."
	self assert: (findings anySatisfy: [ :finding | finding editTarget value asString = 'orphanMethodXyz' ])! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testSentMessageMustHaveImplementer

	| classToVerify findings |

	classToVerify := self newFixtureInstanceVariableNames: '' classVariableNames: ''.
	classToVerify compile: 'callsMissing ^self zzzNoSuchSelectorXyz' classified: 'accessing'.
	findings := review messagesWithoutImplementersFindingsFor: classToVerify.
	self assert: (findings anySatisfy: [ :finding | self includesSubstring: 'zzzNoSuchSelectorXyz' in: finding title ])! !

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentorFixedRuleTest methodsFor: 'tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
assertRule: ruleId caughtIn: methodSource fix: aFixBlock

	"Best-of-3 (lenient): up to 3 Opus reviews of methodSource. A run counts if the suggested
	code applies the rule (aFixBlock answers true for the suggestedSource) OR the rationale
	cites the rule id. Passes if ANY of the 3 runs counts - robust to LLM non-determinism.
	Stops early on the first success."

	| last caught |

	caught := false.
	1 to: 3 do: [ :i |
		caught ifFalse: [ | proposal suggested rationale |
			proposal := self reviewOf: methodSource.
			last := proposal.
			suggested := proposal at: 'suggestedSource' ifAbsent: [ '' ].
			rationale := proposal at: 'rationale' ifAbsent: [ '' ].
			caught := (aFixBlock value: suggested) or: [ self does: rationale include: ruleId ] ] ].
	self assert: caught description:
		'Rule [', ruleId, '] not caught in 3 Opus runs.', String newLineString,
		'Last suggestion: ', (last ifNil: [ '' ] ifNotNil: [ :p | p at: 'suggestedSource' ifAbsent: [ '' ] ]), String newLineString,
		'Last rationale: ', (last ifNil: [ '' ] ifNotNil: [ :p | p at: 'rationale' ifAbsent: [ '' ] ])! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
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

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
firstIndexOf: aSubstring in: aString

	"First 1-based index of aSubstring in aString (case-insensitive), or 0 if absent."

	| lowercaseString lowercaseSubstring |

	lowercaseString := aString asString asLowercase.
	lowercaseSubstring := aSubstring asString asLowercase.
	(lowercaseSubstring isEmpty or: [ lowercaseSubstring size > lowercaseString size ]) ifTrue: [ ^0 ].
	1 to: lowercaseString size - lowercaseSubstring size + 1 do: [ :scanIndex |
		(lowercaseString copyFrom: scanIndex to: scanIndex + lowercaseSubstring size - 1) = lowercaseSubstring ifTrue: [ ^scanIndex ] ].
	^0! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
firstLineOf: aString

	"The first non-blank line of aString, trimmed - useful for reading a suggested method's
	selector line."

	| lines |

	lines := aString lines select: [ :l | l withBlanksTrimmed notEmpty ].
	^lines isEmpty ifTrue: [ '' ] ifFalse: [ lines first withBlanksTrimmed ]! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
provider

	"These tests pin Claude Opus, independent of the globally selected provider."

	^AnthropicProvider new model: 'claude-opus-4-8'; yourself! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewOf: methodSource

	"Ask Claude Opus to review methodSource against the current rules; answer the parsed
	{canImprove, suggestedSource, rationale} proposal. Blocks on the network call."

	| answer |

	answer := self provider completionForMessages: {
		mentor userMessage: (mentor promptFor: methodSource) }.
	^mentor parseProposalFrom: answer! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testAvoidBreakingEncapsulation

	self
		assertRule: 'avoid-breaking-encapsulation'
		caughtIn: 'canWithdraw: anAmount from: anAccount
	^anAccount balance >= anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testAvoidNil

	self
		assertRule: 'avoid-nil'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^nil ].
	^owner name'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testAvoidSettersUseSyncWith

	self
		assertRule: 'avoid-setters-use-syncWith'
		caughtIn: 'name: aName
	name := aName'
		fix: [ :s | self does: s include: 'syncWith:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testCompleteObjects

	self
		assertRule: 'complete-objects'
		caughtIn: 'createAccount
	| account |
	account := Account new.
	account balance: 0.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
testErrorMessagesAsClassMethods

	self
		assertRule: 'error-messages-as-class-methods'
		caughtIn: 'withdraw: anAmount
	anAmount > balance ifTrue: [ ^self error: ''Insufficient funds'' ].
	balance := balance - anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testGetterReturnsCopy

	self
		assertRule: 'getter-returns-copy'
		caughtIn: 'movements
	^movements'
		fix: [ :s | self does: s include: 'copy' ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testInstanceCreationFormat

	self
		assertRule: 'instance-creation-format'
		caughtIn: 'withOwner: anOwner balance: aBalance
	| account |
	account := self new.
	account setOwner: anOwner balance: aBalance.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testPreferImmutable

	self
		assertRule: 'prefer-immutable'
		caughtIn: 'balance: aBalance
	balance := aBalance'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testReplaceIfWithPolymorphism

	self
		assertRule: 'replace-if-with-polymorphism'
		caughtIn: 'describe
	type = #savings ifTrue: [ ^''Savings account'' ] ifFalse: [ ^''Checking account'' ]'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testValidObjects

	self
		assertRule: 'valid-objects'
		caughtIn: 'withBalance: aBalance
	^self new initializeWithBalance: aBalance'
		fix: [ :s | self does: s include: 'assert' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testDenyOverAssertNot

	self
		assertRule: 'deny-over-assert-not'
		caughtIn: 'testNewAccountHasNoMovements
	self assert: account hasMovements not'
		fix: [ :s | self does: s include: 'deny:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testExceptionBlockShouldNotHaveAssignment

	self
		assertRule: 'exception-block-should-not-have-assignment'
		caughtIn: 'testWithdrawSignalsError
	| result |
	result := [ account withdraw: 1000 ] on: Error do: [ :e | e ].
	self assert: result isNil'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testExceptionBlockSingleSend

	self
		assertRule: 'exception-block-single-send'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ | amount | amount := account balance + 1. account withdraw: amount ] raise: Error withMessageText: ''Insufficient funds'''
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testOneThingPerTest

	self
		assertRule: 'one-thing-per-test'
		caughtIn: 'testAccount
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100.
	account deposit: 50.
	self assert: account balance equals: 150.
	self deny: account isBlocked'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testTestNPrefixPreserved

	self
		assertRule: 'testN-prefix-preserved'
		caughtIn: 'test1
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | ((self firstLineOf: s) beginsWith: 'test1') and: [ (self firstLineOf: s) size > 5 ] ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testTestNameConvention

	self
		assertRule: 'test-name-convention'
		caughtIn: 'testBalance
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testTestingForEquality

	self
		assertRule: 'testing-for-equality'
		caughtIn: 'testAddition
	self assert: 3 = (1 + 2)'
		fix: [ :s | self does: s include: 'equals:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testTestingForExceptionWithSideEffect

	self
		assertRule: 'testing-for-exception-with-side-effect'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ account withdraw: 1000 ] raise: Error'
		fix: [ :s | self does: s include: 'withExceptionDo:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testTestingForExceptionWithoutSideEffect

	self
		assertRule: 'testing-for-exception-without-side-effect'
		caughtIn: 'testCannotCreateWithNegativeBalance
	[ Account withBalance: -100 ] on: Error do: [ :e | self assert: e messageText = ''Balance must be positive'' ]'
		fix: [ :s | self does: s include: 'withMessageText:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testDoNotUseAbbreviatedName

	"The names reveal their roles, so this targets the abbreviation rule specifically rather
	than [variable-name-reveals-role]: calc (calculate), aColl (a collection), tot (total),
	elem (element)."

	self
		assertRule: 'do-not-use-abbreviated-name'
		caughtIn: 'calcTotalFor: aColl
	| tot |
	tot := 0.
	aColl do: [ :elem | tot := tot + elem price ].
	^tot'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testMessageKeywordsNames

	self
		assertRule: 'message-keywords-names'
		caughtIn: 'DepositAmount: anAmount
	balance := balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testMessageNames

	self
		assertRule: 'message-names'
		caughtIn: 'calc: anAmount
	^balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testNoSetGet

	self
		assertRule: 'no-set-get'
		caughtIn: 'getBalance
	^balance'
		fix: [ :s | (self firstLineOf: s) notEmpty and: [ ((self firstLineOf: s) asLowercase beginsWith: 'get') not ] ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testParameterPrefix

	self
		assertRule: 'parameter-prefix'
		caughtIn: 'withBalance: balance
	^self new initializeWithBalance: balance'
		fix: [ :s | self does: s include: 'aBalance' ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testVariableNameRevealsRole

	self
		assertRule: 'variable-name-reveals-role'
		caughtIn: 'total
	| aCollection |
	aCollection := self movements.
	^aCollection inject: 0 into: [ :acc :each | acc + each amount ]'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testAndOrOverBooleanOperators

	self
		assertRule: 'and-or-over-&&-||'
		caughtIn: 'isValid
	^(balance > 0) && (owner notNil)'
		fix: [ :s | self does: s include: 'and:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testAndOrTakeBlocks

	self
		assertRule: 'and-or-take-blocks'
		caughtIn: 'isValid
	^balance > 0 and: owner notNil'
		fix: [ :s | self does: s include: 'and: [' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testIfEmptyOverIsEmptyIfTrue

	self
		assertRule: 'ifEmpty-over-isEmpty-ifTrue'
		caughtIn: 'firstMovementOrDefault
	movements isEmpty ifTrue: [ ^self defaultMovement ].
	^movements first'
		fix: [ :s | self does: s include: 'ifEmpty:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testIfNilOverIsNilIfTrue

	self
		assertRule: 'ifNil-over-isNil-ifTrue'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^self defaultName ].
	^owner name'
		fix: [ :s | self does: s include: 'ifNil:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testIfTrueIfFalse

	self
		assertRule: 'ifTrue-ifFalse'
		caughtIn: 'label
	^self isBlocked ifFalse: [ ''Active'' ] ifTrue: [ ''Blocked'' ]'
		fix: [ :s | | t f |
			t := self firstIndexOf: 'ifTrue:' in: s.
			f := self firstIndexOf: 'ifFalse:' in: s.
			t > 0 and: [ f = 0 or: [ t < f ] ] ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testIsNilOverEqualNil

	self
		assertRule: 'isNil-over-equal-nil'
		caughtIn: 'hasNoOwner
	^owner = nil'
		fix: [ :s | self does: s include: 'isNil' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testPreferEqualOverIdentity

	self
		assertRule: 'prefer-equal-over-identity'
		caughtIn: 'hasSameNameAs: anAccount
	^name == anAccount name'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testRedundantIfTrueCondition

	self
		assertRule: 'redundant-ifTrue-condition'
		caughtIn: 'currentBalance
	self isActive = true ifTrue: [ ^self balance ].
	^0'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'syntax rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testNoExtraParenthesis

	self
		assertRule: 'no-extra-parenthesis'
		caughtIn: 'negatedBalance
	^(self balance) negated'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
setUp

	"A fresh mentor per test, used to build the prompt and parse replies."

	mentor := SmalltalkMentor new! !

!SmalltalkMentorRuleTest methodsFor: 'collection rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testIsEmptyOverSizeEqualZero

	self
		assertRule: 'isEmpty-over-size-equal-zero'
		caughtIn: 'hasNoMovements
	^movements size = 0'
		fix: [ :s | self does: s include: 'isEmpty' ]! !

!SmalltalkMentorRuleTest methodsFor: 'aconcagua rules tests' stamp: 'HAW 18/Aug/2026, 6:56:15 pm (UTC)'!
testDoNotUseAmount

	self
		assertRule: 'do-not-use-amount'
		caughtIn: 'isPositiveBalance
	^balance amount strictlyPositive'
		fix: [ :s | false ]! !
