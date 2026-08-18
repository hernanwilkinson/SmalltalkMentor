'From Cuis7.9 [latest update: #8113] on 17 August 2026 at 1:26:33 pm'!
'Description Rename "rules" to "design heuristics" across code and UI (rules -> heuristics, ruleGroups -> heuristicGroups, etc).'!
!provides: 'SmalltalkMentor' 1 22!
!requires: 'JSON' 1 29 nil!
!requires: 'OSProcess' 1 36 nil!
SystemOrganization addCategory: #SmalltalkMentor!


!classDefinition: #SmalltalkMentorNoCopyTextModel category: #SmalltalkMentor!
TextModel subclass: #SmalltalkMentorNoCopyTextModel
	instanceVariableNames: 'styleClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorNoCopyTextModel class' category: #SmalltalkMentor!
SmalltalkMentorNoCopyTextModel class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorTreeMorph category: #SmalltalkMentor!
HierarchicalListMorph subclass: #SmalltalkMentorTreeMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorTreeMorph class' category: #SmalltalkMentor!
SmalltalkMentorTreeMorph class
	instanceVariableNames: ''!

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
	instanceVariableNames: 'endpoint keyFilePath imageKeyBasename'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'OpenAICompatibleProvider class' category: #SmalltalkMentor!
OpenAICompatibleProvider class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentor category: #SmalltalkMentor!
Object subclass: #SmalltalkMentor
	instanceVariableNames: 'provider language'
	classVariableNames: 'Current Providers'
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentor class' category: #SmalltalkMentor!
SmalltalkMentor class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorClassReview category: #SmalltalkMentor!
Object subclass: #SmalltalkMentorClassReview
	instanceVariableNames: 'mentor targetClass window treeMorph detailHolder treeRoots methodReviewCache providerButton thinkingToast selectedIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorClassReview class' category: #SmalltalkMentor!
SmalltalkMentorClassReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorFinding category: #SmalltalkMentor!
Object subclass: #SmalltalkMentorFinding
	instanceVariableNames: 'title detail editKind editTarget'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorFinding class' category: #SmalltalkMentor!
SmalltalkMentorFinding class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorReview category: #SmalltalkMentor!
Object subclass: #SmalltalkMentorReview
	instanceVariableNames: 'targetClass selector category currentSource suggestedSource rationale window suggestedMorph messages transcriptMorph inputMorph busy langButton mentor contentMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorReview class' category: #SmalltalkMentor!
SmalltalkMentorReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorNoCopyEditor category: #SmalltalkMentor!
TextEditor subclass: #SmalltalkMentorNoCopyEditor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorNoCopyEditor class' category: #SmalltalkMentor!
SmalltalkMentorNoCopyEditor class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorNode category: #SmalltalkMentor!
ListItemWrapper subclass: #SmalltalkMentorNode
	instanceVariableNames: 'label childNodes kind'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorNode class' category: #SmalltalkMentor!
SmalltalkMentorNode class
	instanceVariableNames: ''!


!SmalltalkMentorNoCopyTextModel methodsFor: 'accessing' stamp: 'HAW 16/Aug/2026, 9:41:27 pm (UTC)'!
styleClass: aClassOrMetaClass
	"The class context used to syntax-highlight the suggestion as a method."
	styleClass := aClassOrMetaClass! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 16/Aug/2026, 9:41:40 pm (UTC)'!
aboutToStyleWith: anSHTextStyler
	"Style as a method in the reviewed class (classOrMetaClass set, workspace nil = method
	mode, not the red doit mode)."
	anSHTextStyler classOrMetaClass: styleClass.
	^true! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 14/Aug/2026, 6:19:02 pm (UTC)'!
editorClass
	"Use the editor that refuses to copy to the clipboard."
	^SmalltalkMentorNoCopyEditor! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 16/Aug/2026, 9:41:33 pm (UTC)'!
textStylerClass
	"Syntax-highlight the suggestion as Smalltalk."
	^SHTextStylerST80! !

!SmalltalkMentorTreeMorph methodsFor: 'events' stamp: 'HAW 16/Aug/2026, 6:26:10 pm (UTC)'!
mouseButton2Down: aMouseButtonEvent localPosition: localEventPosition
	"Right-click: select the item under the cursor and pop a context menu ('Run again' /
	'Browse') that acts on its node via the model."
	| itemMorph node menu |
	itemMorph := self itemFromPoint: localEventPosition.
	itemMorph ifNil: [ ^super mouseButton2Down: aMouseButtonEvent localPosition: localEventPosition ].
	self setSelectedMorph: itemMorph.
	node := itemMorph complexContents.
	menu := MenuMorph new.
	menu add: 'Run again' target: model action: #runAgainNode: argumentList: { node }.
	menu add: 'Browse' target: model action: #browseNode: argumentList: { node }.
	menu popUpInWorld! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:48:09 pm (UTC)'!
model
	^model! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:48:18 pm (UTC)'!
model: aString
	model := aString! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:47:51 pm (UTC)'!
name
	^name! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:47:57 pm (UTC)'!
name: aString
	name := aString! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 7/Aug/2026, 6:48:30 pm (UTC)'!
printOn: aStream
	aStream nextPutAll: (name ifNil: [ self class name ]), ' (', (model ifNil: [ '?' ]), ')'! !

!LLMProvider methodsFor: 'requesting' stamp: 'HAW 7/Aug/2026, 8:08:07 pm (UTC)'!
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

!LLMProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:48:42 pm (UTC)'!
authCurlArgs
	"The curl -H authorization argument(s) for this provider, reading the key from its
	key file at request time via $(cat ...). Subclasses answer this."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:48:48 pm (UTC)'!
bodyForMessages: neutralMessages
	"Render the JSON request body from a collection of neutral {role, content} messages
	(role is 'user' or 'assistant'). Subclasses answer this in their wire format."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:48:37 pm (UTC)'!
endpoint
	"The full request URL. Subclasses answer this (Gemini folds the model into the URL)."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:48:56 pm (UTC)'!
extractTextFrom: jsonString
	"Parse the provider's JSON response and answer the assistant's text. Subclasses answer."
	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:20:12 pm (UTC)'!
imageKeyPath
	"Absolute path of this provider's key file in the image directory (checked before the
	home-directory key)."
	^SmalltalkMentor imageDirectoryPath, '/', self keyImageBasename! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:20:18 pm (UTC)'!
keyImageBasename
	"File name of this provider's key inside the image directory. Subclasses answer this."
	^self subclassResponsibility! !

!AnthropicProvider methodsFor: 'initialization' stamp: 'HAW 7/Aug/2026, 6:49:10 pm (UTC)'!
initialize
	name := 'Claude'.
	model := 'claude-opus-4-8'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:20:29 pm (UTC)'!
authCurlArgs
	"Anthropic uses x-api-key + a version header. Key looked up: image dir, then
	~/.anthropic/key, then the ANTHROPIC_API_KEY env var."
	^'-H "anthropic-version: 2023-06-01" -H "x-api-key: $(cat "', self imageKeyPath, '" 2>/dev/null || cat "$HOME/.anthropic/key" 2>/dev/null || printf %s "$ANTHROPIC_API_KEY")"'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:49:27 pm (UTC)'!
bodyForMessages: neutralMessages
	"Anthropic Messages API: {model, max_tokens, messages:[{role, content}]} - the neutral
	messages are already in this shape."
	^Json render: (JsonObject new
		at: 'model' put: model;
		at: 'max_tokens' put: 2000;
		at: 'messages' put: neutralMessages asArray;
		yourself)! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:49:15 pm (UTC)'!
endpoint
	^'https://api.anthropic.com/v1/messages'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:49:37 pm (UTC)'!
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

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:20:23 pm (UTC)'!
keyImageBasename
	^'anthropic.key'! !

!GeminiProvider methodsFor: 'initialization' stamp: 'HAW 7/Aug/2026, 6:50:34 pm (UTC)'!
initialize
	name := 'Gemini'.
	model := 'gemini-2.0-flash'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:20:40 pm (UTC)'!
authCurlArgs
	"Gemini uses the x-goog-api-key header. Key looked up: image dir, then ~/.gemini/key."
	^'-H "x-goog-api-key: $(cat "', self imageKeyPath, '" 2>/dev/null || cat "$HOME/.gemini/key" 2>/dev/null)"'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:51:00 pm (UTC)'!
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

!GeminiProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:50:47 pm (UTC)'!
endpoint
	"Gemini folds the model into the URL path."
	^'https://generativelanguage.googleapis.com/v1beta/models/', model, ':generateContent'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:51:09 pm (UTC)'!
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

!GeminiProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:20:34 pm (UTC)'!
keyImageBasename
	^'gemini.key'! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:49:49 pm (UTC)'!
endpoint
	^endpoint! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:49:54 pm (UTC)'!
endpoint: aString
	endpoint := aString! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 2:21:03 pm (UTC)'!
imageKeyBasename: aString
	imageKeyBasename := aString! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:50:00 pm (UTC)'!
keyFilePath
	^keyFilePath! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 7/Aug/2026, 6:50:09 pm (UTC)'!
keyFilePath: aString
	keyFilePath := aString! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:21:14 pm (UTC)'!
authCurlArgs
	"OpenAI-compatible APIs use a Bearer token. Key looked up: image dir, then the provider's
	home key file."
	^'-H "authorization: Bearer $(cat "', self imageKeyPath, '" 2>/dev/null || cat "', keyFilePath, '" 2>/dev/null)"'! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:50:21 pm (UTC)'!
bodyForMessages: neutralMessages
	"OpenAI chat/completions: {model, messages:[{role, content}], max_tokens} - the neutral
	messages are already in this shape."
	^Json render: (JsonObject new
		at: 'model' put: model;
		at: 'messages' put: neutralMessages asArray;
		at: 'max_tokens' put: 2000;
		yourself)! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 7/Aug/2026, 6:50:29 pm (UTC)'!
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

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:21:08 pm (UTC)'!
keyImageBasename
	^imageKeyBasename! !

!OpenAICompatibleProvider class methodsFor: 'instance creation' stamp: 'HAW 14/Aug/2026, 2:20:57 pm (UTC)'!
name: aName endpoint: anEndpoint model: aModel keyFilePath: aKeyPath imageKeyBasename: anImageBasename
	"Configure an OpenAI-compatible provider (ChatGPT / Deepseek / Nvidia NIM)."
	^self new
		name: aName;
		model: aModel;
		endpoint: anEndpoint;
		keyFilePath: aKeyPath;
		imageKeyBasename: anImageBasename;
		yourself! !

!SmalltalkMentor methodsFor: 'initialization' stamp: 'HAW 14/Aug/2026, 6:50:48 pm (UTC)'!
initialize
	"Start with the first provider selected and Spanish as the response language."
	provider := SmalltalkMentor providers first.
	language := 'Spanish'! !

!SmalltalkMentor methodsFor: 'copying' stamp: 'HAW 14/Aug/2026, 6:51:09 pm (UTC)'!
postCopy
	"A copied mentor gets its own frozen provider, so a review keeps its provider/model even
	if the shared mentor's provider or model later changes."
	super postCopy.
	provider := provider copy! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:37:57 pm (UTC)'!
imageDirectoryPath
	
	^self class imageDirectoryPath ! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:08:23 pm (UTC)'!
language
	^language! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:08:30 pm (UTC)'!
language: aLanguage
	language := aLanguage! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
model
	"The model of the current provider."
	^self provider model! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
model: aString
	"Set the model of the current provider."
	self provider model: aString! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:50:54 pm (UTC)'!
provider
	^provider! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:51:02 pm (UTC)'!
provider: aProvider
	provider := aProvider! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:08:34 pm (UTC)'!
providers
	"The known providers (registry lives on the class)."
	^SmalltalkMentor providers! !

!SmalltalkMentor methodsFor: 'design heuristics' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
currentReviewHeuristics
	"The design heuristics to enforce, looked up in order:
	 1. <imageDirectory>/smalltalk-mentor-heuristics.md  (per-image heuristics, checked first)
	 2. ~/.smalltalk-mentor/heuristics.md                (per-user heuristics)
	 3. the built-in #defaultReviewHeuristics
	Files are read via the shell (avoids resolving $HOME in the image), mirroring the key
	handling."
	| tmp raw |
	tmp := '/tmp/smalltalk-mentor-heuristics.txt'.
	OSProcess waitForCommand:
		'sh -c ''I="', self imageDirectoryPath, '/smalltalk-mentor-heuristics.md"; H="$HOME/.smalltalk-mentor/heuristics.md"; if [ -s "$I" ]; then cat "$I"; elif [ -s "$H" ]; then cat "$H"; fi > ', tmp, ' 2>/dev/null || : > ', tmp, ''''.
	raw := [ tmp asFileEntry fileContents asString ] on: Error do: [ :e | '' ].
	raw := raw withBlanksTrimmed.
	^raw isEmpty ifTrue: [ self defaultReviewHeuristics ] ifFalse: [ raw ]! !

!SmalltalkMentor methodsFor: 'design heuristics' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
defaultReviewHeuristics
	"Built-in project design heuristics, used when ~/.smalltalk-mentor/heuristics.md is absent
	or blank. Grouped under ## Category headings; each heuristic is prefixed with a short [id]
	name so the mentor can cite it. Edit here, or override by creating that file (see
	#reviewHeuristicsFilePath / #writeDefaultReviewHeuristicsFile)."
	^'## Testing
- [assert-equals] Prefer `assert: expected equals: actual` over `assert: expected = actual`
  (and over other `assert:`/`deny:` boolean-equality forms) so a failing test shows both
  the expected and the actual value.

## Object design
- [valid-on-creation] Objects should be valid from the moment they are created: instance
  creation messages validate their arguments with assertions encapsulated on the class side.'! !

!SmalltalkMentor methodsFor: 'design heuristics' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
reviewHeuristicsFilePath
	"Where project-specific design heuristics live."
	^'~/.smalltalk-mentor/heuristics.md'! !

!SmalltalkMentor methodsFor: 'design heuristics' stamp: 'HAW 14/Aug/2026, 6:23:15 pm (UTC)'!
writeDefaultReviewHeuristicsFile
	"Create ~/.smalltalk-mentor/heuristics.md seeded with the built-in defaults, only if it does
	not already exist. Gives you a file to start editing.
	Evaluate:  SmalltalkMentor current writeDefaultReviewHeuristicsFile"
	| tmp |
	tmp := '/tmp/smalltalk-mentor-heuristics-seed.txt'.
	tmp asFileEntry fileContents: self defaultReviewHeuristics.
	OSProcess waitForCommand:
		'sh -c ''mkdir -p "$HOME/.smalltalk-mentor"; F="$HOME/.smalltalk-mentor/heuristics.md"; [ -f "$F" ] || cp ', tmp, ' "$F"'''.
	Transcript show: 'Seeded ', self reviewHeuristicsFilePath, ' (if it did not already exist)'; newLine! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
askAbout: source
	"Single-shot convenience: review a method source with no follow-up conversation.
	See #completionForMessages: and #promptFor:."
	^self completionForMessages: {
		self userMessage: (self promptFor: source) }! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 15/Aug/2026, 1:59:07 am (UTC)'!
reviewClassFromMorph: aMorph
	"Class-list menu action / cmd+0 on a class. aMorph is the class-list morph; its model is
	the browser. Snapshot this mentor and open a class review."
	| aClass reviewMentor |
	aClass := [ aMorph model selectedClass ] on: Error do: [ :e | nil ].
	aClass ifNil: [ ^PopUpMenu inform: 'Select a class first, then press cmd+0.' ].
	reviewMentor := self copy.
	self showTransientToast: 'Smalltalk Mentor is reviewing class ', aClass name, ' with ', reviewMentor provider name.
	SmalltalkMentorClassReview reviewClass: aClass mentor: reviewMentor! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 16/Aug/2026, 9:15:38 pm (UTC)'!
reviewFromMorph: aMorph
	"Entry point for the cmd+0 shortcut / menu, from the code editor OR the message list. The
	code provider is the editor's #codeProvider or, for the message list, the morph's #model
	(the browser). Snapshots this mentor and hands off to a background review."
	| codeProvider aClass aSelector source category reviewMentor |
	codeProvider := (aMorph respondsTo: #codeProvider) ifTrue: [ aMorph codeProvider ] ifFalse: [ nil ].
	codeProvider ifNil: [ codeProvider := (aMorph respondsTo: #model) ifTrue: [ aMorph model ] ifFalse: [ nil ] ].
	(codeProvider notNil and: [ codeProvider respondsTo: #selectedClassOrMetaClass ]) ifFalse: [
		^PopUpMenu inform: 'Open this in a browser and select a method first.' ].
	aClass := codeProvider selectedClassOrMetaClass.
	aSelector := codeProvider selectedMessageName.
	(aClass isNil or: [ aSelector isNil ]) ifTrue: [
		^PopUpMenu inform: 'Select a method first, then press cmd+0.' ].
	source := aClass sourceCodeAt: aSelector.
	category := codeProvider selectedMessageCategoryName.
	reviewMentor := self copy.
	reviewMentor
		reviewSource: source
		class: aClass
		selector: aSelector
		category: category
		toast: (self showThinkingToast: 'Smalltalk Mentor is reviewing ', aClass name, '>>', aSelector printString, ' with ', reviewMentor provider name)! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 14/Aug/2026, 6:52:00 pm (UTC)'!
reviewSource: source class: aClass selector: aSelector category: category toast: aToast
	"Fork the first network call (on this snapshot mentor's provider) so the UI is never
	blocked, then open the conversational review window bound to this mentor when the answer
	arrives. aToast (may be nil) is removed once the reply arrives or on error."
	[ [ | messages answer proposal |
	   messages := OrderedCollection with: (self userMessage: (self promptFor: source)).
	   answer := self provider completionForMessages: messages.
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
			   mentor: self ] ]
		on: Error
		do: [ :e |
			UISupervisor whenUIinSafeState: [
				aToast ifNotNil: [ aToast delete ].
				PopUpMenu inform: 'Smalltalk Mentor review failed: ', e messageText ] ] ] fork! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
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

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
promptFor: source
	"Assemble the review prompt: intro, response language, mandatory project design heuristics
	(grouped under ## Category headings, each named with a [id]), JSON output contract,
	and the method source. The suggestion is the improved version of THIS method only."
	^'You are a Smalltalk expert reviewing a single method from a Cuis Smalltalk image.

Write the "rationale" field, and all of your conversational replies, in ', self language, '. Do NOT translate Smalltalk code, selectors, or identifiers - "suggestedSource" must remain valid Smalltalk.

Enforce these project-specific design heuristics. They are grouped under "## Category" headings, and each heuristic begins with a short name in brackets like [assert-equals]. Treat them as mandatory: if the method violates any heuristic, set canImprove to true, make suggestedSource comply, and in the rationale cite the [name] of each violated heuristic. Also apply your general Smalltalk expertise for any other improvements.
<designHeuristics>
', self currentReviewHeuristics, '
</designHeuristics>

Reply with ONLY a JSON object (no prose, no markdown fences) of the form:
{"canImprove": true or false, "suggestedSource": "<a complete, compilable method with the SAME selector, or an empty string if it is already good>", "rationale": "<one or two sentences>"}
Here is the method:

', source! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
assistantMessage: aString
	^JsonObject new
		at: 'role' put: 'assistant';
		at: 'content' put: aString;
		yourself! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
completionForMessages: aCollectionOfMessages
	"Send a full conversation (neutral {role, content} messages) to the current provider
	and answer the raw assistant text."
	^self provider completionForMessages: aCollectionOfMessages! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
userMessage: aString
	^JsonObject new
		at: 'role' put: 'user';
		at: 'content' put: aString;
		yourself! !

!SmalltalkMentor methodsFor: 'menu' stamp: 'HAW 15/Aug/2026, 1:13:08 pm (UTC)'!
classReviewMenuSpec
	"A 'Smalltalk Mentor' submenu for the class-list pane: review the class, toggle the
	response language, or choose the provider/model (the last two act on this instance)."
	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Review this class (0)'. $0. self. #reviewClassFromMorph:. #helpIcon }.
		{ 12020. 'Toggle response language (Spanish/English)'. nil. self. #toggleLanguage. #helpIcon }.
		{ 12030. 'Choose LLM provider and model...'. nil. self. #chooseProvider. #helpIcon }
	}! !

!SmalltalkMentor methodsFor: 'menu' stamp: 'HAW 15/Aug/2026, 1:59:22 am (UTC)'!
classReviewMenuSpecSend
	^MessageSend receiver: self selector: #classReviewMenuSpec! !

!SmalltalkMentor methodsFor: 'menu' stamp: 'HAW 16/Aug/2026, 9:15:59 pm (UTC)'!
install
	"Register cmd+0 'Ask Smalltalk Mentor' on the code editor and the message list of the
	common code tools, and 'Review this class' on the browser's class list. Idempotent-ish.
	Evaluate:  SmalltalkMentor current install"
	#(BrowserWindow MethodSetWindow DebuggerWindow) do: [ :winClassName |
		(Smalltalk at: winClassName ifAbsent: [ nil ]) ifNotNil: [ :winClass |
			winClass registerAll: { { #SmalltalkEditor. self smalltalkEditorMenuSpecSend } } ] ].
	#(BrowserWindow MethodSetWindow) do: [ :winClassName |
		(Smalltalk at: winClassName ifAbsent: [ nil ]) ifNotNil: [ :winClass |
			winClass registerAll: { { #messageListMenuSpec. self smalltalkEditorMenuSpecSend } } ] ].
	BrowserWindow registerAll: { { #classListMenuSpec. self classReviewMenuSpecSend } }.
	Transcript show: 'Smalltalk Mentor installed (cmd+0 on methods, message list, and classes)'; newLine! !

!SmalltalkMentor methodsFor: 'menu' stamp: 'HAW 14/Aug/2026, 6:08:55 pm (UTC)'!
smalltalkEditorMenuSpec
	"A 'Smalltalk Mentor' submenu in the code pane. Actions target this instance (self).
	Fields: id, label, shortcutChar, target, selector, icon."
	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Ask for a better version (0)'. $0. self. #reviewFromMorph:. #helpIcon }.
		{ 12020. 'Toggle response language (Spanish/English)'. nil. self. #toggleLanguage. #helpIcon }.
		{ 12030. 'Choose LLM provider and model...'. nil. self. #chooseProvider. #helpIcon }
	}! !

!SmalltalkMentor methodsFor: 'menu' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
smalltalkEditorMenuSpecSend
	^MessageSend receiver: self selector: #smalltalkEditorMenuSpec! !

!SmalltalkMentor methodsFor: 'menu' stamp: 'HAW 16/Aug/2026, 9:16:07 pm (UTC)'!
uninstall
	"Remove the shortcut/menu registrations.  SmalltalkMentor current uninstall"
	#(BrowserWindow MethodSetWindow DebuggerWindow) do: [ :winClassName |
		(Smalltalk at: winClassName ifAbsent: [ nil ]) ifNotNil: [ :winClass |
			winClass unregisterAll: { { #SmalltalkEditor. self smalltalkEditorMenuSpecSend } } ] ].
	#(BrowserWindow MethodSetWindow) do: [ :winClassName |
		(Smalltalk at: winClassName ifAbsent: [ nil ]) ifNotNil: [ :winClass |
			winClass unregisterAll: { { #messageListMenuSpec. self smalltalkEditorMenuSpecSend } } ] ].
	BrowserWindow unregisterAll: { { #classListMenuSpec. self classReviewMenuSpecSend } }.
	Transcript show: 'Smalltalk Mentor uninstalled'; newLine! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
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

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
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

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 14/Aug/2026, 6:07:46 pm (UTC)'!
showTransientToast: aString
	"Show a toast that auto-dismisses after a couple of seconds."
	| toast |
	toast := self showThinkingToast: aString.
	[ (Delay forSeconds: 2) wait.
	  UISupervisor whenUIinSafeState: [ toast ifNotNil: [ toast delete ] ] ] fork.
	^toast! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 14/Aug/2026, 6:08:45 pm (UTC)'!
toggleLanguage
	"Flip the response language between Spanish and English, and briefly confirm."
	language := self language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ].
	self showTransientToast: 'Smalltalk Mentor response language: ', self language! !

!SmalltalkMentor class methodsFor: 'initialization' stamp: 'HAW 14/Aug/2026, 6:08:01 pm (UTC)'!
initialize
	"Install the cmd+0 menu on the current instance when the package loads."
	self current install! !

!SmalltalkMentor class methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:07:56 pm (UTC)'!
current
	"The single Smalltalk Mentor instance, holding the selected provider and language."
	^Current ifNil: [ Current := self new ]! !

!SmalltalkMentor class methodsFor: 'accessing' stamp: 'HAW 14/Aug/2026, 6:35:29 pm (UTC)'!
imageDirectoryPath
	"Absolute path of the directory that holds the running image."
	^Smalltalk imageName asFileEntry parent pathName! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 14/Aug/2026, 2:21:28 pm (UTC)'!
buildProviders
	"The known providers, with sensible default models (change per provider via the menu,
	or with `aProvider model: '...'`). Each reads its key from <imageDir>/<name>.key first,
	then its home key file, then (Anthropic) the env var."
	^OrderedCollection new
		add: AnthropicProvider new;
		add: (OpenAICompatibleProvider name: 'ChatGPT'
			endpoint: 'https://api.openai.com/v1/chat/completions'
			model: 'gpt-4o'
			keyFilePath: '$HOME/.openai/key'
			imageKeyBasename: 'openai.key');
		add: (OpenAICompatibleProvider name: 'Deepseek'
			endpoint: 'https://api.deepseek.com/chat/completions'
			model: 'deepseek-chat'
			keyFilePath: '$HOME/.deepseek/key'
			imageKeyBasename: 'deepseek.key');
		add: (OpenAICompatibleProvider name: 'Nvidia NIM'
			endpoint: 'https://integrate.api.nvidia.com/v1/chat/completions'
			model: 'meta/llama-3.1-70b-instruct'
			keyFilePath: '$HOME/.nvidia/key'
			imageKeyBasename: 'nvidia.key');
		add: GeminiProvider new;
		yourself! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 7/Aug/2026, 6:51:59 pm (UTC)'!
providers
	"The known LLM providers (cached so per-provider model changes persist for the session)."
	^Providers ifNil: [ Providers := self buildProviders ]! !

!SmalltalkMentorClassReview methodsFor: 'initialization' stamp: 'HAW 15/Aug/2026, 1:08:56 pm (UTC)'!
setClass: aClass mentor: aMentor
	targetClass := aClass theNonMetaClass.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 16/Aug/2026, 6:22:04 pm (UTC)'!
classVarFindings
	"Heuristic 4: every class variable should be both read and written (instance or class side)."
	| result |
	result := OrderedCollection new.
	targetClass classVarNames asSortedCollection do: [ :cv |
		| binding sources assignments occurrences hasWrite hasRead problem |
		binding := targetClass bindingOf: cv.
		sources := OrderedCollection new.
		(targetClass whichSelectorsReferTo: binding) do: [ :sel | sources add: (targetClass sourceCodeAt: sel) ].
		(targetClass class whichSelectorsReferTo: binding) do: [ :sel | sources add: (targetClass class sourceCodeAt: sel) ].
		assignments := sources inject: 0 into: [ :sum :src | sum + (self countOf: cv, ' :=' in: src) + (self countOf: cv, ':=' in: src) ].
		occurrences := sources inject: 0 into: [ :sum :src | sum + (self countOf: cv in: src) ].
		hasWrite := assignments > 0.
		hasRead := occurrences > assignments.
		(hasRead and: [ hasWrite ]) ifFalse: [
			problem := (hasRead or: [ hasWrite ])
				ifFalse: [ 'is never read nor written' ]
				ifTrue: [ hasRead ifTrue: [ 'is read but never written' ] ifFalse: [ 'is written but never read' ] ].
			result add: (SmalltalkMentorFinding
				title: 'Class var ', cv, ' ', problem
				detail: 'The class variable ''', cv, ''' of ', targetClass name, ' ', problem, '.'
				editKind: #variable
				editTarget: cv) ] ].
	^result! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 16/Aug/2026, 6:21:54 pm (UTC)'!
instVarFindings
	"Heuristic 1: every instance variable should be both read and written in the instance-side
	methods."
	| result |
	result := OrderedCollection new.
	targetClass instVarNames do: [ :ivar |
		| idx accessors hasRead hasWrite problem |
		idx := targetClass allInstVarNames indexOf: ivar.
		accessors := targetClass whichSelectorsAccess: ivar.
		hasWrite := (targetClass whichSelectorsStoreInto: ivar) notEmpty.
		hasRead := accessors anySatisfy: [ :sel | (targetClass >> sel) readsField: idx ].
		(hasRead and: [ hasWrite ]) ifFalse: [
			problem := (hasRead or: [ hasWrite ])
				ifFalse: [ 'is never read nor written' ]
				ifTrue: [ hasRead ifTrue: [ 'is read but never written' ] ifFalse: [ 'is written but never read' ] ].
			result add: (SmalltalkMentorFinding
				title: 'Inst var ', ivar, ' ', problem
				detail: 'The instance variable ''', ivar, ''' of ', targetClass name, ' ', problem, '.'
				editKind: #variable
				editTarget: ivar) ] ].
	^result! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 16/Aug/2026, 8:49:32 pm (UTC)'!
messagesWithoutImplementersFindings
	"Heuristic 3: every message sent by this class's methods should have an implementer."
	| result seen |
	result := OrderedCollection new.
	seen := Set new.
	{ targetClass. targetClass class } do: [ :cls |
		cls selectors asSortedCollection do: [ :sel |
			(cls >> sel) messages do: [ :sent |
				(seen includes: sent) ifFalse: [
					seen add: sent.
					(Smalltalk allImplementorsOf: sent) isEmpty ifTrue: [
						result add: (SmalltalkMentorFinding
							title: 'No implementer: #', sent
							detail: 'The message #', sent, ' is sent (e.g. in ', cls name, '>>', sel, ') but no class implements it - likely a typo or a missing method.'
							editKind: #method
							editTarget: (cls -> sel)) ] ] ] ] ].
	^result! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 16/Aug/2026, 8:49:22 pm (UTC)'!
methodsWithoutSendersFindings
	"Heuristic 2: every implemented message should have a sender. Excludes methods that override an
	inherited implementation and test methods (run by metaprogramming)."
	| result |
	result := OrderedCollection new.
	{ targetClass. targetClass class } do: [ :cls |
		cls selectors asSortedCollection do: [ :sel |
			((Smalltalk allCallsOn: sel) isEmpty
				and: [ (cls superclass canUnderstand: sel) not
				and: [ (cls >> sel) isTestMethod not ] ]) ifTrue: [
				result add: (SmalltalkMentorFinding
					title: 'No senders: ', cls name, '>>', sel
					detail: 'The method ', cls name, '>>', sel, ' has no senders in the image and does not override an inherited method - it may be dead code.'
					editKind: #method
					editTarget: (cls -> sel)) ] ] ].
	^result! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 15/Aug/2026, 1:07:37 pm (UTC)'!
heuristicGroups
	"The five static (Smalltalk) verifications as title -> (collection of title->detail
	findings) associations. Each becomes a root in the tree."
	^OrderedCollection new
		add: 'Instance vars read & written' -> self instVarFindings;
		add: 'Class vars read & written' -> self classVarFindings;
		add: 'Methods have senders' -> self methodsWithoutSendersFindings;
		add: 'Messages have implementers' -> self messagesWithoutImplementersFindings;
		add: 'Methods are categorized' -> self uncategorizedMethodsFindings;
		yourself! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 16/Aug/2026, 6:22:30 pm (UTC)'!
uncategorizedMethodsFindings
	"Heuristic 5: every method should be in a meaningful protocol (not 'as yet unclassified')."
	| result |
	result := OrderedCollection new.
	{ targetClass. targetClass class } do: [ :cls |
		cls selectors asSortedCollection do: [ :sel |
			| cat |
			cat := self categoryOf: sel in: cls.
			(cat isNil or: [ cat asString = 'as yet unclassified' ]) ifTrue: [
				result add: (SmalltalkMentorFinding
					title: 'Uncategorized: ', cls name, '>>', sel
					detail: 'The method ', cls name, '>>', sel, ' is not categorized. Move it into a meaningful protocol.'
					editKind: #method
					editTarget: (cls -> sel)) ] ] ].
	^result! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 16/Aug/2026, 8:44:08 pm (UTC)'!
buildRootNodes
	| roots |
	roots := OrderedCollection new.
	self heuristicGroups do: [ :group |
		| children |
		children := group value collect: [ :finding |
			SmalltalkMentorNode label: finding title kind: #finding payload: finding children: #() model: self ].
		roots add: (SmalltalkMentorNode
			label: group key, ' (', children size printString, ')'
			kind: #heuristicRoot payload: nil children: children model: self) ].
	roots add: (self methodsSideNodeFor: targetClass label: 'Instance methods').
	roots add: (self methodsSideNodeFor: targetClass class label: 'Class methods').
	^roots! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 15/Aug/2026, 1:10:11 pm (UTC)'!
methodsSideNodeFor: aClassOrMeta label: aLabel
	"A side node ('Instance methods' / 'Class methods') whose children are category nodes,
	each with one method leaf per method."
	| categoryNodes |
	categoryNodes := OrderedCollection new.
	aClassOrMeta organization categories asSortedCollection do: [ :cat |
		| sels methodNodes |
		sels := (aClassOrMeta organization listAtCategoryNamed: cat) asSortedCollection.
		sels notEmpty ifTrue: [
			methodNodes := sels collect: [ :sel |
				SmalltalkMentorNode label: sel asString kind: #method payload: (aClassOrMeta -> sel) children: #() model: self ].
			categoryNodes add: (SmalltalkMentorNode
				label: cat asString kind: #category payload: nil children: methodNodes model: self) ] ].
	^SmalltalkMentorNode
		label: aLabel, ' (', aClassOrMeta selectors size printString, ')'
		kind: #side payload: nil children: categoryNodes model: self! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 16/Aug/2026, 6:24:02 pm (UTC)'!
nodeSelected: aNode
	"Dispatch a tree selection: a method leaf triggers a (lazy) LLM review; a finding leaf
	shows an editor (method or class-definition) or text; headers clear the panel."
	aNode kind = #method ifTrue: [ ^self showMethodReview: aNode payload ].
	aNode kind = #finding ifTrue: [ ^self showFinding: aNode payload ].
	self clearDetail! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 15/Aug/2026, 1:09:51 pm (UTC)'!
rootNodes
	"Tree roots (cached): one per static design heuristic (children = its failing elements), then
	'Instance methods' and 'Class methods' grouped by category."
	^treeRoots ifNil: [ treeRoots := self buildRootNodes ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 15/Aug/2026, 3:44:34 pm (UTC)'!
selectedIndex
	"The currently selected wrapper node (or nil). The tree reads this back to keep the row
	highlighted."
	^selectedIndex! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 16/Aug/2026, 6:17:54 pm (UTC)'!
selectedIndex: aWrapper
	"The tree passes the selected wrapper node here (via complexContents), not an integer.
	Remember it, refresh the visual selection (so the row shows selected), and act on it."
	selectedIndex := aWrapper.
	self changed: #selectedIndex.
	(aWrapper isKindOf: SmalltalkMentorNode) ifTrue: [ self nodeSelected: aWrapper ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 15/Aug/2026, 1:11:14 pm (UTC)'!
clearDetail
	detailHolder removeAllMorphs! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 16/Aug/2026, 9:26:59 pm (UTC)'!
codePaneForBrowser: aBrowser
	"A code pane identical to a class browser's (method-mode syntax highlighting, refactorings
	menu, senders/implementors, etc.), backed by a real Browser model."
	^TextModelMorph
		textProvider: aBrowser
		textGetter: #acceptedContents
		textSetter: #contents:notifying:
		selectionGetter: #contentsSelection! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 16/Aug/2026, 9:27:15 pm (UTC)'!
showClassDefinitionEditorSelecting: aVariableName
	"Show the class definition in a real browser code pane (class-definition mode: refactorings,
	add/remove ivar, etc.). Accept redefines the class. The variable is pre-selected."
	| browser pane text idx |
	browser := Browser new.
	browser setClass: targetClass selector: nil.
	browser editClass.
	pane := self codePaneForBrowser: browser.
	detailHolder removeAllMorphs.
	detailHolder addMorph: pane layoutSpec: LayoutSpec useAll.
	text := browser acceptedContents asString.
	idx := self firstIndexOf: aVariableName in: text.
	idx > 0 ifTrue: [ [ pane editor selectFrom: idx to: idx + aVariableName size - 1 ] on: Error do: [ :e | ] ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 16/Aug/2026, 6:24:10 pm (UTC)'!
showFinding: aFinding
	"A static finding was selected: for a method-related finding show an editable code pane on
	that method; for a variable-related finding show the class definition editor with the
	variable selected; otherwise show the text description."
	aFinding editKind = #method ifTrue: [ ^self showMethodEditorFor: aFinding editTarget ].
	aFinding editKind = #variable ifTrue: [ ^self showClassDefinitionEditorSelecting: aFinding editTarget ].
	self showText: aFinding detail! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 16/Aug/2026, 9:27:07 pm (UTC)'!
showMethodEditorFor: aClassSelectorAssociation
	"Show the method in a real browser code pane (same styling, menu and refactorings as the
	system browser). Editing + cmd+S compiles it into the class."
	| browser |
	browser := Browser new.
	browser setClass: aClassSelectorAssociation key selector: aClassSelectorAssociation value.
	detailHolder removeAllMorphs.
	detailHolder addMorph: (self codePaneForBrowser: browser) layoutSpec: LayoutSpec useAll! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 15/Aug/2026, 1:10:28 pm (UTC)'!
showMethodReview: aClassSelectorAssociation
	"Lazily review the method when selected: reuse the cached review, otherwise show the
	'analyzing' toast and fork the LLM call, then show the review panel."
	| cached |
	cached := methodReviewCache at: aClassSelectorAssociation ifAbsent: [ nil ].
	cached ifNotNil: [ ^self showReviewPanel: cached ].
	self showThinkingFor: aClassSelectorAssociation.
	[ [ | review |
	   review := self buildReviewFor: aClassSelectorAssociation.
	   UISupervisor whenUIinSafeState: [
		   self hideThinking.
		   methodReviewCache at: aClassSelectorAssociation put: review.
		   self showReviewPanel: review ] ]
		on: Error
		do: [ :e |
			UISupervisor whenUIinSafeState: [
				self hideThinking.
				self showText: 'Review failed: ', e messageText ] ] ] fork! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 15/Aug/2026, 1:11:01 pm (UTC)'!
showReviewPanel: aReview
	detailHolder removeAllMorphs.
	detailHolder addMorph: aReview buildContent layoutSpec: LayoutSpec useAll! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 15/Aug/2026, 1:11:07 pm (UTC)'!
showText: aString
	detailHolder removeAllMorphs.
	detailHolder addMorph: (TextModelMorph withText: aString asText) layoutSpec: LayoutSpec useAll! !

!SmalltalkMentorClassReview methodsFor: 'reviewing' stamp: 'HAW 15/Aug/2026, 1:10:54 pm (UTC)'!
buildReviewFor: aClassSelectorAssociation
	"Do the LLM review for one method with its own frozen mentor (per-method language), and
	answer a ready SmalltalkMentorReview."
	| cls sel source methodMentor prompt answer proposal msgs review |
	cls := aClassSelectorAssociation key.
	sel := aClassSelectorAssociation value.
	source := cls sourceCodeAt: sel.
	methodMentor := mentor copy.
	prompt := methodMentor promptFor: source.
	answer := methodMentor provider completionForMessages: { methodMentor userMessage: prompt }.
	proposal := methodMentor parseProposalFrom: answer.
	msgs := OrderedCollection new.
	msgs add: (methodMentor userMessage: prompt); add: (methodMentor assistantMessage: answer).
	review := SmalltalkMentorReview new.
	review
		setClass: cls
		selector: sel
		category: (self categoryOf: sel in: cls)
		current: source
		suggested: (proposal at: 'suggestedSource' ifAbsent: [ '' ])
		rationale: (proposal at: 'rationale' ifAbsent: [ '' ])
		messages: msgs
		mentor: methodMentor.
	^review! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 15/Aug/2026, 1:10:43 pm (UTC)'!
hideThinking
	thinkingToast ifNotNil: [ thinkingToast delete. thinkingToast := nil ]! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 15/Aug/2026, 1:10:37 pm (UTC)'!
showThinkingFor: aClassSelectorAssociation
	"Show the 'analyzing' toast (as when a single method is reviewed) and a placeholder in the
	right panel."
	| cls sel where |
	cls := aClassSelectorAssociation key.
	sel := aClassSelectorAssociation value.
	where := cls name, '>>', sel printString.
	thinkingToast := mentor showThinkingToast: 'Smalltalk Mentor is analyzing ', where, ' with ', mentor provider name.
	self showText: 'Analyzing ', where, ' with ', mentor provider name, ' ...'! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 16/Aug/2026, 6:26:24 pm (UTC)'!
browseNode: aNode
	"Context menu 'Browse': open a class browser on the selected method, or on the class
	definition for variable/other nodes."
	aNode kind = #method ifTrue: [
		^BrowserWindow fullOnClass: aNode payload key selector: aNode payload value ].
	(aNode kind = #finding and: [ aNode payload editKind = #method ]) ifTrue: [
		^BrowserWindow fullOnClass: aNode payload editTarget key selector: aNode payload editTarget value ].
	BrowserWindow fullOnClass: targetClass selector: nil! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 15/Aug/2026, 1:11:23 pm (UTC)'!
changeProvider
	"Button below the tree: pick the LLM provider (and model) for this class review's future
	lazy reviews. Uses a copy so model changes stay local to this window."
	| names idx chosen answer |
	names := (mentor providers collect: [ :p | p name ]) asArray.
	idx := PopUpMenu withCaption: 'Choose LLM provider' chooseFrom: names.
	idx = 0 ifTrue: [ ^self ].
	chosen := (mentor providers at: idx) copy.
	answer := mentor request: 'Model id for ', chosen name initialAnswer: chosen model.
	(answer notNil and: [ answer withBlanksTrimmed notEmpty ]) ifTrue: [ chosen model: answer withBlanksTrimmed ].
	mentor provider: chosen.
	providerButton ifNotNil: [ providerButton label: 'LLM: ', mentor provider printString ]! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 16/Aug/2026, 6:26:17 pm (UTC)'!
runAgainNode: aNode
	"Context menu 'Run again': for a method review re-run the LLM review; otherwise re-run the
	static verifications and refresh the tree."
	aNode kind = #method ifTrue: [
		methodReviewCache removeKey: aNode payload ifAbsent: [ ].
		^self showMethodReview: aNode payload ].
	treeRoots := nil.
	self changed: #rootNodes! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 16/Aug/2026, 6:26:38 pm (UTC)'!
openWindow
	"Master-detail window: left = tree (with right-click menu) + provider button; right =
	detail. The provider is NOT in the title (it can differ per method review); it is shown
	inside each method review panel and on the button below the tree."
	| leftCol row |
	window := SystemWindow new.
	window setLabel: 'Smalltalk Mentor - class ', targetClass name.
	treeMorph := SmalltalkMentorTreeMorph
		withModel: self
		listGetter: #rootNodes
		indexGetter: #selectedIndex
		indexSetter: #selectedIndex:.
	providerButton := PluggableButtonMorph model: self action: #changeProvider label: 'LLM: ', mentor provider printString.
	leftCol := LayoutMorph newColumn.
	leftCol addMorph: treeMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 1.0).
	leftCol addMorph: providerButton layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 30).
	detailHolder := LayoutMorph newColumn.
	row := LayoutMorph newRow.
	row addMorph: leftCol layoutSpec: (LayoutSpec proportionalWidth: 0.34 proportionalHeight: 1.0).
	row addAdjusterAndMorph: detailHolder proportionalWidth: 0.66.
	window addMorph: row layoutSpec: LayoutSpec useAll.
	window openInWorld! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 15/Aug/2026, 1:09:04 pm (UTC)'!
start
	"Open the class-review window. The static findings are computed lazily by the tree; method
	reviews happen when a method is selected."
	self openWindow! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 15/Aug/2026, 1:56:54 am (UTC)'!
categoryOf: aSelector in: aClassOrMeta
	"The method's protocol, defaulting safely."
	^[ aClassOrMeta organization categoryOfElement: aSelector ]
		on: Error do: [ :e | 'as yet unclassified' ]! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 15/Aug/2026, 1:51:02 am (UTC)'!
countOf: subString in: aString
	"Case-sensitive count of non-overlapping occurrences of subString in aString."
	| n count i |
	n := subString size.
	n = 0 ifTrue: [ ^0 ].
	count := 0.
	i := 1.
	[ i + n - 1 <= aString size ] whileTrue: [
		(aString copyFrom: i to: i + n - 1) = subString
			ifTrue: [ count := count + 1. i := i + n ]
			ifFalse: [ i := i + 1 ] ].
	^count! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 16/Aug/2026, 6:24:33 pm (UTC)'!
firstIndexOf: subString in: aString
	"First 1-based index of subString in aString (case-sensitive), or 0."
	| n |
	n := subString size.
	n = 0 ifTrue: [ ^0 ].
	1 to: aString size - n + 1 do: [ :i |
		(aString copyFrom: i to: i + n - 1) = subString ifTrue: [ ^i ] ].
	^0! !

!SmalltalkMentorClassReview class methodsFor: 'instance creation' stamp: 'HAW 15/Aug/2026, 1:55:29 am (UTC)'!
reviewClass: aClass mentor: aMentor
	"Open a class-review window for aClass using aMentor (a frozen snapshot). Runs the four
	static verifications synchronously, opens the window, then reviews every method in the
	background."
	^self new setClass: aClass mentor: aMentor; start! !

!SmalltalkMentorFinding methodsFor: 'initialization' stamp: 'HAW 16/Aug/2026, 6:21:21 pm (UTC)'!
setTitle: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget
	title := aTitle.
	detail := aDetail.
	editKind := anEditKind.
	editTarget := anEditTarget! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 16/Aug/2026, 6:21:31 pm (UTC)'!
detail
	^detail! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 16/Aug/2026, 6:21:36 pm (UTC)'!
editKind
	^editKind! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 16/Aug/2026, 6:21:41 pm (UTC)'!
editTarget
	^editTarget! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 16/Aug/2026, 6:21:25 pm (UTC)'!
title
	^title! !

!SmalltalkMentorFinding class methodsFor: 'instance creation' stamp: 'HAW 16/Aug/2026, 6:21:15 pm (UTC)'!
title: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget
	"editKind is #method (editTarget = class->selector), #variable (editTarget = var name in
	targetClass), or #none (text-only detail)."
	^self new setTitle: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget! !

!SmalltalkMentorReview methodsFor: 'initialization' stamp: 'HAW 14/Aug/2026, 6:52:20 pm (UTC)'!
setClass: aClass selector: aSelector category: aCategory current: currentSrc suggested: suggestedSrc rationale: aRationale messages: aMessagesCollection mentor: aMentor
	targetClass := aClass.
	selector := aSelector.
	category := aCategory.
	currentSource := currentSrc withCuisLineEndings.
	suggestedSource := self formattedSource: suggestedSrc.
	rationale := aRationale.
	messages := aMessagesCollection.
	mentor := aMentor.
	busy := false! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 16/Aug/2026, 9:42:12 pm (UTC)'!
buildContent
	"Build (once) and answer the review's content morph: a provider/model label, transcript,
	original | suggested panes, follow-up input, and buttons. The ORIGINAL pane is a real
	browser code pane (method-mode highlighting, refactorings, editable/compilable). The
	SUGGESTED pane is syntax-highlighted too but no-copy (students type the fix)."
	| col paneRow btnRow currentMorph sendBtn rightText providerLabel originalBrowser suggestedModel |
	contentMorph ifNotNil: [ ^contentMorph ].
	col := LayoutMorph newColumn.
	providerLabel := LabelMorph contents: 'LLM: ', mentor provider printString.
	transcriptMorph := TextModelMorph withText: ('Smalltalk Mentor: ', rationale, String newLineString) asText.
	rightText := suggestedSource isEmpty ifTrue: [ currentSource ] ifFalse: [ suggestedSource ].
	originalBrowser := Browser new.
	originalBrowser setClass: targetClass selector: selector.
	currentMorph := TextModelMorph
		textProvider: originalBrowser
		textGetter: #acceptedContents
		textSetter: #contents:notifying:
		selectionGetter: #contentsSelection.
	suggestedModel := SmalltalkMentorNoCopyTextModel withText: rightText asText.
	suggestedModel styleClass: targetClass.
	suggestedMorph := TextModelMorph withModel: suggestedModel.
	paneRow := LayoutMorph newRow.
	paneRow addMorph: currentMorph layoutSpec: (LayoutSpec proportionalWidth: 0.5 proportionalHeight: 1.0).
	paneRow addAdjusterAndMorph: suggestedMorph proportionalWidth: 0.5.
	inputMorph := EntryFieldMorph new.
	inputMorph contents: ''.
	inputMorph crAction: [ self sendFollowUp ].
	sendBtn := PluggableButtonMorph model: self action: #sendFollowUp label: 'Send (Enter)'.
	langButton := PluggableButtonMorph model: self action: #switchLanguage label: 'Idioma: ', mentor language.
	btnRow := LayoutMorph newRow.
	btnRow addMorph: sendBtn layoutSpec: (LayoutSpec proportionalWidth: 0.6 proportionalHeight: 1.0).
	btnRow addMorph: langButton layoutSpec: (LayoutSpec proportionalWidth: 0.4 proportionalHeight: 1.0).
	col addMorph: providerLabel layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 20).
	col addMorph: transcriptMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.28).
	col addAdjusterAndMorph: paneRow proportionalHeight: 0.72.
	col addMorph: inputMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 30).
	col addMorph: btnRow layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 34).
	contentMorph := col.
	^contentMorph! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 6/Aug/2026, 5:15:11 pm (UTC)'!
closeWindow
	window ifNotNil: [ window delete ]! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 16/Aug/2026, 6:25:02 pm (UTC)'!
open
	"Open the review as its own window (single-method review). The provider/model is shown in
	the panel (via #buildContent), not the title."
	window := SystemWindow new.
	window setLabel: 'Smalltalk Mentor - ', targetClass name, '>>', selector printString.
	window addMorph: self buildContent layoutSpec: LayoutSpec useAll.
	window openInWorld! !

!SmalltalkMentorReview methodsFor: 'accessing' stamp: 'HAW 15/Aug/2026, 1:54:10 am (UTC)'!
listLabel
	"How this method review appears in the class-review window's left list."
	^targetClass name, '>>', selector printString! !

!SmalltalkMentorReview methodsFor: 'compiling' stamp: 'HAW 14/Aug/2026, 12:20:32 pm (UTC)'!
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

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 6/Aug/2026, 7:15:06 pm (UTC)'!
appendTranscript: aString
	"Append a line to the dialogue transcript and scroll it to the bottom (must run on
	the UI process)."
	| newText end |
	newText := transcriptMorph text asString, aString, String newLineString.
	transcriptMorph model actualContents: newText asText.
	end := newText size.
	[ transcriptMorph editor selectFrom: end + 1 to: end.
	  transcriptMorph scrollSelectionIntoView ] on: Error do: [ :e | ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 14/Aug/2026, 6:52:57 pm (UTC)'!
postUserContent: contentString transcriptLabel: aLabel
	"Shared engine: append a user turn, show it, and fork the (non-blocking) call to THIS
	conversation's mentor's provider, updating the suggestion pane + transcript with the
	reply. Ignored while busy."
	busy == true ifTrue: [ ^self ].
	messages add: (mentor userMessage: contentString).
	self appendTranscript: aLabel.
	self appendTranscript: '(Smalltalk Mentor is thinking...)'.
	busy := true.
	[ [ | answer proposal |
	   answer := mentor provider completionForMessages: messages.
	   messages add: (mentor assistantMessage: answer).
	   proposal := mentor parseProposalFrom: answer.
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

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 14/Aug/2026, 12:20:18 pm (UTC)'!
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

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 14/Aug/2026, 2:56:49 pm (UTC)'!
setSuggestion: aString
	"Replace the right-hand pane with a new suggestion, pretty-printed so it is properly
	multi-lined (some providers, e.g. Nvidia NIM, return single-line source)."
	suggestedSource := self formattedSource: aString.
	suggestedMorph ifNotNil: [ suggestedMorph model actualContents: suggestedSource asText ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 14/Aug/2026, 6:52:47 pm (UTC)'!
switchLanguage
	"Flip this conversation's language between Spanish and English (on this review's mentor),
	relabel the button, and ask the provider to restate the current rationale in the new
	language."
	| content |
	busy == true ifTrue: [ ^self ].
	mentor language: (mentor language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ]).
	langButton ifNotNil: [ langButton label: 'Idioma: ', mentor language ].
	content := 'From now on, reply in ', mentor language, '. Restate your previous rationale in ', mentor language,
		' without changing suggestedSource. Reply with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'.
	self postUserContent: content transcriptLabel: 'You: (idioma -> ', mentor language, ')'! !

!SmalltalkMentorReview methodsFor: 'private' stamp: 'HAW 14/Aug/2026, 2:56:35 pm (UTC)'!
formattedSource: aString
	"Pretty-print a suggested method so it is properly multi-lined and indented regardless of
	how the provider formatted it - some models (e.g. Nvidia NIM / llama) return the whole
	method on a single line. Falls back to the raw (line-ending-normalized) text if it does
	not parse."
	aString withBlanksTrimmed isEmpty ifTrue: [ ^aString ].
	^[ Compiler format: aString in: targetClass notifying: nil ]
		on: Error do: [ :e | aString withCuisLineEndings ]! !

!SmalltalkMentorReview class methodsFor: 'instance creation' stamp: 'HAW 14/Aug/2026, 6:52:14 pm (UTC)'!
openFor: aClass selector: aSelector category: aCategory current: currentSrc suggested: suggestedSrc rationale: aRationale messages: aMessagesCollection mentor: aMentor
	^self new
		setClass: aClass
		selector: aSelector
		category: aCategory
		current: currentSrc
		suggested: suggestedSrc
		rationale: aRationale
		messages: aMessagesCollection
		mentor: aMentor;
		open! !

!SmalltalkMentorNoCopyEditor methodsFor: 'clipboard' stamp: 'HAW 14/Aug/2026, 6:18:50 pm (UTC)'!
clipboardTextPut: aText
	"Copy is disabled for the suggested-code pane so students type the refactoring themselves
	instead of copying the mentor's answer. Swallow the clipboard write."
	^aText! !

!SmalltalkMentorNode methodsFor: 'initialization' stamp: 'HAW 15/Aug/2026, 1:07:57 pm (UTC)'!
setLabel: aLabel kind: aKind children: aChildrenCollection
	label := aLabel.
	kind := aKind.
	childNodes := aChildrenCollection! !

!SmalltalkMentorNode methodsFor: 'accessing' stamp: 'HAW 15/Aug/2026, 1:08:23 pm (UTC)'!
kind
	^kind! !

!SmalltalkMentorNode methodsFor: 'accessing' stamp: 'HAW 15/Aug/2026, 1:08:29 pm (UTC)'!
payload
	"The wrapped domain object (a finding detail string, or a class->selector association)."
	^item! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 15/Aug/2026, 1:08:03 pm (UTC)'!
asString
	^label! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 15/Aug/2026, 1:08:09 pm (UTC)'!
contents
	"Child wrappers for the tree."
	^childNodes ifNil: [ #() ]! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 15/Aug/2026, 1:08:18 pm (UTC)'!
hasContents
	^(childNodes ifNil: [ #() ]) notEmpty! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 15/Aug/2026, 1:08:35 pm (UTC)'!
sendSettingMessageTo: aModel
	"Called by the tree when this node is selected."
	aModel nodeSelected: self! !

!SmalltalkMentorNode class methodsFor: 'instance creation' stamp: 'HAW 15/Aug/2026, 1:07:51 pm (UTC)'!
label: aLabel kind: aKind payload: aPayload children: aChildrenCollection model: aModel
	^self new
		setItem: aPayload model: aModel;
		setLabel: aLabel kind: aKind children: aChildrenCollection;
		yourself! !
SmalltalkMentor initialize!
