'From Cuis7.9 [latest update: #8113] on 7 August 2026 at 5:32:56 pm'!
'Description '!
!provides: 'SmalltalkMentor' 1 2!
SystemOrganization addCategory: #SmalltalkMentor!


!classDefinition: #LLMProvider category: #SmalltalkMentor!
Object subclass: #LLMProvider
	instanceVariableNames: 'name model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'LLMProvider class' category: #SmalltalkMentor!
LLMProvider class
	instanceVariableNames: ''!

!classDefinition: #AnthropicProvider category: #SmalltalkMentor!
LLMProvider subclass: #AnthropicProvider
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'AnthropicProvider class' category: #SmalltalkMentor!
AnthropicProvider class
	instanceVariableNames: ''!

!classDefinition: #GeminiProvider category: #SmalltalkMentor!
LLMProvider subclass: #GeminiProvider
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'GeminiProvider class' category: #SmalltalkMentor!
GeminiProvider class
	instanceVariableNames: ''!

!classDefinition: #OpenAICompatibleProvider category: #SmalltalkMentor!
LLMProvider subclass: #OpenAICompatibleProvider
	instanceVariableNames: 'endpoint keyFilePath'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'OpenAICompatibleProvider class' category: #SmalltalkMentor!
OpenAICompatibleProvider class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentor category: #SmalltalkMentor!
Object subclass: #SmalltalkMentor
	instanceVariableNames: ''
	classVariableNames: 'CurrentProvider Language Providers'
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentor class' category: #SmalltalkMentor!
SmalltalkMentor class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorReview category: #SmalltalkMentor!
Object subclass: #SmalltalkMentorReview
	instanceVariableNames: 'targetClass selector category currentSource suggestedSource rationale window suggestedMorph messages transcriptMorph inputMorph busy language langButton provider'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorReview class' category: #SmalltalkMentor!
SmalltalkMentorReview class
	instanceVariableNames: ''!


!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:42 pm (UTC)'!
authCurlArgs
	"The curl -H authorization argument(s) for this provider, reading the key from its
	key file at request time via $(cat ...). Subclasses answer this."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:48 pm (UTC)'!
bodyForMessages: neutralMessages
	"Render the JSON request body from a collection of neutral {role, content} messages
	(role is 'user' or 'assistant'). Subclasses answer this in their wire format."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:08:07 pm (UTC)'!
completionForMessages: neutralMessages
	"Template method: write the request body, POST it via curl (the image has no TLS), and
	answer the assistant's text. Subclass hooks: #endpoint, #authCurlArgs, #bodyForMessages:,
	#extractTextFrom:."
	| reqPath respPath curl |
	reqPath := '/tmp/smalltalk-mentor-req.json'.
	respPath := '/tmp/smalltalk-mentor-resp.json'.
	reqPath asFileEntry fileContents: (self bodyForMessages: neutralMessages).
	curl := 'curl -sS ', self endpoint,
		' -H "content-type: application/json" ', self authCurlArgs,
		' --data-binary @', reqPath,
		' -o ', respPath.
	OSProcess waitForCommand: curl.
	^self extractTextFrom: respPath asFileEntry fileContents! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:37 pm (UTC)'!
endpoint
	"The full request URL. Subclasses answer this (Gemini folds the model into the URL)."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:56 pm (UTC)'!
extractTextFrom: jsonString
	"Parse the provider's JSON response and answer the assistant's text. Subclasses answer."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:09 pm (UTC)'!
model
	^model! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:18 pm (UTC)'!
model: aString
	model := aString! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:47:51 pm (UTC)'!
name
	^name! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:47:57 pm (UTC)'!
name: aString
	name := aString! !

!LLMProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:48:30 pm (UTC)'!
printOn: aStream
	aStream nextPutAll: (name ifNil: [ self class name ]), ' (', (model ifNil: [ '?' ]), ')'! !

!AnthropicProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:21 pm (UTC)'!
authCurlArgs
	"Anthropic uses x-api-key + a version header. Key from ~/.anthropic/key, or the
	ANTHROPIC_API_KEY env var as a fallback."
	^'-H "anthropic-version: 2023-06-01" -H "x-api-key: $(cat "$HOME/.anthropic/key" 2>/dev/null || printf %s "$ANTHROPIC_API_KEY")"'! !

!AnthropicProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:27 pm (UTC)'!
bodyForMessages: neutralMessages
	"Anthropic Messages API: {model, max_tokens, messages:[{role, content}]} - the neutral
	messages are already in this shape."
	^Json render: (JsonObject new
		at: 'model' put: model;
		at: 'max_tokens' put: 2000;
		at: 'messages' put: neutralMessages asArray;
		yourself)! !

!AnthropicProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:15 pm (UTC)'!
endpoint
	^'https://api.anthropic.com/v1/messages'! !

!AnthropicProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:37 pm (UTC)'!
extractTextFrom: jsonString
	"Anthropic reply: content is a list of blocks; concatenate the text ones."
	| resp |
	resp := Json readFrom: jsonString readStream.
	(resp includesKey: 'error') ifTrue: [
		^self error: 'API error: ', ((resp at: 'error') at: 'message' ifAbsent: [ jsonString ]) ].
	^(resp at: 'content' ifAbsent: [ ^self error: 'No content in reply: ', jsonString ])
		inject: ''
		into: [ :acc :block |
			(block at: 'type' ifAbsent: [ '' ]) = 'text'
				ifTrue: [ acc, (block at: 'text' ifAbsent: [ '' ]) ]
				ifFalse: [ acc ] ]! !

!AnthropicProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:10 pm (UTC)'!
initialize
	name := 'Claude'.
	model := 'claude-opus-4-8'! !

!GeminiProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:53 pm (UTC)'!
authCurlArgs
	"Gemini uses the x-goog-api-key header. Key from ~/.gemini/key."
	^'-H "x-goog-api-key: $(cat "$HOME/.gemini/key" 2>/dev/null)"'! !

!GeminiProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:51:00 pm (UTC)'!
bodyForMessages: neutralMessages
	"Gemini generateContent: {contents:[{role, parts:[{text}]}], generationConfig}. Roles
	are 'user' and 'model' (assistant -> model)."
	| contents |
	contents := neutralMessages collect: [ :m |
		JsonObject new
			at: 'role' put: ((m at: 'role') = 'assistant' ifTrue: [ 'model' ] ifFalse: [ 'user' ]);
			at: 'parts' put: { JsonObject new at: 'text' put: (m at: 'content'); yourself };
			yourself ].
	^Json render: (JsonObject new
		at: 'contents' put: contents asArray;
		at: 'generationConfig' put: (JsonObject new at: 'maxOutputTokens' put: 2000; yourself);
		yourself)! !

!GeminiProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:47 pm (UTC)'!
endpoint
	"Gemini folds the model into the URL path."
	^'https://generativelanguage.googleapis.com/v1beta/models/', model, ':generateContent'! !

!GeminiProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:51:09 pm (UTC)'!
extractTextFrom: jsonString
	"Gemini reply: candidates first content parts, concatenated."
	| resp candidates parts |
	resp := Json readFrom: jsonString readStream.
	(resp includesKey: 'error') ifTrue: [
		^self error: 'API error: ', ((resp at: 'error') at: 'message' ifAbsent: [ jsonString ]) ].
	candidates := resp at: 'candidates' ifAbsent: [ ^self error: 'No candidates in reply: ', jsonString ].
	candidates isEmpty ifTrue: [ ^self error: 'Empty candidates (possibly blocked): ', jsonString ].
	parts := (candidates first at: 'content' ifAbsent: [ ^self error: 'No content in candidate: ', jsonString ])
		at: 'parts' ifAbsent: [ ^self error: 'No parts in content: ', jsonString ].
	^parts inject: '' into: [ :acc :p | acc, (p at: 'text' ifAbsent: [ '' ]) ]! !

!GeminiProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:34 pm (UTC)'!
initialize
	name := 'Gemini'.
	model := 'gemini-2.0-flash'! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:15 pm (UTC)'!
authCurlArgs
	"OpenAI-compatible APIs use a Bearer token in the Authorization header."
	^'-H "authorization: Bearer $(cat "', keyFilePath, '" 2>/dev/null)"'! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:21 pm (UTC)'!
bodyForMessages: neutralMessages
	"OpenAI chat/completions: {model, messages:[{role, content}], max_tokens} - the neutral
	messages are already in this shape."
	^Json render: (JsonObject new
		at: 'model' put: model;
		at: 'messages' put: neutralMessages asArray;
		at: 'max_tokens' put: 2000;
		yourself)! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:49 pm (UTC)'!
endpoint
	^endpoint! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:54 pm (UTC)'!
endpoint: aString
	endpoint := aString! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:29 pm (UTC)'!
extractTextFrom: jsonString
	"OpenAI-compatible reply: choices first message content."
	| resp choices |
	resp := Json readFrom: jsonString readStream.
	(resp includesKey: 'error') ifTrue: [
		| err |
		err := resp at: 'error'.
		^self error: 'API error: ', (err isString ifTrue: [ err ] ifFalse: [ err at: 'message' ifAbsent: [ jsonString ] ]) ].
	choices := resp at: 'choices' ifAbsent: [ ^self error: 'No choices in reply: ', jsonString ].
	choices isEmpty ifTrue: [ ^self error: 'Empty choices in reply: ', jsonString ].
	^(choices first at: 'message' ifAbsent: [ ^self error: 'No message in choice: ', jsonString ])
		at: 'content' ifAbsent: [ '' ]! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:00 pm (UTC)'!
keyFilePath
	^keyFilePath! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:50:09 pm (UTC)'!
keyFilePath: aString
	keyFilePath := aString! !

!OpenAICompatibleProvider class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:49:44 pm (UTC)'!
name: aName endpoint: anEndpoint model: aModel keyFilePath: aKeyPath
	"Configure an OpenAI-compatible provider (ChatGPT / Deepseek / Nvidia NIM)."
	^self new
		name: aName;
		model: aModel;
		endpoint: anEndpoint;
		keyFilePath: aKeyPath;
		yourself! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:07:50 pm (UTC)'!
askAbout: source
	"Single-shot convenience: review a method source with no follow-up conversation.
	See #completionForMessages: and #promptFor:."
	^self completionForMessages: {
		self userMessage: (self promptFor: source) }! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 7:07:38 pm (UTC)'!
assistantMessage: aString
	^JsonObject new
		at: 'role' put: 'assistant';
		at: 'content' put: aString;
		yourself! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:51:54 pm (UTC)'!
buildProviders
	"The known providers, with sensible default models (change per provider via the menu,
	or with `aProvider model: '...'`). Each reads its key from its own file under ~ ."
	^OrderedCollection new
		add: AnthropicProvider new;
		add: (OpenAICompatibleProvider name: 'ChatGPT'
			endpoint: 'https://api.openai.com/v1/chat/completions'
			model: 'gpt-4o'
			keyFilePath: '$HOME/.openai/key');
		add: (OpenAICompatibleProvider name: 'Deepseek'
			endpoint: 'https://api.deepseek.com/chat/completions'
			model: 'deepseek-chat'
			keyFilePath: '$HOME/.deepseek/key');
		add: (OpenAICompatibleProvider name: 'Nvidia NIM'
			endpoint: 'https://integrate.api.nvidia.com/v1/chat/completions'
			model: 'meta/llama-3.1-70b-instruct'
			keyFilePath: '$HOME/.nvidia/key');
		add: GeminiProvider new;
		yourself! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:52:44 pm (UTC)'!
chooseProvider
	"Menu action: pick the active provider from a list, then its model id. Runs on the UI
	process."
	| names idx chosen answer |
	names := (self providers collect: [ :p | p name ]) asArray.
	idx := PopUpMenu withCaption: 'Choose LLM provider' chooseFrom: names.
	idx = 0 ifTrue: [ ^self ].
	chosen := self providers at: idx.
	answer := self request: 'Model id for ', chosen name initialAnswer: chosen model.
	(answer notNil and: [ answer withBlanksTrimmed notEmpty ])
		ifTrue: [ chosen model: answer withBlanksTrimmed ].
	self provider: chosen.
	self showTransientToast: 'Provider: ', chosen name, ' (', chosen model, ')'! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:52:17 pm (UTC)'!
completionForMessages: aCollectionOfMessages
	"Send a full conversation (neutral {role, content} messages) to the current provider
	and answer the raw assistant text."
	^self provider completionForMessages: aCollectionOfMessages! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:07:02 pm (UTC)'!
currentReviewRules
	"The rules to enforce: the contents of ~/.smalltalk-mentor/rules.md when present and
	non-blank, otherwise the built-in #defaultReviewRules. Uses the shell to read the file
	(avoids resolving $HOME in the image), mirroring the API-key handling."
	| tmp raw |
	tmp := '/tmp/smalltalk-mentor-rules.txt'.
	OSProcess waitForCommand:
		'cat "$HOME/.smalltalk-mentor/rules.md" > ', tmp, ' 2>/dev/null || : > ', tmp.
	raw := [ tmp asFileEntry fileContents asString ] on: Error do: [ :e | '' ].
	raw := raw withBlanksTrimmed.
	^raw isEmpty ifTrue: [ self defaultReviewRules ] ifFalse: [ raw ]! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 6:34:32 pm (UTC)'!
defaultReviewRules
	"Built-in project rules, used when ~/.anthropic/smalltalk-review-rules.md is absent
	or blank. Free text: edit here, or override by creating that file (see
	#reviewRulesFilePath / #writeDefaultReviewRulesFile)."
	^'- Prefer `assert: expected equals: actual` over `assert: expected = actual`
  (and over other `assert:`/`deny:` boolean-equality forms) so a failing test shows
  both the expected and the actual value.'! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 6:12:12 pm (UTC)'!
initialize
	"Run automatically when this package is filed in: register the cmd+0 shortcut."
	self install! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:06:30 pm (UTC)'!
install
	"Register the cmd+0 'Ask Smalltalk Mentor' shortcut on the code editor of the common
	code tools. Idempotent-ish: registering the same spec again just overrides it.
	Evaluate:  SmalltalkMentor install"
	#(BrowserWindow MethodSetWindow DebuggerWindow) do: [ :winClassName |
		(Smalltalk at: winClassName ifAbsent: [ nil ]) ifNotNil: [ :winClass |
			winClass registerAll: { { #SmalltalkEditor. self smalltalkEditorMenuSpecSend } } ] ].
	Transcript show: 'Smalltalk Mentor cmd+0 installed'; newLine! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:07:28 pm (UTC)'!
language
	"The language the mentor should write its rationale / replies in. Default Spanish.
	Change with #language: or #toggleLanguage."
	^Language ifNil: [ 'Spanish' ]! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 3:36:12 pm (UTC)'!
language: aString
	Language := aString! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:52:22 pm (UTC)'!
model
	"The model of the current provider."
	^self provider model! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:52:27 pm (UTC)'!
model: aString
	"Set the model of the current provider."
	self provider model: aString! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:07:44 pm (UTC)'!
parseProposalFrom: aString
	"Extract the JSON object from the provider's reply (tolerating stray prose or ``` fences)
	and parse it. Returns a Dictionary-like JsonObject."
	| start stop json |
	start := aString indexOf: ${.
	stop := aString lastIndexOf: $}.
	(start = 0 or: [ stop < start ]) ifTrue: [
		^self error: 'No JSON object found in the reply: ', aString ].
	json := aString copyFrom: start to: stop.
	^Json readFrom: json readStream! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 3:36:29 pm (UTC)'!
promptFor: source
	"Assemble the review prompt: intro, response language, mandatory project rules, JSON
	output contract, and the method source."
	^'You are a Smalltalk expert reviewing a single method from a Cuis Smalltalk image.

Write the "rationale" field, and all of your conversational replies, in ', self language, '. Do NOT translate Smalltalk code, selectors, or identifiers - "suggestedSource" must remain valid Smalltalk.

Enforce these project-specific review rules. Treat them as mandatory: if the method violates any of them, set canImprove to true, make suggestedSource comply with them, and name the violated rule(s) in the rationale. Also apply your general Smalltalk expertise for any other improvements.
<rules>
', self currentReviewRules, '
</rules>

Reply with ONLY a JSON object (no prose, no markdown fences) of the form:
{"canImprove": true or false, "suggestedSource": "<a complete, compilable method with the SAME selector, or an empty string if it is already good>", "rationale": "<one or two sentences>"}
Here is the method:

', source! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:07:33 pm (UTC)'!
provider
	"The currently selected provider (default: the first provider)."
	^CurrentProvider ifNil: [ CurrentProvider := self providers first ]! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:52:10 pm (UTC)'!
provider: aProvider
	CurrentProvider := aProvider! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:51:59 pm (UTC)'!
providers
	"The known LLM providers (cached so per-provider model changes persist for the session)."
	^Providers ifNil: [ Providers := self buildProviders ]! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:28:34 pm (UTC)'!
reviewFromMorph: aMorph
	"Entry point for the cmd+0 shortcut. Runs on the UI process: grab the current
	class/selector/source, capture a copy of the current provider so this conversation is
	bound to its own provider/model, show a 'thinking' toast, then hand off to a background
	review."
	| codeProvider aClass aSelector source category llm |
	codeProvider := aMorph codeProvider.
	codeProvider ifNil: [ ^PopUpMenu inform: 'No code provider - open this in a browser.' ].
	aClass := codeProvider selectedClassOrMetaClass.
	aSelector := codeProvider selectedMessageName.
	(aClass isNil or: [ aSelector isNil ]) ifTrue: [
		^PopUpMenu inform: 'Select a method first, then press cmd+0.' ].
	source := aClass sourceCodeAt: aSelector.
	category := codeProvider selectedMessageCategoryName.
	llm := self provider copy.
	self
		reviewSource: source
		class: aClass
		selector: aSelector
		category: category
		provider: llm
		toast: (self showThinkingToast: 'Smalltalk Mentor is reviewing ', aClass name, '>>', aSelector printString, ' with ', llm name)! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:06:55 pm (UTC)'!
reviewRulesFilePath
	"Where project-specific review rules live."
	^'~/.smalltalk-mentor/rules.md'! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:28:45 pm (UTC)'!
reviewSource: source class: aClass selector: aSelector category: category provider: aProvider toast: aToast
	"Fork the first network call (on aProvider) so the UI is never blocked, then open the
	conversational review window bound to aProvider when the answer arrives. aToast (may be
	nil) is removed once the reply arrives or on error."
	[ [ | messages answer proposal |
	   messages := OrderedCollection with: (self userMessage: (self promptFor: source)).
	   answer := aProvider completionForMessages: messages.
	   messages add: (self assistantMessage: answer).
	   proposal := self parseProposalFrom: answer.
	   UISupervisor whenUIinSafeState: [
		   aToast ifNotNil: [ aToast delete ].
		   SmalltalkMentorReview
			   openFor: aClass
			   selector: aSelector
			   category: category
			   current: source
			   suggested: (proposal at: 'suggestedSource' ifAbsent: [ '' ])
			   rationale: (proposal at: 'rationale' ifAbsent: [ '(no rationale returned)' ])
			   messages: messages
			   provider: aProvider ] ]
		on: Error
		do: [ :e |
			UISupervisor whenUIinSafeState: [
				aToast ifNotNil: [ aToast delete ].
				PopUpMenu inform: 'Smalltalk Mentor review failed: ', e messageText ] ] ] fork! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 9:03:40 pm (UTC)'!
showThinkingToast: aString
	"Create a small transient toast near the top of the World and answer it, so the caller
	can remove it when work finishes. Must be sent on the UI process. Answers nil if there
	is no World."
	| world label box ext |
	world := UISupervisor ui world.
	world ifNil: [ ^nil ].
	label := LabelMorph contents: aString.
	box := LayoutMorph newRow.
	box separation: 12.
	box color: (Color r: 1.0 g: 0.95 b: 0.6).
	box borderColor: Color gray; borderWidth: 1.
	box addMorph: label.
	ext := label morphExtent + (28 @ 18).
	box morphExtent: ext.
	box morphPosition: ((world morphExtent x - ext x) // 2) @ 40.
	world addMorph: box.
	^box! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 6:52:56 pm (UTC)'!
showTransientToast: aString
	"Show a toast that auto-dismisses after a couple of seconds."
	| toast |
	toast := self showThinkingToast: aString.
	[ (Delay forSeconds: 2) wait.
	  UISupervisor whenUIinSafeState: [ toast ifNotNil: [ toast delete ] ] ] fork.
	^toast! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:30:38 pm (UTC)'!
smalltalkEditorMenuSpec
	"A 'Smalltalk Mentor' submenu in the code pane. The first entry declares the submenu
	(numeric fifth = submenu id x1000); the following entries (first // 1000 = 12) land
	inside it. Fields: id, label, shortcutChar, target, selector, icon."
	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Ask for a better version (0)'. $0. SmalltalkMentor. #reviewFromMorph:. #helpIcon }.
		{ 12020. 'Toggle response language (Spanish/English)'. nil. SmalltalkMentor. #toggleLanguage. #helpIcon }.
		{ 12030. 'Choose LLM provider and model...'. nil. SmalltalkMentor. #chooseProvider. #helpIcon }
	}! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 5:13:23 pm (UTC)'!
smalltalkEditorMenuSpecSend
	^MessageSend receiver: self selector: #smalltalkEditorMenuSpec! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:06:43 pm (UTC)'!
toggleLanguage
	"Flip the global default response language between Spanish and English, and briefly
	confirm the new value. Menu action next to 'Ask Smalltalk Mentor'."
	Language := self language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ].
	self showTransientToast: 'Smalltalk Mentor response language: ', self language! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:06:37 pm (UTC)'!
uninstall
	"Remove the shortcut/menu registration.  SmalltalkMentor uninstall"
	#(BrowserWindow MethodSetWindow DebuggerWindow) do: [ :winClassName |
		(Smalltalk at: winClassName ifAbsent: [ nil ]) ifNotNil: [ :winClass |
			winClass unregisterAll: { { #SmalltalkEditor. self smalltalkEditorMenuSpecSend } } ] ].
	Transcript show: 'Smalltalk Mentor cmd+0 uninstalled'; newLine! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 7:07:33 pm (UTC)'!
userMessage: aString
	^JsonObject new
		at: 'role' put: 'user';
		at: 'content' put: aString;
		yourself! !

!SmalltalkMentor class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:07:10 pm (UTC)'!
writeDefaultReviewRulesFile
	"Create ~/.smalltalk-mentor/rules.md seeded with the built-in defaults, only if it does
	not already exist. Gives you a file to start editing.
	Evaluate:  SmalltalkMentor writeDefaultReviewRulesFile"
	| tmp |
	tmp := '/tmp/smalltalk-mentor-rules-seed.txt'.
	tmp asFileEntry fileContents: self defaultReviewRules.
	OSProcess waitForCommand:
		'sh -c ''mkdir -p "$HOME/.smalltalk-mentor"; F="$HOME/.smalltalk-mentor/rules.md"; [ -f "$F" ] || cp ', tmp, ' "$F"'''.
	Transcript show: 'Seeded ', self reviewRulesFilePath, ' (if it did not already exist)'; newLine! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:09:21 pm (UTC)'!
accept
	"Compile the current contents of the right-hand pane into the target class."
	| src |
	src := suggestedMorph text asString.
	src isEmpty ifTrue: [ ^PopUpMenu inform: 'Nothing to compile.' ].
	[ targetClass compile: src classified: category ]
		on: Error
		do: [ :e | ^PopUpMenu inform: 'Compile failed: ', e messageText ].
	Transcript show: 'Compiled Smalltalk Mentor suggestion into ', targetClass name, '>>', selector printString; newLine.
	self closeWindow! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 7:15:06 pm (UTC)'!
appendTranscript: aString
	"Append a line to the dialogue transcript and scroll it to the bottom (must run on
	the UI process)."
	| newText end |
	newText := transcriptMorph text asString, aString, String newLineString.
	transcriptMorph model actualContents: newText asText.
	end := newText size.
	[ transcriptMorph editor selectFrom: end + 1 to: end.
	  transcriptMorph scrollSelectionIntoView ] on: Error do: [ :e | ]! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 5:15:11 pm (UTC)'!
closeWindow
	window ifNotNil: [ window delete ]! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:29:53 pm (UTC)'!
open
	"Build the conversational review window: title shows the provider/model bound to this
	conversation; a transcript of the dialogue; the current | suggested panes; a single-line
	follow-up field (Enter sends); a language toggle; and Send / Compile / Close buttons."
	| col paneRow btnRow currentMorph sendBtn acceptBtn closeBtn rightText |
	window := SystemWindow new.
	window setLabel: 'Smalltalk Mentor - ', targetClass name, '>>', selector printString,
		'  [', provider printString, ']'.
	col := LayoutMorph newColumn.
	transcriptMorph := TextModelMorph withText: ('Smalltalk Mentor: ', rationale, String newLineString) asText.
	rightText := suggestedSource isEmpty ifTrue: [ currentSource ] ifFalse: [ suggestedSource ].
	currentMorph := TextModelMorph withText: currentSource asText.
	suggestedMorph := TextModelMorph withText: rightText asText.
	paneRow := LayoutMorph newRow.
	paneRow addMorph: currentMorph layoutSpec: (LayoutSpec proportionalWidth: 0.5 proportionalHeight: 1.0).
	paneRow addMorph: suggestedMorph layoutSpec: (LayoutSpec proportionalWidth: 0.5 proportionalHeight: 1.0).
	inputMorph := EntryFieldMorph new.
	inputMorph contents: ''.
	inputMorph crAction: [ self sendFollowUp ].
	sendBtn := PluggableButtonMorph model: self action: #sendFollowUp label: 'Send (Enter)'.
	langButton := PluggableButtonMorph model: self action: #switchLanguage label: 'Idioma: ', language.
	acceptBtn := PluggableButtonMorph model: self action: #accept label: 'Compile into ', targetClass name.
	closeBtn := PluggableButtonMorph model: self action: #closeWindow label: 'Close'.
	btnRow := LayoutMorph newRow.
	btnRow addMorph: sendBtn layoutSpec: (LayoutSpec proportionalWidth: 0.32 fixedHeight: 28).
	btnRow addMorph: langButton layoutSpec: (LayoutSpec proportionalWidth: 0.22 fixedHeight: 28).
	btnRow addMorph: acceptBtn layoutSpec: (LayoutSpec proportionalWidth: 0.32 fixedHeight: 28).
	btnRow addMorph: closeBtn layoutSpec: (LayoutSpec proportionalWidth: 0.14 fixedHeight: 28).
	col addMorph: transcriptMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.34).
	col addMorph: paneRow layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.5).
	col addMorph: inputMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 30).
	col addMorph: btnRow layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 34).
	window addMorph: col layoutSpec: LayoutSpec useAll.
	window openInWorld! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:30:04 pm (UTC)'!
postUserContent: contentString transcriptLabel: aLabel
	"Shared engine: append a user turn, show it, and fork the (non-blocking) call to THIS
	conversation's provider, updating the suggestion pane + transcript with the reply.
	Ignored while busy."
	busy == true ifTrue: [ ^self ].
	messages add: (SmalltalkMentor userMessage: contentString).
	self appendTranscript: aLabel.
	self appendTranscript: '(Smalltalk Mentor is thinking...)'.
	busy := true.
	[ [ | answer proposal |
	   answer := provider completionForMessages: messages.
	   messages add: (SmalltalkMentor assistantMessage: answer).
	   proposal := SmalltalkMentor parseProposalFrom: answer.
	   UISupervisor whenUIinSafeState: [ | suggested |
		   suggested := proposal at: 'suggestedSource' ifAbsent: [ '' ].
		   suggested isEmpty ifFalse: [ self setSuggestion: suggested ].
		   self appendTranscript: 'Smalltalk Mentor: ', (proposal at: 'rationale' ifAbsent: [ '(no rationale)' ]).
		   busy := false ] ]
		on: Error
		do: [ :e |
			UISupervisor whenUIinSafeState: [
				self appendTranscript: 'Error: ', e messageText.
				busy := false ] ] ] fork! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:08:57 pm (UTC)'!
sendFollowUp
	"Send the typed follow-up (plus the current suggestion-pane code) to the provider, keeping
	the conversation. Triggered by the Send button or by pressing Enter in the input field."
	| note content |
	busy == true ifTrue: [ ^self ].
	note := inputMorph contents withBlanksTrimmed.
	note isEmpty ifTrue: [ ^self ].
	content := note, String newLineString, String newLineString,
		'For reference, the current version of the method I am looking at is:', String newLineString,
		suggestedMorph text asString, String newLineString, String newLineString,
		'Reply again with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'.
	inputMorph contents: ''.
	self postUserContent: content transcriptLabel: 'You: ', note! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:29:23 pm (UTC)'!
setClass: aClass selector: aSelector category: aCategory current: currentSrc suggested: suggestedSrc rationale: aRationale messages: aMessagesCollection provider: aProvider
	targetClass := aClass.
	selector := aSelector.
	category := aCategory.
	currentSource := currentSrc.
	suggestedSource := suggestedSrc.
	rationale := aRationale.
	messages := aMessagesCollection.
	provider := aProvider.
	language := SmalltalkMentor language.
	busy := false! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 6/Aug/2026, 7:09:07 pm (UTC)'!
setSuggestion: aString
	"Replace the suggestion pane contents (must run on the UI process)."
	suggestedMorph model actualContents: aString asText! !

!SmalltalkMentorReview methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:09:04 pm (UTC)'!
switchLanguage
	"Flip this conversation's language between Spanish and English, relabel the button, and
	ask the provider to restate the current rationale in the new language."
	| content |
	busy == true ifTrue: [ ^self ].
	language := language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ].
	langButton ifNotNil: [ langButton label: 'Idioma: ', language ].
	content := 'From now on, reply in ', language, '. Restate your previous rationale in ', language,
		' without changing suggestedSource. Reply with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'.
	self postUserContent: content transcriptLabel: 'You: (idioma -> ', language, ')'! !

!SmalltalkMentorReview class methodsFor: 'as yet unclassified' stamp: 'HAW 7/Aug/2026, 8:29:06 pm (UTC)'!
openFor: aClass selector: aSelector category: aCategory current: currentSrc suggested: suggestedSrc rationale: aRationale messages: aMessagesCollection provider: aProvider
	^self new
		setClass: aClass
		selector: aSelector
		category: aCategory
		current: currentSrc
		suggested: suggestedSrc
		rationale: aRationale
		messages: aMessagesCollection
		provider: aProvider;
		open! !
SmalltalkMentor initialize!
