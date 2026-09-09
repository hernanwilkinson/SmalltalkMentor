'From Cuis7.9 [latest update: #8158] on 9 September 2026 at 11:16:07 am'!
'Description Make class heuristics method objects and share variable heuristics in a superclass'!
!provides: 'SmalltalkMentorTests' 1 20!
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

!classDefinition: #SmalltalkMentorMethodHeuristicTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorMethodHeuristicTest
	instanceVariableNames: 'fixture fixtureTestCase fixtureSubclass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorMethodHeuristicTest class' category: #SmalltalkMentorTests!
SmalltalkMentorMethodHeuristicTest class
	instanceVariableNames: ''!


!SmalltalkMentorFixedHeuristicTest methodsFor: 'running' stamp: 'HAW 9/Sep/2026, 2:01:36 am (UTC)'!
setUp

	review := SmalltalkMentorClassReview new.
	fixtures := OrderedCollection new! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'running' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
tearDown

	fixtures reverse do: [ :eachFixtureClass | eachFixtureClass removeFromSystem ].
	fixtures := OrderedCollection new! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 2:33:48 am (UTC)'!
newFixture

	^self newFixtureInstanceVariableNames: '' classVariableNames: ''! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 2:01:37 am (UTC)'!
newFixtureClassNamed: aClassNameSymbol superclass: aSuperclass

	| createdClass |

	createdClass := aSuperclass subclass: aClassNameSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'SMMentorFixtures'.
	fixtures add: createdClass.
	^createdClass! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 2:01:37 am (UTC)'!
newFixtureInstanceVariableNames: instanceNames classVariableNames: classNames

	| createdClass |

	createdClass := Object subclass: #SMMentorFixture
		instanceVariableNames: instanceNames
		classVariableNames: classNames
		poolDictionaries: ''
		category: 'SMMentorFixtures'.
	fixtures add: createdClass.
	^createdClass! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 2:33:51 am (UTC)'!
newFixtureWithInstanceVariableNames: aString

	^self newFixtureInstanceVariableNames: aString classVariableNames: ''! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 2:44:02 am (UTC)'!
newTestCaseFixture

	^self newFixtureClassNamed: #SMMentorSampleTest superclass: TestCase! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testClassMustBeReferenced

	| findings |

	findings := (ClassIsReferencedHeuristic for: self newFixture) value.
	self assert: findings notEmpty.
	self assert:
		((ClassIsReferencedHeuristic for: SmalltalkMentorFinding) value) isEmpty! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:34:50 am (UTC)'!
testClassReviewListsOnlyFailingHeuristics

	| classToVerify roots heuristicRoots |

	classToVerify := self newFixtureWithInstanceVariableNames: 'unusedInstanceVariable'.
	roots := review rootNodesFor: classToVerify.
	heuristicRoots := roots select: [ :eachRoot | eachRoot kind = #heuristicRoot ].
	self assert: heuristicRoots notEmpty.
	self deny: (heuristicRoots anySatisfy: [ :eachRoot |
		eachRoot asString includesSubString: '(0)' ]).
	self assert: (heuristicRoots anySatisfy: [ :eachRoot |
		eachRoot asString includesSubString: 'Instance variables' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testClassSideSelectorKeepsPrefixWhenUnprefixedNameIsReserved

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify class compile: 'fixtureName ^1' classified: 'accessing'.
	classToVerify class compile: 'fixtureOwner ^2' classified: 'accessing'.
	findings := (RepeatedClassWordHeuristic for: classToVerify) value.
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'fixtureName' ]).
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'fixtureOwner' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testClassVariableMustBeReadAndWritten

	| classToVerify findings |

	classToVerify := self
		newFixtureInstanceVariableNames: ''
		classVariableNames: 'UnusedClassVariable'.
	findings := (ClassVariablesReadAndWrittenHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding editKind = #variable
			and: [ finding editTarget value = 'UnusedClassVariable' ] ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testExplicitClassReferenceIsFlaggedForSelfOrSelfClass

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify
		compile: 'makeAnother ^SMMentorFixture new'
		classified: 'instance creation'.
	classToVerify compile: 'harmless ^42' classified: 'accessing'.
	classToVerify class
		compile: 'create ^SMMentorFixture new'
		classified: 'instance creation'.
	findings := (SelfOverExplicitClassReferenceHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		(finding title includesSubString: '>>makeAnother')
			and: [ finding title includesSubString: '(may be self class)' ] ]).
	self assert: (findings anySatisfy: [ :finding |
		(finding title includesSubString: 'class>>create')
			and: [ finding title includesSubString: '(may be self)' ] ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: '>>harmless' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testInitializeWithNonAssignmentIsFlagged

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'value'.
	classToVerify compile: 'initializeValue: aValue
	value := aValue.
	self recompute' classified: 'initialization'.
	findings := (OneInitializeMessageHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'does more than assignments' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:20 pm (UTC)'!
testInstanceVariableMustBeReadAndWritten

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'unusedInstanceVariable'.
	findings := (InstanceVariablesReadAndWrittenHeuristic
		for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding editKind = #variable
			and: [ finding editTarget value = 'unusedInstanceVariable' ] ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:20 pm (UTC)'!
testInstanceVariableReadAndWrittenOnlyInSubclassIsNotFlagged

	| superclassToVerify subclass findings |

	superclassToVerify := self newFixtureWithInstanceVariableNames: 'stateUsedInSubclass'.
	subclass := self
		newFixtureClassNamed: #SMMentorFixtureSubclass
		superclass: superclassToVerify.
	subclass compile: 'storeState stateUsedInSubclass := 42' classified: 'accessing'.
	subclass compile: 'state ^stateUsedInSubclass' classified: 'accessing'.
	findings := (InstanceVariablesReadAndWrittenHeuristic
		for: superclassToVerify) value.
	self deny: (findings anySatisfy: [ :finding |
		finding editTarget value = 'stateUsedInSubclass' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testMethodCategoryMustNotBeEmpty

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify organization addCategory: 'unused protocol'.
	findings := (NoEmptyMethodCategoriesHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'unused protocol' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testMethodMustBeCategorized

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify compile: 'looseMethod ^1' classified: 'as yet unclassified'.
	findings := (MethodsAreCategorizedHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding editTarget value asString = 'looseMethod' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testMethodMustHaveSenders

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify compile: 'orphanMethodXyz ^42' classified: 'accessing'.
	findings := (MethodsHaveSendersHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding editTarget value asString = 'orphanMethodXyz' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:34:24 am (UTC)'!
testMethodReviewListsAllHeuristicsPassedWhenNoneFails

	| classToVerify roots |

	classToVerify := self newFixture.
	classToVerify compile: 'answer ^42' classified: 'accessing'.
	roots := (SmalltalkMentorMethodReview
		on: classToVerify
		selector: #answer
		mentor: SmalltalkMentor new) buildRootNodes.
	self assert: roots size equals: 2.
	self assert: roots first kind equals: #allPassed.
	self assert: (roots first payload includesSubString: 'No extra parenthesis')! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:34:27 am (UTC)'!
testMethodReviewListsOnlyFailingHeuristicsThenTheLLMReview

	| classToVerify roots |

	classToVerify := self newFixture.
	classToVerify compile: 'sameAs: anObject ^self == anObject' classified: 'comparing'.
	roots := (SmalltalkMentorMethodReview
		on: classToVerify
		selector: #sameAs:
		mentor: SmalltalkMentor new) buildRootNodes.
	self assert: roots size equals: 2.
	self assert: (roots first asString includesSubString: 'Prefer = over ==').
	self assert: roots last kind equals: #method! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testMultipleInitializeMessagesAreFlagged

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'value'.
	classToVerify compile: 'initialize value := 0' classified: 'initialization'.
	classToVerify compile: 'initializeValue: aValue value := aValue' classified: 'initialization'.
	findings := (OneInitializeMessageHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		(finding title includesSubString: 'multiple initialize messages')
			and: [ finding title includesSubString: '>>initialize' ] ]).
	self assert: (findings anySatisfy: [ :finding |
		(finding title includesSubString: 'multiple initialize messages')
			and: [ finding title includesSubString: '>>initializeValue:' ] ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testMultipleInstanceCreationFunnelsAreFlagged

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'value'.
	classToVerify class
		compile: 'withValue: aValue ^self new initializeValue: aValue'
		classified: 'instance creation'.
	classToVerify class
		compile: 'empty ^self new initializeValue: 0'
		classified: 'instance creation'.
	classToVerify class compile: 'sample ^OrderedCollection new' classified: 'instance creation'.
	findings := (InstanceCreationFunnelHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: '>>withValue:' ]).
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: '>>empty' ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: '>>sample' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testNameRepeatingClassNameWordIsFlagged

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'fixtureName balance'.
	classToVerify compile: 'fixtureBalance ^balance' classified: 'accessing'.
	classToVerify compile: 'balance ^balance' classified: 'accessing'.
	findings := (RepeatedClassWordHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'fixtureName' ]).
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'fixtureBalance' ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: ' - balance' ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: '>>balance' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testOverridesDoNotRepeatTheClassName

	| rootClass classToVerify findings |

	rootClass := self newFixtureClassNamed: #SMFixtureRoot superclass: Object.
	rootClass compile: 'fixtureLabel ^1' classified: 'accessing'.
	classToVerify := self
		newFixtureClassNamed: #SMMentorFixtureChild
		superclass: rootClass.
	classToVerify compile: 'fixtureLabel ^2' classified: 'accessing'.
	findings := (RepeatedClassWordHeuristic for: classToVerify) value.
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'fixtureLabel' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testSentMessageMustHaveImplementer

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify compile: 'callsMissing ^self zzzNoSuchSelectorXyz' classified: 'accessing'.
	findings := (MessagesHaveImplementersHeuristic for: classToVerify) value.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'zzzNoSuchSelectorXyz' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testSharedLeafSubclassProtocolMustBeInRoot

	| rootClass firstLeaf secondLeaf findings |

	rootClass := self newFixtureClassNamed: #SMFixtureRoot superclass: Object.
	firstLeaf := self
		newFixtureClassNamed: #SMFixtureFirstLeaf
		superclass: rootClass.
	secondLeaf := self
		newFixtureClassNamed: #SMFixtureSecondLeaf
		superclass: rootClass.
	firstLeaf compile: 'sharedOperation ^1' classified: 'operations'.
	secondLeaf compile: 'sharedOperation ^2' classified: 'operations'.
	firstLeaf compile: 'onlyInOneLeaf ^0' classified: 'operations'.
	findings := (SharedLeafSubclassProtocolHeuristic for: rootClass) value.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'sharedOperation' ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'onlyInOneLeaf' ]).
	rootClass
		compile: 'sharedOperation ^self subclassResponsibility'
		classified: 'operations'.
	findings := (SharedLeafSubclassProtocolHeuristic for: rootClass) value.
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'sharedOperation' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testSingleAssignmentOnlyInitializeIsNotFlagged

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'value'.
	classToVerify compile: 'initializeValue: aValue value := aValue' classified: 'initialization'.
	findings := (OneInitializeMessageHeuristic for: classToVerify) value.
	self assert: findings isEmpty! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testSingleInstanceCreationFunnelIsNotFlagged

	| classToVerify findings |

	classToVerify := self newFixtureWithInstanceVariableNames: 'value'.
	classToVerify class
		compile: 'withValue: aValue ^self new initializeValue: aValue'
		classified: 'instance creation'.
	classToVerify class compile: 'empty ^self withValue: 0' classified: 'instance creation'.
	findings := (InstanceCreationFunnelHeuristic for: classToVerify) value.
	self assert: findings isEmpty! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:02 pm (UTC)'!
testTestCaseIsNotFlaggedAsUnreferenced

	| findings |

	findings := (ClassIsReferencedHeuristic for: self newTestCaseFixture) value.
	self assert: findings isEmpty! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testTestSelectorsDoNotRepeatTheClassName

	| classToVerify findings |

	classToVerify := self newTestCaseFixture.
	classToVerify compile: 'testSomething ^1' classified: 'tests'.
	findings := (RepeatedClassWordHeuristic for: classToVerify) value.
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'testSomething' ])! !

!SmalltalkMentorFixedHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:50:04 pm (UTC)'!
testUnusedAndWriteOnlyTemporariesAreFlaggedButUsedAndCapturedAreNot

	| classToVerify findings |

	classToVerify := self newFixture.
	classToVerify compile: 'withTemporaries
	| usedTemporary reallyUnused writeOnly |
	usedTemporary := 1.
	writeOnly := 2.
	^usedTemporary' classified: 'accessing'.
	classToVerify compile: 'withCapture
	| shared |
	[ shared := 5 ] value.
	^shared' classified: 'accessing'.
	findings := (NoUnusedTemporariesHeuristic for: classToVerify) value.
	self assert: findings size equals: 2.
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'reallyUnused' ]).
	self assert: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'writeOnly' ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'usedTemporary' ]).
	self deny: (findings anySatisfy: [ :finding |
		finding title includesSubString: 'shared' ])! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 11:41:58 am (UTC)'!
assertHeuristic: heuristicId caughtIn: methodSource fix: aFixBlock

	| reviewAsTestMethod lastProposal caught |

	reviewAsTestMethod := mentor isTestOnlyHeuristic: heuristicId.
	caught := false.
	1 to: 3 do: [ :attempt |
		caught ifFalse: [
			lastProposal := self
				reviewOf: methodSource
				asTestMethod: reviewAsTestMethod.
			caught := self proposal: lastProposal satisfies: aFixBlock orCites: heuristicId ] ].
	self
		assert: caught
		description: (self failureDescriptionFor: heuristicId proposal: lastProposal)! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 11:42:04 am (UTC)'!
failureDescriptionFor: aHeuristicId proposal: aProposal

	^'Heuristic [', aHeuristicId, '] not caught in 3 Opus runs.', String newLineString,
		'Last suggestion: ', (mentor suggestedSourceOf: aProposal), String newLineString,
		'Last rationale: ', (mentor rationaleOf: aProposal)! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 11:42:00 am (UTC)'!
proposal: aProposal satisfies: aFixBlock orCites: aHeuristicId

	^(aFixBlock value: (mentor suggestedSourceOf: aProposal))
		or: [ (mentor rationaleOf: aProposal) includesCaseInsensitive: aHeuristicId ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 2:01:37 am (UTC)'!
provider

	^AnthropicProvider new model: 'claude-opus-4-8'; yourself! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 11:41:54 am (UTC)'!
reviewOf: methodSource asTestMethod: isTestMethod

	| prompt answer |

	prompt := mentor promptFor: methodSource isTestMethod: isTestMethod.
	answer := self provider completionForMessages: { mentor userMessage: prompt }.
	^mentor parseProposalFrom: answer! !

!SmalltalkMentorHeuristicTest methodsFor: 'running' stamp: 'HAW 9/Sep/2026, 2:01:37 am (UTC)'!
setUp

	mentor := SmalltalkMentor new! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:00 am (UTC)'!
testAvoidBreakingEncapsulation

	self
		assertHeuristic: 'avoid-breaking-encapsulation'
		caughtIn: 'canWithdraw: anAmount from: anAccount
	^anAccount balance >= anAmount'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:03 am (UTC)'!
testAvoidNil

	self
		assertHeuristic: 'avoid-nil'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^nil ].
	^owner name'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:17 am (UTC)'!
testAvoidSettersUseSyncWith

	self
		assertHeuristic: 'avoid-setters-use-syncWith'
		caughtIn: 'name: aName
	name := aName'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'syncWith:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:05 am (UTC)'!
testCompleteObjects

	self
		assertHeuristic: 'complete-objects'
		caughtIn: 'createAccount
	| account |
	account := Account new.
	account balance: 0.
	^account'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:08 am (UTC)'!
testErrorMessagesAsClassMethods

	self
		assertHeuristic: 'error-messages-as-class-methods'
		caughtIn: 'withdraw: anAmount
	anAmount > balance ifTrue: [ ^self error: ''Insufficient funds'' ].
	balance := balance - anAmount'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:20 am (UTC)'!
testGetterReturnsCopy

	self
		assertHeuristic: 'getter-returns-copy'
		caughtIn: 'movements
	^movements'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'copy' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:10 am (UTC)'!
testInstanceCreationFormat

	self
		assertHeuristic: 'instance-creation-format'
		caughtIn: 'withOwner: anOwner balance: aBalance
	| account |
	account := self new.
	account setOwner: anOwner balance: aBalance.
	^account'
		fix: [ :suggestedSource | false ]! !

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

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 7/Sep/2026, 10:14:26 pm (UTC)'!
testMoveHelperMethodsToRightClass

	self
		assertHeuristic: 'move-helper-methods-to-right-class'
		caughtIn: 'descriptionFor: aProduct
	^aProduct name , '' - '' , aProduct price printString'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 20/Aug/2026, 9:41:16 pm (UTC)'!
testNoNilPrecondition

	self
		assertHeuristic: 'no-nil-precondition'
		caughtIn: 'withBalance: aBalance

	self assert: aBalance notNil.

	^self new initializeWithBalance: aBalance'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 20/Aug/2026, 9:41:23 pm (UTC)'!
testNoTypePrecondition

	self
		assertHeuristic: 'no-type-precondition'
		caughtIn: 'withBalance: aBalance

	self assert: (aBalance isKindOf: Number).

	^self new initializeWithBalance: aBalance'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:13 am (UTC)'!
testPreferImmutable

	self
		assertHeuristic: 'prefer-immutable'
		caughtIn: 'balance: aBalance
	balance := aBalance'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:15 am (UTC)'!
testReplaceIfWithPolymorphism

	self
		assertHeuristic: 'replace-if-with-polymorphism'
		caughtIn: 'describe
	type = #savings ifTrue: [ ^''Savings account'' ] ifFalse: [ ^''Checking account'' ]'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:23 am (UTC)'!
testValidObjects

	self
		assertHeuristic: 'valid-objects'
		caughtIn: 'withBalance: aBalance
	^self new initializeWithBalance: aBalance'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'assert' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:25 am (UTC)'!
testDenyOverAssertNot

	self
		assertHeuristic: 'deny-over-assert-not'
		caughtIn: 'testNewAccountHasNoMovements
	self assert: account hasMovements not'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'deny:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:18 am (UTC)'!
testExceptionBlockShouldNotHaveAssignment

	self
		assertHeuristic: 'exception-block-should-not-have-assignment'
		caughtIn: 'testWithdrawSignalsError
	| result |
	result := [ account withdraw: 1000 ] on: Error do: [ :e | e ].
	self assert: result isNil'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:20 am (UTC)'!
testExceptionBlockSingleSend

	self
		assertHeuristic: 'exception-block-single-send'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ | amount | amount := account balance + 1. account withdraw: amount ] raise: Error withMessageText: ''Insufficient funds'''
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:22 am (UTC)'!
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
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:55 am (UTC)'!
testTestNPrefixPreserved

	self
		assertHeuristic: 'testN-prefix-preserved'
		caughtIn: 'test1
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :suggestedSource |
			(suggestedSource firstNonBlankLine beginsWith: 'test1')
				and: [ suggestedSource firstNonBlankLine size > 5 ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:29 am (UTC)'!
testTestNameConvention

	self
		assertHeuristic: 'test-name-convention'
		caughtIn: 'testBalance
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:27 am (UTC)'!
testTestingForEquality

	self
		assertHeuristic: 'testing-for-equality'
		caughtIn: 'testAddition
	self assert: 3 = (1 + 2)'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'equals:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:30 am (UTC)'!
testTestingForExceptionWithSideEffect

	self
		assertHeuristic: 'testing-for-exception-with-side-effect'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ account withdraw: 1000 ] raise: Error'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'withExceptionDo:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:33 am (UTC)'!
testTestingForExceptionWithoutSideEffect

	self
		assertHeuristic: 'testing-for-exception-without-side-effect'
		caughtIn: 'testCannotCreateWithNegativeBalance
	[ Account withBalance: -100 ] on: Error do: [ :e | self assert: e messageText = ''Balance must be positive'' ]'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'withMessageText:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 9/Sep/2026, 2:01:37 am (UTC)'!
testDoNotUseAbbreviatedName

	self
		assertHeuristic: 'do-not-use-abbreviated-name'
		caughtIn: 'calcTotalFor: aColl
	| tot |
	tot := 0.
	aColl do: [ :elem | tot := tot + elem price ].
	^tot'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:31 am (UTC)'!
testMessageKeywordsNames

	self
		assertHeuristic: 'message-keywords-names'
		caughtIn: 'DepositAmount: anAmount
	balance := balance + anAmount'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:34 am (UTC)'!
testMessageNames

	self
		assertHeuristic: 'message-names'
		caughtIn: 'calc: anAmount
	^balance + anAmount'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:52 am (UTC)'!
testNoSetGet

	self
		assertHeuristic: 'no-set-get'
		caughtIn: 'getBalance
	^balance'
		fix: [ :suggestedSource |
			suggestedSource firstNonBlankLine notEmpty
				and: [ (suggestedSource firstNonBlankLine asLowercase beginsWith: 'get') not ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:35 am (UTC)'!
testParameterPrefix

	self
		assertHeuristic: 'parameter-prefix'
		caughtIn: 'withBalance: balance
	^self new initializeWithBalance: balance'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'aBalance' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:36 am (UTC)'!
testVariableNameRevealsRole

	self
		assertHeuristic: 'variable-name-reveals-role'
		caughtIn: 'total
	| aCollection |
	aCollection := self movements.
	^aCollection inject: 0 into: [ :acc :each | acc + each amount ]'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:37 am (UTC)'!
testAndOrOverBooleanOperators

	self
		assertHeuristic: 'and-or-over-&&-||'
		caughtIn: 'isValid
	^(balance > 0) && (owner notNil)'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'and:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:40 am (UTC)'!
testAndOrTakeBlocks

	self
		assertHeuristic: 'and-or-take-blocks'
		caughtIn: 'isValid
	^balance > 0 and: owner notNil'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'and: [' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:42 am (UTC)'!
testIfEmptyOverIsEmptyIfTrue

	self
		assertHeuristic: 'ifEmpty-over-isEmpty-ifTrue'
		caughtIn: 'firstMovementOrDefault
	movements isEmpty ifTrue: [ ^self defaultMovement ].
	^movements first'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'ifEmpty:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:44 am (UTC)'!
testIfNilOverIsNilIfTrue

	self
		assertHeuristic: 'ifNil-over-isNil-ifTrue'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^self defaultName ].
	^owner name'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'ifNil:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:57 am (UTC)'!
testIfTrueIfFalse

	self
		assertHeuristic: 'ifTrue-ifFalse'
		caughtIn: 'label
	^self isBlocked ifFalse: [ ''Active'' ] ifTrue: [ ''Blocked'' ]'
		fix: [ :suggestedSource | | trueIndex falseIndex |
			trueIndex := suggestedSource indexOfCaseInsensitive: 'ifTrue:'.
			falseIndex := suggestedSource indexOfCaseInsensitive: 'ifFalse:'.
			trueIndex > 0 and: [ falseIndex = 0 or: [ trueIndex < falseIndex ] ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:46 am (UTC)'!
testIsNilOverEqualNil

	self
		assertHeuristic: 'isNil-over-equal-nil'
		caughtIn: 'hasNoOwner
	^owner = nil'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'isNil' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:39 am (UTC)'!
testPreferEqualOverIdentity

	self
		assertHeuristic: 'prefer-equal-over-identity'
		caughtIn: 'hasSameNameAs: anAccount
	^name == anAccount name'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:41 am (UTC)'!
testRedundantIfTrueCondition

	self
		assertHeuristic: 'redundant-ifTrue-condition'
		caughtIn: 'currentBalance
	self isActive = true ifTrue: [ ^self balance ].
	^0'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'syntax heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:43 am (UTC)'!
testNoExtraParenthesis

	self
		assertHeuristic: 'no-extra-parenthesis'
		caughtIn: 'negatedBalance
	^(self balance) negated'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'collection heuristics tests' stamp: 'HAW 9/Sep/2026, 2:32:49 am (UTC)'!
testIsEmptyOverSizeEqualZero

	self
		assertHeuristic: 'isEmpty-over-size-equal-zero'
		caughtIn: 'hasNoMovements
	^movements size = 0'
		fix: [ :suggestedSource | suggestedSource includesCaseInsensitive: 'isEmpty' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'aconcagua heuristics tests' stamp: 'HAW 9/Sep/2026, 2:33:46 am (UTC)'!
testDoNotUseAmount

	self
		assertHeuristic: 'do-not-use-amount'
		caughtIn: 'isPositiveBalance
	^balance amount strictlyPositive'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'source code format heuristics tests' stamp: 'HAW 20/Aug/2026, 9:41:47 pm (UTC)'!
testAvoidComments

	self
		assertHeuristic: 'avoid-comments'
		caughtIn: 'fullName

	"Answers the full name concatenating the first and the last name"

	^firstName , '' '' , lastName'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'source code format heuristics tests' stamp: 'HAW 20/Aug/2026, 9:41:29 pm (UTC)'!
testKeywordMessageSendFormat

	self
		assertHeuristic: 'keyword-message-send-format'
		caughtIn: 'callDefineClass

	^client callTool: ''smalltalk_define_class'' with: (self arguments: ''definition'' being: ''Object subclass: #Foo'')'
		fix: [ :suggestedSource | false ]! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'running' stamp: 'HAW 9/Sep/2026, 3:05:05 am (UTC)'!
tearDown

	fixtureSubclass ifNotNil: [ fixtureSubclass removeFromSystem ].
	fixture ifNotNil: [ fixture removeFromSystem ].
	fixtureTestCase ifNotNil: [ fixtureTestCase removeFromSystem ]! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:57:19 pm (UTC)'!
assert: aHeuristicClass flags: aSource

	self assert: (aHeuristicClass flags: aSource compiledIn: self fixture)! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:57:26 pm (UTC)'!
assert: aHeuristicClass flagsInClassSide: aSource

	self assert: (aHeuristicClass flags: aSource compiledIn: self fixture class)! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:57:42 pm (UTC)'!
assert: aHeuristicClass flagsInTest: aSource

	self assert: (aHeuristicClass flags: aSource compiledIn: self fixtureTestCase)! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:57:23 pm (UTC)'!
deny: aHeuristicClass flags: aSource

	self deny: (aHeuristicClass flags: aSource compiledIn: self fixture)! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:57:28 pm (UTC)'!
deny: aHeuristicClass flagsInClassSide: aSource

	self deny: (aHeuristicClass flags: aSource compiledIn: self fixture class)! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:57:44 pm (UTC)'!
deny: aHeuristicClass flagsInTest: aSource

	self deny: (aHeuristicClass flags: aSource compiledIn: self fixtureTestCase)! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:22:17 pm (UTC)'!
fixture

	^fixture ifNil: [
		fixture := Object subclass: #SMMentorMethodFixture
			instanceVariableNames: 'value other'
			classVariableNames: ''
			poolDictionaries: ''
			category: 'SMMentorFixtures' ]! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 9/Sep/2026, 3:05:03 am (UTC)'!
fixtureSubclass

	^fixtureSubclass ifNil: [
		fixtureSubclass := self fixture subclass: #SMMentorMethodFixtureSubclass
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'SMMentorFixtures' ]! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'support' stamp: 'HAW 8/Sep/2026, 11:50:23 pm (UTC)'!
fixtureTestCase

	^fixtureTestCase ifNil: [
		fixtureTestCase := TestCase subclass: #SMMentorTestCaseFixture
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'SMMentorFixtures' ]! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:23:06 pm (UTC)'!
testAndWithoutBlockIsFlagged

	self assert: AndOrTakeBlocksHeuristic flags: 'isValid ^value > 0 and: other notNil'.
	self deny: AndOrTakeBlocksHeuristic flags: 'isValid ^value > 0 and: [ other notNil ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:39 pm (UTC)'!
testAssertNotIsFlagged

	self assert: DenyOverAssertNotHeuristic flagsInTest: 'testEmpty self assert: OrderedCollection new notEmpty not'.
	self deny: DenyOverAssertNotHeuristic flagsInTest: 'testEmpty self deny: OrderedCollection new notEmpty'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:37 pm (UTC)'!
testAssertWithEqualIsFlaggedOnlyInTests

	self assert: TestingForEqualityHeuristic flagsInTest: 'testAddition self assert: 3 = (1 + 2)'.
	self deny: TestingForEqualityHeuristic flagsInTest: 'testAddition self assert: 1 + 2 equals: 3'.
	self deny: TestingForEqualityHeuristic flags: 'checkAddition self assert: 3 = (1 + 2)'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:45 pm (UTC)'!
testAssignedFailingSendIsFlagged

	self assert: ExceptionBlockWithoutAssignmentHeuristic flagsInTest: 'testFails | result | result := [ self error: ''x'' ] on: Error do: [ :error | error ]. self assert: result isNil'.
	self deny: ExceptionBlockWithoutAssignmentHeuristic flagsInTest: 'testFails self should: [ self error: ''x'' ] raise: Error withMessageText: ''x'''! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:23:10 pm (UTC)'!
testBooleanOperatorsAreFlagged

	self assert: AndOrOverBooleanOperatorsHeuristic flags: 'isValid ^(value > 0) & (other > 0)'.
	self deny: AndOrOverBooleanOperatorsHeuristic flags: 'isValid ^value > 0 and: [ other > 0 ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:23:12 pm (UTC)'!
testComparisonWithTrueIsFlagged

	self assert: RedundantIfTrueConditionHeuristic flags: 'current ^self isActive = true ifTrue: [ value ] ifFalse: [ 0 ]'.
	self deny: RedundantIfTrueConditionHeuristic flags: 'current ^self isActive ifTrue: [ value ] ifFalse: [ 0 ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:43:53 pm (UTC)'!
testEqualNilIsFlagged

	self assert: ComparisonWithNilHeuristic flags: 'hasNoOwner ^value = nil'.
	self assert: ComparisonWithNilHeuristic flags: 'hasOwner ^value ~= nil'.
	self deny: ComparisonWithNilHeuristic flags: 'hasNoOwner ^value isNil'.
	self deny: ComparisonWithNilHeuristic flags: 'name ^value ifNil: [ 0 ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:42 pm (UTC)'!
testExceptionBlockWithMoreThanOneSendIsFlagged

	self assert: ExceptionBlockSingleSendHeuristic flagsInTest: 'testFails self should: [ | amount | amount := 1. self error: amount ] raise: Error'.
	self deny: ExceptionBlockSingleSendHeuristic flagsInTest: 'testFails self should: [ self error: ''x'' ] raise: Error'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:49 pm (UTC)'!
testGetSetAccessorsAreFlaggedButSetUpAndSettleAreNot

	self assert: NoSetGetHeuristic flags: 'getValue ^value'.
	self assert: NoSetGetHeuristic flags: 'setValue: aValue value := aValue'.
	self deny: NoSetGetHeuristic flags: 'value ^value'.
	self deny: NoSetGetHeuristic flags: 'setUp ^value'.
	self deny: NoSetGetHeuristic flags: 'settle ^value'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:13:17 am (UTC)'!
testHelperMethodIsFlagged

	self assert: MoveHelperMethodToRightClassHeuristic flags: 'descriptionFor: aProduct ^aProduct name , '' - '' , aProduct price printString'.
	self deny: MoveHelperMethodToRightClassHeuristic flags: 'descriptionFor: aProduct ^self value , aProduct name'.
	self deny: MoveHelperMethodToRightClassHeuristic flags: 'describe: aProduct ^value , aProduct name'.
	self deny: MoveHelperMethodToRightClassHeuristic flags: 'total ^42'.
	self deny: MoveHelperMethodToRightClassHeuristic flagsInClassSide: 'describe: aProduct ^aProduct name'.
	self deny: MoveHelperMethodToRightClassHeuristic flags: 'printOn: aStream aStream nextPutAll: ''fixture'''! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:50:40 pm (UTC)'!
testIdentityComparisonIsFlagged

	self assert: EqualityOverIdentityHeuristic flags: 'sameAs: anObject ^self == anObject'.
	self deny: EqualityOverIdentityHeuristic flags: 'equalTo: anObject ^self = anObject'.
	self deny: EqualityOverIdentityHeuristic flags: 'name ^value ifNil: [ 0 ]'.
	self deny: EqualityOverIdentityHeuristic flags: 'comparisons ^#(== ~~)'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:23:08 pm (UTC)'!
testIfFalseIfTrueIsFlagged

	self assert: IfTrueIfFalseOrderHeuristic flags: 'label ^self isEmpty ifFalse: [ ''a'' ] ifTrue: [ ''b'' ]'.
	self deny: IfTrueIfFalseOrderHeuristic flags: 'label ^self isEmpty ifTrue: [ ''b'' ] ifFalse: [ ''a'' ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:23:02 pm (UTC)'!
testInstanceCreationNotFollowingTheFormatIsFlagged

	self assert: InstanceCreationFormatHeuristic flagsInClassSide: 'withValue: aValue | instance | instance := self new. instance value: aValue. ^instance'.
	self deny: InstanceCreationFormatHeuristic flagsInClassSide: 'withValue: aValue self assertIsValid: aValue. ^self new initializeValue: aValue'.
	self deny: InstanceCreationFormatHeuristic flagsInClassSide: 'current ^Smalltalk at: #SMMentorMethodFixture ifAbsent: [ self new ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:44:02 pm (UTC)'!
testIsEmptyIfTrueIsFlagged

	self assert: ConditionalOnEmptyTestHeuristic flags: 'first ^value isEmpty ifTrue: [ 0 ] ifFalse: [ value first ]'.
	self deny: ConditionalOnEmptyTestHeuristic flags: 'first ^value ifEmpty: [ 0 ] ifNotEmpty: [ value first ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:43:59 pm (UTC)'!
testIsNilIfTrueIsFlagged

	self assert: ConditionalOnNilTestHeuristic flags: 'name ^value isNil ifTrue: [ ''none'' ] ifFalse: [ value ]'.
	self deny: ConditionalOnNilTestHeuristic flags: 'name ^value ifNil: [ ''none'' ]'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:23:08 am (UTC)'!
testLongKeywordSendOnOneLineIsFlagged

	self assert: KeywordMessageSendFormatHeuristic flags: 'callIt
	^self value withFirstArgument: self other withSecondArgument: self value withThirdArgument: self other'.
	self deny: KeywordMessageSendFormatHeuristic flags: 'callIt
	^self value
		withFirstArgument: self other
		withSecondArgument: self value
		withThirdArgument: self other'.
	self deny: KeywordMessageSendFormatHeuristic flags: 'withFirstArgument: aFirst withSecondArgument: aSecond withThirdArgument: aThird withFourthArgument: aFourth
	^aFirst'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:58 pm (UTC)'!
testMethodWithMoreThanTenSendsIsFlagged

	self assert: MethodComplexityHeuristic flags: 'report ^self value size + self other size + self value size + self other size + self value size + self other size'.
	self deny: MethodComplexityHeuristic flags: 'report ^self value size'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:51 pm (UTC)'!
testNilPreconditionIsFlaggedOnlyInClassSide

	self assert: NoNilPreconditionHeuristic flagsInClassSide: 'withValue: aValue self assert: aValue notNil. ^self new'.
	self deny: NoNilPreconditionHeuristic flagsInClassSide: 'withValue: aValue self assert: aValue > 0. ^self new'.
	self deny: NoNilPreconditionHeuristic flags: 'checkValue self assert: value notNil'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 3:05:07 am (UTC)'!
testPolymorphicDefaultOverriddenInSubclassIsNotAHelper

	self fixtureSubclass compile: 'isSpecial: anObject ^true' classified: 'fixture'.
	self deny: MoveHelperMethodToRightClassHeuristic flags: 'isSpecial: anObject ^false'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 6:51:52 am (UTC)'!
testQuotedSymbolLiteralIsNotConfusedWithCode

	self deny: EqualityOverIdentityHeuristic flags: 'identitySelector ^#''=='''.
	self deny: IfTrueIfFalseOrderHeuristic flags: 'blockOpener ^#''['''! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:35:47 pm (UTC)'!
testSetterIsFlagged

	self assert: AvoidSettersHeuristic flags: 'value: aValue value := aValue'.
	self deny: AvoidSettersHeuristic flags: 'value ^value'.
	self deny: AvoidSettersHeuristic flags: 'syncWith: anInstance value := anInstance value'.
	self deny: AvoidSettersHeuristic flags: 'initializeValue: aValue value := aValue'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:43:55 pm (UTC)'!
testSizeEqualZeroIsFlagged

	self assert: SizeComparedWithZeroHeuristic flags: 'hasNone ^value size = 0'.
	self deny: SizeComparedWithZeroHeuristic flags: 'hasNone ^value isEmpty'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:54 pm (UTC)'!
testTypePreconditionIsFlagged

	self assert: NoTypePreconditionHeuristic flagsInClassSide: 'withValue: aValue self assert: (aValue isKindOf: Number). ^self new'.
	self deny: NoTypePreconditionHeuristic flagsInClassSide: 'withValue: aValue self assert: aValue > 0. ^self new'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:33:10 pm (UTC)'!
testUnnecessaryParenthesisIsFlagged

	self assert: NoExtraParenthesisHeuristic flags: 'valueSize ^(self value) size'.
	self deny: NoExtraParenthesisHeuristic flags: 'valueSize ^self value size'.
	self deny: NoExtraParenthesisHeuristic flags: 'total ^2 * (value + 1)'! !

!SmalltalkMentorMethodHeuristicTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:22:47 pm (UTC)'!
testUppercaseKeywordIsFlagged

	self assert: MessageKeywordsLowercaseHeuristic flags: 'DepositAmount: anAmount ^anAmount'.
	self deny: MessageKeywordsLowercaseHeuristic flags: 'deposit: anAmount ^anAmount'! !

!Behavior methodsFor: '*SmalltalkMentorTests' stamp: 'HAW 8/Sep/2026, 11:50:31 pm (UTC)'!
compiledMethodFor: aSource classified: aCategory

	^self >> (self compile: aSource classified: aCategory)! !

!CharacterSequence methodsFor: '*SmalltalkMentorTests' stamp: 'HAW 9/Sep/2026, 3:08:16 am (UTC)'!
firstNonBlankLine

	^(self lines detect: [ :each | each withBlanksTrimmed notEmpty ] ifNone: [ '' ])
		withBlanksTrimmed! !

!CharacterSequence methodsFor: '*SmalltalkMentorTests' stamp: 'HAW 9/Sep/2026, 2:31:46 am (UTC)'!
includesCaseInsensitive: aSubstring

	^self asLowercase includesSubString: aSubstring asLowercase! !

!CharacterSequence methodsFor: '*SmalltalkMentorTests' stamp: 'HAW 9/Sep/2026, 2:31:49 am (UTC)'!
indexOfCaseInsensitive: aSubstring

	^self asLowercase findString: aSubstring asLowercase! !

!SmalltalkMethodHeuristic class methodsFor: '*SmalltalkMentorTests' stamp: 'HAW 8/Sep/2026, 11:59:46 pm (UTC)'!
flags: aSource compiledIn: aClassOrMetaclass

	| method |

	method := aClassOrMetaclass compiledMethodFor: aSource classified: 'fixture'.
	^(self for: method) value notEmpty! !
