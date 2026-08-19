## Testing
- [testing-for-equality] Prefer `assert: expected equals: actual` over `assert: expected = actual`
  (and over other `assert:`/`deny:` boolean-equality forms) so a failing test shows
  both the expected and the actual value.
- [testing-for-exception-with-side-effect] Use `should:raise:withExceptionDo:` when testing that a message send has side effects and should signal an exception. Verify that it has one assertion for the exception messageText and at least one other assertion to verify it did not have effects.
- [testing-for-exception-without-side-effect] Use `should:raise:withMessageText:` when testing that a message send has no side effects and should signal an exception.
- [exception-block-single-send] When testing for exceptions, the block to try should have only the message send that should fail.
- [exception-block-should-not-have-assignment] It does not make sense to assign the result of a message send that signals an exception to a variable, neither to assert that that variable `isNil`
- [deny-over-assert-not] Use `deny:` instead of `assert: condition not` when expecting `condition` to be `false`
- [test-name-convention] Test names should synthesize the setup, exercise and verification of the test.
- [testN-prefix-preserved] If you suggest to change the name of a test and that name has the format `testN` where N is an integer of any number of digits, the new name you suggest should start with the original `testN`
- [one-thing-per-test] Test should only exercise one thing to test

## Naming
- [variable-name-reveals-role] Variable names should not be meaningless and it should reveal the role of the object it is naming, not the type of it
- [do-not-use-abbreviated-name] No name for variables, messages, classes or anything that should be named, should used an abbreviated word.
- [parameter-prefix] Parameter should start with `a` or `an` when code is written in English or `un`, `una`, `unos`, `unas` when code is written in Spanish
- [message-keywords-names] The keywords of a message name should always start with lowercase
- [message-names] Message names should help reading the collaboration, that is when the message is sent to a receiver, as prose
- [no-set-get] Message name should not start with get or set for getters or setters

## Object design
- [error-messages-as-class-methods] Error messages should be define as class methods and not as literal strings
- [complete-objects] Classes should be instantiated with all the necessary parameters so its instances are created completed
- [valid-objects] Objects should be valid from the moment they are created. That means that instance creation messages should have assertions to validate the parameters. The instance creation assertions should be in the class side, not the instance side, and they should be encapsulated in a message.
- [prefer-immutable] Inmutable objects are preferable over mutable ones.
- [avoid-setters-use-syncWith] Setters should be avoided. If they are necessary and a validation has to be made, use a message `syncWith: anotherInstance` that will copy all instance variables from `anotherInstance` that we know is already valid per previous rule
- [getter-returns-copy] Getter should return a copy of the object if it is mutable to avoid breaking encapsulation
- [avoid-breaking-encapsulation] Avoid breaking encapsulation, do not ask, tell
- [avoid-nil] The use of `nil` should be avoided
- [replace-if-with-polymorphism] When possible, replace if with polymorphism 
- [method-complexity] Methods should not have more than 10 message sends or so.
- [method-declarativity] Methods should be declarative and not imperative. Complex expressions should be extracted to methods whose names should represent the meaning of the expression
- [instance-creation-format] Instance creation messages should have the following format:
`keyword1: p1 keyword2: p2 ...

---
instance creation assertions. For example:
self assertIsValidBalance: aBalance.
---

^self new initializeKeyword1: p1 keyword2: p2 ...`

## Boolean
- [and-or-take-blocks] Messages `and:` and `or:` should receive a block as a parameter
- [ifTrue-ifFalse] Prefer `ifTrue:ifFalse:` over `ifFalse:ifTrue:`
- [and-or-over-&&-||] Use `and:` and `or:` messages over `&&` and `||` because the former do short circuit
- [redundant-ifTrue-condition] Do not use `object = true ifTrue:` but `object ifTrue:` unless object can be `nil` in witch case apply the `[avoid-nil]`rule
- [prefer-equal-over-identity] Use `=` over `==` to compare for equality unless we really want to know it is exactly the same object
- [ifEmpty-over-isEmpty-ifTrue] Prefer `ifEmpty:` over `isEmpty ifTrue:`
- [isNil-over-equal-nil] Prefer `isNil` over `= nil ifTrue`. The same for `notNil` over `= nil ifFalse:` or `~= nil ifTrue:`
- [ifNil-over-isNil-ifTrue] Prefer `ifNil:` over `isNil ifTrue:`. The same for `ifNil:ifNotNil:` over `isNil ifTrue: ifFalse:`.

## Collection
- [isEmpty-over-size-equal-zero] Prefer `isEmpty` over `size = 0`

## Aconcagua
- [do-not-use-amount] In a measurement, do not break encapsulation sending `amount message` but send `message` directly to the measurement. For example, prefer `aMeasurement strictlyPositive` over `aMeasurement amount strictlyPositive`

## Chalten

## Syntax
- [no-extra-parenthesis] Avoid unnecessary parenthesis, use the message precedence rules to avoid them as much as possible.
