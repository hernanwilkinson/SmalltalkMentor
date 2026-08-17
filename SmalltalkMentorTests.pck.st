'From Cuis7.9 [latest update: #8113] on 17 August 2026 at 1:26:47 pm'!
'Description '!
!provides: 'SmalltalkMentorTests' 1 1!
!requires: 'SmalltalkMentor' nil nil nil!
SystemOrganization addCategory: #SmalltalkMentorTests!


!classDefinition: #SmalltalkMentorRuleTest category: #SmalltalkMentorTests!
TestCase subclass: #SmalltalkMentorRuleTest
	instanceVariableNames: 'mentor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentorTests'!
!classDefinition: 'SmalltalkMentorRuleTest class' category: #SmalltalkMentorTests!
SmalltalkMentorRuleTest class
	instanceVariableNames: ''!


!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 14/Aug/2026, 12:21:39 pm (UTC)'!
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

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:56:07 pm (UTC)'!
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

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:56:14 pm (UTC)'!
firstIndexOf: aSubstring in: aString
	"First 1-based index of aSubstring in aString (case-insensitive), or 0 if absent."
	| s sub |
	s := aString asString asLowercase.
	sub := aSubstring asString asLowercase.
	(sub isEmpty or: [ sub size > s size ]) ifTrue: [ ^0 ].
	1 to: s size - sub size + 1 do: [ :i |
		(s copyFrom: i to: i + sub size - 1) = sub ifTrue: [ ^i ] ].
	^0! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:56:20 pm (UTC)'!
firstLineOf: aString
	"The first non-blank line of aString, trimmed - useful for reading a suggested method's
	selector line."
	| lines |
	lines := aString lines select: [ :l | l withBlanksTrimmed notEmpty ].
	^lines isEmpty ifTrue: [ '' ] ifFalse: [ lines first withBlanksTrimmed ]! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 13/Aug/2026, 7:55:55 pm (UTC)'!
provider
	"These tests pin Claude Opus, independent of the globally selected provider."
	^AnthropicProvider new model: 'claude-opus-4-8'; yourself! !

!SmalltalkMentorRuleTest methodsFor: 'support' stamp: 'HAW 14/Aug/2026, 6:41:38 pm (UTC)'!
reviewOf: methodSource
	"Ask Claude Opus to review methodSource against the current rules; answer the parsed
	{canImprove, suggestedSource, rationale} proposal. Blocks on the network call."
	| answer |
	answer := self provider completionForMessages: {
		mentor userMessage: (mentor promptFor: methodSource) }.
	^mentor parseProposalFrom: answer! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 8:00:07 pm (UTC)'!
testAvoidBreakingEncapsulation
	self
		assertRule: 'avoid-breaking-encapsulation'
		caughtIn: 'canWithdraw: anAmount from: anAccount
	^anAccount balance >= anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 8:00:13 pm (UTC)'!
testAvoidNil
	self
		assertRule: 'avoid-nil'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^nil ].
	^owner name'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 7:59:52 pm (UTC)'!
testAvoidSettersUseSyncWith
	self
		assertRule: 'avoid-setters-use-syncWith'
		caughtIn: 'name: aName
	name := aName'
		fix: [ :s | self does: s include: 'syncWith:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 7:59:36 pm (UTC)'!
testCompleteObjects
	self
		assertRule: 'complete-objects'
		caughtIn: 'createAccount
	| account |
	account := Account new.
	account balance: 0.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 7:59:30 pm (UTC)'!
testErrorMessagesAsClassMethods
	self
		assertRule: 'error-messages-as-class-methods'
		caughtIn: 'withdraw: anAmount
	anAmount > balance ifTrue: [ ^self error: ''Insufficient funds'' ].
	balance := balance - anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 8:00:00 pm (UTC)'!
testGetterReturnsCopy
	self
		assertRule: 'getter-returns-copy'
		caughtIn: 'movements
	^movements'
		fix: [ :s | self does: s include: 'copy' ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 8:09:23 pm (UTC)'!
testInstanceCreationFormat
	self
		assertRule: 'instance-creation-format'
		caughtIn: 'withOwner: anOwner balance: aBalance
	| account |
	account := self new.
	account setOwner: anOwner balance: aBalance.
	^account'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 7:59:46 pm (UTC)'!
testPreferImmutable
	self
		assertRule: 'prefer-immutable'
		caughtIn: 'balance: aBalance
	balance := aBalance'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 8:09:17 pm (UTC)'!
testReplaceIfWithPolymorphism
	self
		assertRule: 'replace-if-with-polymorphism'
		caughtIn: 'describe
	type = #savings ifTrue: [ ^''Savings account'' ] ifFalse: [ ^''Checking account'' ]'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'object design rules tests' stamp: 'HAW 13/Aug/2026, 7:59:41 pm (UTC)'!
testValidObjects
	self
		assertRule: 'valid-objects'
		caughtIn: 'withBalance: aBalance
	^self new initializeWithBalance: aBalance'
		fix: [ :s | self does: s include: 'assert' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:34 pm (UTC)'!
testDenyOverAssertNot
	self
		assertRule: 'deny-over-assert-not'
		caughtIn: 'testNewAccountHasNoMovements
	self assert: account hasMovements not'
		fix: [ :s | self does: s include: 'deny:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:27 pm (UTC)'!
testExceptionBlockShouldNotHaveAssignment
	self
		assertRule: 'exception-block-should-not-have-assignment'
		caughtIn: 'testWithdrawSignalsError
	| result |
	result := [ account withdraw: 1000 ] on: Error do: [ :e | e ].
	self assert: result isNil'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:22 pm (UTC)'!
testExceptionBlockSingleSend
	self
		assertRule: 'exception-block-single-send'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ | amount | amount := account balance + 1. account withdraw: amount ] raise: Error withMessageText: ''Insufficient funds'''
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:52 pm (UTC)'!
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

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:45 pm (UTC)'!
testTestNPrefixPreserved
	self
		assertRule: 'testN-prefix-preserved'
		caughtIn: 'test1
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | ((self firstLineOf: s) beginsWith: 'test1') and: [ (self firstLineOf: s) size > 5 ] ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:39 pm (UTC)'!
testTestNameConvention
	self
		assertRule: 'test-name-convention'
		caughtIn: 'testBalance
	| account |
	account := Account withBalance: 100.
	self assert: account balance equals: 100'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:04 pm (UTC)'!
testTestingForEquality
	self
		assertRule: 'testing-for-equality'
		caughtIn: 'testAddition
	self assert: 3 = (1 + 2)'
		fix: [ :s | self does: s include: 'equals:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:10 pm (UTC)'!
testTestingForExceptionWithSideEffect
	self
		assertRule: 'testing-for-exception-with-side-effect'
		caughtIn: 'testWithdrawMoreThanBalance
	self should: [ account withdraw: 1000 ] raise: Error'
		fix: [ :s | self does: s include: 'withExceptionDo:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'testing rules tests' stamp: 'HAW 13/Aug/2026, 7:58:16 pm (UTC)'!
testTestingForExceptionWithoutSideEffect
	self
		assertRule: 'testing-for-exception-without-side-effect'
		caughtIn: 'testCannotCreateWithNegativeBalance
	[ Account withBalance: -100 ] on: Error do: [ :e | self assert: e messageText = ''Balance must be positive'' ]'
		fix: [ :s | self does: s include: 'withMessageText:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 13/Aug/2026, 7:59:12 pm (UTC)'!
testMessageKeywordsNames
	self
		assertRule: 'message-keywords-names'
		caughtIn: 'DepositAmount: anAmount
	balance := balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 13/Aug/2026, 7:59:18 pm (UTC)'!
testMessageNames
	self
		assertRule: 'message-names'
		caughtIn: 'calc: anAmount
	^balance + anAmount'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 13/Aug/2026, 7:59:24 pm (UTC)'!
testNoSetGet
	self
		assertRule: 'no-set-get'
		caughtIn: 'getBalance
	^balance'
		fix: [ :s | (self firstLineOf: s) notEmpty and: [ ((self firstLineOf: s) asLowercase beginsWith: 'get') not ] ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 13/Aug/2026, 7:59:06 pm (UTC)'!
testParameterPrefix
	self
		assertRule: 'parameter-prefix'
		caughtIn: 'withBalance: balance
	^self new initializeWithBalance: balance'
		fix: [ :s | self does: s include: 'aBalance' ]! !

!SmalltalkMentorRuleTest methodsFor: 'naming rules tests' stamp: 'HAW 13/Aug/2026, 7:58:58 pm (UTC)'!
testVariableNameRevealsRole
	self
		assertRule: 'variable-name-reveals-role'
		caughtIn: 'total
	| aCollection |
	aCollection := self movements.
	^aCollection inject: 0 into: [ :acc :each | acc + each amount ]'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 17/Aug/2026, 3:28:03 pm (UTC)'!
testAndOrOverBooleanOperators
	self
		assertRule: 'and-or-over-&&-||'
		caughtIn: 'isValid
	^(balance > 0) && (owner notNil)'
		fix: [ :s | self does: s include: 'and:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 13/Aug/2026, 8:09:28 pm (UTC)'!
testAndOrTakeBlocks
	self
		assertRule: 'and-or-take-blocks'
		caughtIn: 'isValid
	^balance > 0 and: owner notNil'
		fix: [ :s | self does: s include: 'and: [' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 17/Aug/2026, 3:28:29 pm (UTC)'!
testIfEmptyOverIsEmptyIfTrue
	self
		assertRule: 'ifEmpty-over-isEmpty-ifTrue'
		caughtIn: 'firstMovementOrDefault
	movements isEmpty ifTrue: [ ^self defaultMovement ].
	^movements first'
		fix: [ :s | self does: s include: 'ifEmpty:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 17/Aug/2026, 3:28:46 pm (UTC)'!
testIfNilOverIsNilIfTrue
	self
		assertRule: 'ifNil-over-isNil-ifTrue'
		caughtIn: 'ownerName
	owner isNil ifTrue: [ ^self defaultName ].
	^owner name'
		fix: [ :s | self does: s include: 'ifNil:' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 13/Aug/2026, 8:11:05 pm (UTC)'!
testIfTrueIfFalse
	self
		assertRule: 'ifTrue-ifFalse'
		caughtIn: 'label
	^self isBlocked ifFalse: [ ''Active'' ] ifTrue: [ ''Blocked'' ]'
		fix: [ :s | | t f |
			t := self firstIndexOf: 'ifTrue:' in: s.
			f := self firstIndexOf: 'ifFalse:' in: s.
			t > 0 and: [ f = 0 or: [ t < f ] ] ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 17/Aug/2026, 3:28:38 pm (UTC)'!
testIsNilOverEqualNil
	self
		assertRule: 'isNil-over-equal-nil'
		caughtIn: 'hasNoOwner
	^owner = nil'
		fix: [ :s | self does: s include: 'isNil' ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 17/Aug/2026, 3:28:21 pm (UTC)'!
testPreferEqualOverIdentity
	self
		assertRule: 'prefer-equal-over-identity'
		caughtIn: 'hasSameNameAs: anAccount
	^name == anAccount name'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'boolean rules tests' stamp: 'HAW 17/Aug/2026, 3:28:12 pm (UTC)'!
testRedundantIfTrueCondition
	self
		assertRule: 'redundant-ifTrue-condition'
		caughtIn: 'currentBalance
	self isActive = true ifTrue: [ ^self balance ].
	^0'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'syntax rules tests' stamp: 'HAW 13/Aug/2026, 8:11:11 pm (UTC)'!
testNoExtraParenthesis
	self
		assertRule: 'no-extra-parenthesis'
		caughtIn: 'negatedBalance
	^(self balance) negated'
		fix: [ :s | false ]! !

!SmalltalkMentorRuleTest methodsFor: 'running' stamp: 'HAW 14/Aug/2026, 6:41:31 pm (UTC)'!
setUp
	"A fresh mentor per test, used to build the prompt and parse replies."
	mentor := SmalltalkMentor new! !

!SmalltalkMentorRuleTest methodsFor: 'collection rules tests' stamp: 'HAW 17/Aug/2026, 3:28:52 pm (UTC)'!
testIsEmptyOverSizeEqualZero
	self
		assertRule: 'isEmpty-over-size-equal-zero'
		caughtIn: 'hasNoMovements
	^movements size = 0'
		fix: [ :s | self does: s include: 'isEmpty' ]! !

!SmalltalkMentorRuleTest methodsFor: 'aconcagua rules tests' stamp: 'HAW 17/Aug/2026, 3:29:00 pm (UTC)'!
testDoNotUseAmount
	self
		assertRule: 'do-not-use-amount'
		caughtIn: 'isPositiveBalance
	^balance amount strictlyPositive'
		fix: [ :s | false ]! !
