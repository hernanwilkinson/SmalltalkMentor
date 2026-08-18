'From Cuis7.9 [latest update: #8113] on 17 August 2026 at 1:26:47 pm'!
'Description Rename SmalltalkMentorRuleTest / assertRule:caughtIn:fix: / rules-tests protocols to SmalltalkMentorHeuristicTest / assertHeuristic:caughtIn:fix: / heuristics-tests, matching the "rules" -> "design heuristics" rename.'!
!provides: 'SmalltalkMentorTests' 1 2!
!requires: 'SmalltalkMentor' nil nil nil!
SystemOrganization addCategory: #SmalltalkMentorTests!


!classDefinition: #SmalltalkMentorHeuristicTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorHeuristicTest
	instanceVariableNames: 'mentor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorHeuristicTest class' category: #SmalltalkMentorTests!
SmalltalkMentorHeuristicTest class
	instanceVariableNames: ''!


!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 14/Aug/2026, 12:21:39 pm (UTC)'!
assertHeuristic: heuristicId caughtIn: methodSource fix: aFixBlock
	"Best-of-3 (lenient): up to 3 Opus reviews of methodSource. A run counts if the suggested
	code applies the heuristic (aFixBlock answers true for the suggestedSource) OR the
	rationale cites the heuristic id. Passes if ANY of the 3 runs counts - robust to LLM
	non-determinism. Stops early on the first success."
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

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:56:07 pm (UTC)'!
does: aString include: aSubstring
	"Case-insensitive substring test."
	| s sub |
	s := aString asString asLowercase.
	sub := aSubstring asString asLowercase.
	sub isEmpty ifTrue: [ ^true ].
	sub size > s size ifTrue: [ ^false ].
	1 to: s size - sub size + 1 do: [ :i |
		(s copyFrom: i to: i + sub size - 1) = sub ifTrue: [ ^true ] ].
	^false! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:56:14 pm (UTC)'!
firstIndexOf: aSubstring in: aString
	"First 1-based index of aSubstring in aString (case-insensitive), or 0 if absent."
	| s sub |
	s := aString asString asLowercase.
	sub := aSubstring asString asLowercase.
	(sub isEmpty or: [ sub size > s size ]) ifTrue: [ ^0 ].
	1 to: s size - sub size + 1 do: [ :i |
		(s copyFrom: i to: i + sub size - 1) = sub ifTrue: [ ^i ] ].
	^0! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:56:20 pm (UTC)'!
firstLineOf: aString
	"The first non-blank line of aString, trimmed - useful for reading a suggested method's
	selector line."
	| lines |
	lines := aString lines select: [ :l | l withBlanksTrimmed notEmpty ].
	^lines isEmpty ifTrue: [ '' ] ifFalse: [ lines first withBlanksTrimmed ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:55:55 pm (UTC)'!
provider
	"These tests pin Claude Opus, independent of the globally selected provider."
	^AnthropicProvider new model: 'claude-opus-4-8'; yourself! !

!SmalltalkMentorHeuristicTest methodsFor: 'support' stamp: 'HAW 14/Aug/2026, 6:41:38 pm (UTC)'!
reviewOf: methodSource
	"Ask Claude Opus to review methodSource against the current design heuristics; answer the
	parsed {canImprove, suggestedSource, rationale} proposal. Blocks on the network call."
	| answer |
	answer := self provider completionForMessages: {
		mentor userMessage: (mentor promptFor: methodSource) }.
	^mentor parseProposalFrom: answer! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 8:00:07 pm (UTC)'!
testAvoidBreakingEncapsulation
	self
		assertHeuristic: 'avoid-breaking-encapsulation'
		caughtIn: 'canWithdraw: anAmount from: anAccount
	^anAccount balance >= anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 8:00:13 pm (UTC)'!
testAvoidNil
	self
		assertHeuristic: 'avoid-nil'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^nil ].
	^owner name'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:52 pm (UTC)'!
testAvoidSettersUseSyncWith
	self
		assertHeuristic: 'avoid-setters-use-syncWith'
		caughtIn: 'name: aName
	name := aName'
		fix: [ :s | self does: s include: 'syncWith:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:36 pm (UTC)'!
testCompleteObjects
	self
		assertHeuristic: 'complete-objects'
		caughtIn: 'createAccount
	| account |
	account := Account new.
	account balance: 0.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:30 pm (UTC)'!
testErrorMessagesAsClassMethods
	self
		assertHeuristic: 'error-messages-as-class-methods'
		caughtIn: 'withdraw: anAmount
	anAmount > balance ifTrue: [ ^self error: ''Insufficient funds'' ].
	balance := balance - anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 8:00:00 pm (UTC)'!
testGetterReturnsCopy
	self
		assertHeuristic: 'getter-returns-copy'
		caughtIn: 'movements
	^movements'
		fix: [ :s | self does: s include: 'copy' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 8:09:23 pm (UTC)'!
testInstanceCreationFormat
	self
		assertHeuristic: 'instance-creation-format'
		caughtIn: 'withOwner: anOwner balance: aBalance
	| account |
	account := self new.
	account setOwner: anOwner balance: aBalance.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:46 pm (UTC)'!
testPreferImmutable
	self
		assertHeuristic: 'prefer-immutable'
		caughtIn: 'balance: aBalance
	balance := aBalance'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 8:09:17 pm (UTC)'!
testReplaceIfWithPolymorphism
	self
		assertHeuristic: 'replace-if-with-polymorphism'
		caughtIn: 'describe
	type = #savings ifTrue: [ ^''Savings account'' ] ifFalse: [ ^''Checking account'' ]'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'object design heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:41 pm (UTC)'!
testValidObjects
	self
		assertHeuristic: 'valid-objects'
		caughtIn: 'withBalance: aBalance
	^self new initializeWithBalance: aBalance'
		fix: [ :s | self does: s include: 'assert' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:34 pm (UTC)'!
testDenyOverAssertNot
	self
		assertHeuristic: 'deny-over-assert-not'
		caughtIn: 'testNewAccountHasNoMovements
	self assert: account hasMovements not'
		fix: [ :s | self does: s include: 'deny:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:27 pm (UTC)'!
testExceptionBlockShouldNotHaveAssignment
	self
		assertHeuristic: 'exception-block-should-not-have-assignment'
		caughtIn: 'testWithdrawSignalsError
	| result |
	result := [ account withdraw: 1000 ] on: Error do: [ :e | e ].
	self assert: result isNil'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:22 pm (UTC)'!
testExceptionBlockSingleSend
	self
		assertHeuristic: 'exception-block-single-send'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ | amount | amount := account balance + 1. account withdraw: amount ] raise: Error withMessageText: ''Insufficient funds'''
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:52 pm (UTC)'!
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

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:45 pm (UTC)'!
testTestNPrefixPreserved
	self
		assertHeuristic: 'testN-prefix-preserved'
		caughtIn: 'test1
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | ((self firstLineOf: s) beginsWith: 'test1') and: [ (self firstLineOf: s) size > 5 ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:39 pm (UTC)'!
testTestNameConvention
	self
		assertHeuristic: 'test-name-convention'
		caughtIn: 'testBalance
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:04 pm (UTC)'!
testTestingForEquality
	self
		assertHeuristic: 'testing-for-equality'
		caughtIn: 'testAddition
	self assert: 3 = (1 + 2)'
		fix: [ :s | self does: s include: 'equals:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:10 pm (UTC)'!
testTestingForExceptionWithSideEffect
	self
		assertHeuristic: 'testing-for-exception-with-side-effect'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ account withdraw: 1000 ] raise: Error'
		fix: [ :s | self does: s include: 'withExceptionDo:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'testing heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:16 pm (UTC)'!
testTestingForExceptionWithoutSideEffect
	self
		assertHeuristic: 'testing-for-exception-without-side-effect'
		caughtIn: 'testCannotCreateWithNegativeBalance
	[ Account withBalance: -100 ] on: Error do: [ :e | self assert: e messageText = ''Balance must be positive'' ]'
		fix: [ :s | self does: s include: 'withMessageText:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:12 pm (UTC)'!
testMessageKeywordsNames
	self
		assertHeuristic: 'message-keywords-names'
		caughtIn: 'DepositAmount: anAmount
	balance := balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:18 pm (UTC)'!
testMessageNames
	self
		assertHeuristic: 'message-names'
		caughtIn: 'calc: anAmount
	^balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:24 pm (UTC)'!
testNoSetGet
	self
		assertHeuristic: 'no-set-get'
		caughtIn: 'getBalance
	^balance'
		fix: [ :s | (self firstLineOf: s) notEmpty and: [ ((self firstLineOf: s) asLowercase beginsWith: 'get') not ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 13/Aug/2026, 7:59:06 pm (UTC)'!
testParameterPrefix
	self
		assertHeuristic: 'parameter-prefix'
		caughtIn: 'withBalance: balance
	^self new initializeWithBalance: balance'
		fix: [ :s | self does: s include: 'aBalance' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'naming heuristics tests' stamp: 'HAW 13/Aug/2026, 7:58:58 pm (UTC)'!
testVariableNameRevealsRole
	self
		assertHeuristic: 'variable-name-reveals-role'
		caughtIn: 'total
	| aCollection |
	aCollection := self movements.
	^aCollection inject: 0 into: [ :acc :each | acc + each amount ]'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:03 pm (UTC)'!
testAndOrOverBooleanOperators
	self
		assertHeuristic: 'and-or-over-&&-||'
		caughtIn: 'isValid
	^(balance > 0) && (owner notNil)'
		fix: [ :s | self does: s include: 'and:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 13/Aug/2026, 8:09:28 pm (UTC)'!
testAndOrTakeBlocks
	self
		assertHeuristic: 'and-or-take-blocks'
		caughtIn: 'isValid
	^balance > 0 and: owner notNil'
		fix: [ :s | self does: s include: 'and: [' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:29 pm (UTC)'!
testIfEmptyOverIsEmptyIfTrue
	self
		assertHeuristic: 'ifEmpty-over-isEmpty-ifTrue'
		caughtIn: 'firstMovementOrDefault
	movements isEmpty ifTrue: [ ^self defaultMovement ].
	^movements first'
		fix: [ :s | self does: s include: 'ifEmpty:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:46 pm (UTC)'!
testIfNilOverIsNilIfTrue
	self
		assertHeuristic: 'ifNil-over-isNil-ifTrue'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^self defaultName ].
	^owner name'
		fix: [ :s | self does: s include: 'ifNil:' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 13/Aug/2026, 8:11:05 pm (UTC)'!
testIfTrueIfFalse
	self
		assertHeuristic: 'ifTrue-ifFalse'
		caughtIn: 'label
	^self isBlocked ifFalse: [ ''Active'' ] ifTrue: [ ''Blocked'' ]'
		fix: [ :s | | t f |
			t := self firstIndexOf: 'ifTrue:' in: s.
			f := self firstIndexOf: 'ifFalse:' in: s.
			t > 0 and: [ f = 0 or: [ t < f ] ] ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:38 pm (UTC)'!
testIsNilOverEqualNil
	self
		assertHeuristic: 'isNil-over-equal-nil'
		caughtIn: 'hasNoOwner
	^owner = nil'
		fix: [ :s | self does: s include: 'isNil' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:21 pm (UTC)'!
testPreferEqualOverIdentity
	self
		assertHeuristic: 'prefer-equal-over-identity'
		caughtIn: 'hasSameNameAs: anAccount
	^name == anAccount name'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'boolean heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:12 pm (UTC)'!
testRedundantIfTrueCondition
	self
		assertHeuristic: 'redundant-ifTrue-condition'
		caughtIn: 'currentBalance
	self isActive = true ifTrue: [ ^self balance ].
	^0'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'syntax heuristics tests' stamp: 'HAW 13/Aug/2026, 8:11:11 pm (UTC)'!
testNoExtraParenthesis
	self
		assertHeuristic: 'no-extra-parenthesis'
		caughtIn: 'negatedBalance
	^(self balance) negated'
		fix: [ :s | false ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'running' stamp: 'HAW 14/Aug/2026, 6:41:31 pm (UTC)'!
setUp
	"A fresh mentor per test, used to build the prompt and parse replies."
	mentor := SmalltalkMentor new! !

!SmalltalkMentorHeuristicTest methodsFor: 'collection heuristics tests' stamp: 'HAW 17/Aug/2026, 3:28:52 pm (UTC)'!
testIsEmptyOverSizeEqualZero
	self
		assertHeuristic: 'isEmpty-over-size-equal-zero'
		caughtIn: 'hasNoMovements
	^movements size = 0'
		fix: [ :s | self does: s include: 'isEmpty' ]! !

!SmalltalkMentorHeuristicTest methodsFor: 'aconcagua heuristics tests' stamp: 'HAW 17/Aug/2026, 3:29:00 pm (UTC)'!
testDoNotUseAmount
	self
		assertHeuristic: 'do-not-use-amount'
		caughtIn: 'isPositiveBalance
	^balance amount strictlyPositive'
		fix: [ :s | false ]! !
