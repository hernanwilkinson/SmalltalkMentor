'From Cuis7.9 [latest update: #8113] on 19 August 2026 at 4:52:52 pm'!
'Description Better menu definition'!
!provides: 'SmalltalkMentor' 1 42!
!requires: 'JSON' 1 29 nil!
!requires: 'OSProcess' 1 36 nil!
SystemOrganization addCategory: #SmalltalkMentor!


!classDefinition: #SmalltalkMentorConversationTextModel category: #SmalltalkMentor!
TextModel subclass: #SmalltalkMentorConversationTextModel
	instanceVariableNames: 'review'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorConversationTextModel class' category: #SmalltalkMentor!
SmalltalkMentorConversationTextModel class
	instanceVariableNames: ''!

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

!classDefinition: #SmalltalkMentorConversationTextMorph category: #SmalltalkMentor!
TextModelMorph subclass: #SmalltalkMentorConversationTextMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorConversationTextMorph class' category: #SmalltalkMentor!
SmalltalkMentorConversationTextMorph class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorReviewWindow category: #SmalltalkMentor!
SystemWindow subclass: #SmalltalkMentorReviewWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorReviewWindow class' category: #SmalltalkMentor!
SmalltalkMentorReviewWindow class
	instanceVariableNames: ''!

!classDefinition: #LLMProvider category: #SmalltalkMentor!
Object subclass: #LLMProvider
	instanceVariableNames: 'name model effort'
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
	instanceVariableNames: 'endpoint imageKeyBasename'
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
	instanceVariableNames: 'mentor targetClass window treeMorph detailHolder treeRoots methodReviewCache providerButton thinkingToast selectedIndex effortButton'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorClassReview class' category: #SmalltalkMentor!
SmalltalkMentorClassReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorClassCategoryReview category: #SmalltalkMentor!
SmalltalkMentorClassReview subclass: #SmalltalkMentorClassCategoryReview
	instanceVariableNames: 'systemCategory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorClassCategoryReview class' category: #SmalltalkMentor!
SmalltalkMentorClassCategoryReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorMethodCategoryReview category: #SmalltalkMentor!
SmalltalkMentorClassReview subclass: #SmalltalkMentorMethodCategoryReview
	instanceVariableNames: 'category'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorMethodCategoryReview class' category: #SmalltalkMentor!
SmalltalkMentorMethodCategoryReview class
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
	instanceVariableNames: 'targetClass selector category currentSource suggestedSource rationale window suggestedMorph messages transcriptMorph inputMorph busy languageButton mentor contentMorph providerLabel effortButton'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorReview class' category: #SmalltalkMentor!
SmalltalkMentorReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorConversationEditor category: #SmalltalkMentor!
TextEditor subclass: #SmalltalkMentorConversationEditor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorConversationEditor class' category: #SmalltalkMentor!
SmalltalkMentorConversationEditor class
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


!SmalltalkMentorConversationTextModel methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 1:14:41 pm (UTC)'!
editorClass

	"Use the editor that maps cmd+Enter to sending the message to the mentor."

	^SmalltalkMentorConversationEditor! !

!SmalltalkMentorConversationTextModel methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 1:14:36 pm (UTC)'!
review

	^review! !

!SmalltalkMentorConversationTextModel methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 1:14:39 pm (UTC)'!
review: aReview

	review := aReview! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
styleClass: aClassOrMetaClass

	"The class context used to syntax-highlight the suggestion as a method."

	styleClass := aClassOrMetaClass! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
aboutToStyleWith: anSHTextStyler

	"Style as a method in the reviewed class (classOrMetaClass set, workspace nil = method
	mode, not the red doit mode)."

	anSHTextStyler classOrMetaClass: styleClass.
	^true! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
editorClass

	"Use the editor that refuses to copy to the clipboard."

	^SmalltalkMentorNoCopyEditor! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
textStylerClass

	"Syntax-highlight the suggestion as Smalltalk."

	^SHTextStylerST80! !

!SmalltalkMentorTreeMorph methodsFor: 'events' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentorConversationTextMorph methodsFor: 'model access' stamp: 'HAW 19/Aug/2026, 1:29:20 pm (UTC)'!
canDiscardEdits

	"Only unsent, non-blank text in the follow-up input should block closing the window. An
	empty or whitespace-only field has nothing to lose, so the window can close without the
	'changes have not been saved' question; any other content (typed but not yet sent) keeps
	the question."

	^self text asString withBlanksTrimmed isEmpty! !

!SmalltalkMentorReviewWindow methodsFor: 'as yet unclassified' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
windowColor

	"Use the same tool color as the system browser so the lists, buttons and code panes are
	themed identically (a plain SystemWindow with no model would fall back to a gray default)."

	^Theme current browser! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 1:49:58 pm (UTC)'!
effort

	"The reasoning-effort level for this provider's model, e.g. 'low', 'medium', 'high'.
	Defaults to 'medium' when never set."

	^effort ifNil: [ 'medium' ]! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 1:50:00 pm (UTC)'!
effort: aString

	effort := aString! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
model

	^model! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
model: aString

	model := aString! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
name

	^name! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 19/Aug/2026, 5:47:44 pm (UTC)'!
effortButtonLabel

	"Label for the effort button in the review windows: the current effort, or that this
	provider has no effort concept."

	^'Effort: ', (self supportsEffort ifTrue: [ self effort ] ifFalse: [ 'n/a' ])! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 19/Aug/2026, 1:50:08 pm (UTC)'!
labelDescription

	"A short label for the UI: provider name, model and, only when this provider actually
	supports it, the configured effort level - e.g. 'Claude (claude-opus-4-8 - effort: medium)'
	or, when unsupported, just 'Gemini (gemini-2.0-flash)'."

	^(name ifNil: [ self class name ]), ' (', (model ifNil: [ '?' ]),
		(self supportsEffort ifTrue: [ ' - effort: ', self effort ] ifFalse: [ '' ]), ')'! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
printOn: aStream

	aStream nextPutAll: (name ifNil: [ self class name ]), ' (', (model ifNil: [ '?' ]), ')'! !

!LLMProvider methodsFor: 'requesting' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!LLMProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:04 pm (UTC)'!
addEffortTo: aJsonObject

	"Add this provider's effort-level parameter (if any) to the request body JSON object, in
	whatever shape this provider's API expects. Subclasses answer this; providers without an
	effort/thinking-level concept should just answer self (a no-op)."

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
authCurlArgs

	"The curl -H authorization argument(s) for this provider, reading the key from its
	key file at request time via $(cat ...). Subclasses answer this."

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
bodyForMessages: neutralMessages

	"Render the JSON request body from a collection of neutral {role, content} messages
	(role is 'user' or 'assistant'). Subclasses answer this in their wire format."

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
endpoint

	"The full request URL. Subclasses answer this (Gemini folds the model into the URL)."

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
extractTextFrom: jsonString

	"Parse the provider's JSON response and answer the assistant's text. Subclasses answer."

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:55:23 pm (UTC)'!
homeKeyPath

	"Path of this provider's key file under the shared ~/.smalltalk-mentor directory, using the
	same file name as in the image directory (checked after the image-directory key)."

	^'$HOME/.smalltalk-mentor/', self keyImageBasename! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
imageKeyPath

	"Absolute path of this provider's key file in the image directory (checked before the
	home-directory key)."

	^(Smalltalk imagePath ), '/', self keyImageBasename! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	"File name of this provider's key inside the image directory. Subclasses answer this."

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyLookupShellCommand

	"Shell command that prints this provider's API key: the key file in the image directory,
	falling back to the same-named file under ~/.smalltalk-mentor."

	^'cat "', self imageKeyPath, '" 2>/dev/null || cat "', self homeKeyPath, '" 2>/dev/null'! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:06 pm (UTC)'!
supportsEffort

	"Whether #addEffortTo: actually uses the effort level (vs. being a no-op because this
	provider's API has no such concept). Subclasses without one (e.g. Gemini) override to
	false. Used by the UI to decide whether to display the configured effort."

	^true! !

!LLMProvider class methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 5:22:20 pm (UTC)'!
effortLevels

	"The reasoning-effort levels offered in the UI, from least to most."

	^#('low' 'medium' 'high' 'xhigh' 'max')! !

!AnthropicProvider methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initialize

	name := 'Claude'.
	model := 'claude-opus-4-8'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:21 pm (UTC)'!
addEffortTo: aJsonObject

	"Anthropic Messages API: output_config.effort, one of low/medium/high/xhigh/max (GA, no
	beta header needed)."

	aJsonObject at: 'output_config' put: (JsonObject new at: 'effort' put: self effort; yourself)! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:55:35 pm (UTC)'!
authCurlArgs

	"Anthropic uses x-api-key plus a version header. The key is read from the image directory,
	then ~/.smalltalk-mentor, then the ANTHROPIC_API_KEY environment variable."

	^'-H "anthropic-version: 2023-06-01" -H "x-api-key: $(', self keyLookupShellCommand, ' || printf %s "$ANTHROPIC_API_KEY")"'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:23 pm (UTC)'!
bodyForMessages: neutralMessages

	"Anthropic Messages API: {model, max_tokens, messages:[{role, content}]} - the neutral
	messages are already in this shape. #addEffortTo: adds output_config.effort."

	| body |

	body := JsonObject new
		at: 'model' put: model;
		at: 'max_tokens' put: 2000;
		at: 'messages' put: neutralMessages asArray;
		yourself.
	self addEffortTo: body.
	^Json render: body! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
endpoint

	^'https://api.anthropic.com/v1/messages'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	^'anthropic.key'! !

!GeminiProvider methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initialize

	name := 'Gemini'.
	model := 'gemini-2.0-flash'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:30 pm (UTC)'!
addEffortTo: aJsonObject

	"Gemini has no low/medium/high effort knob - it uses a token-based 'thinking budget'
	instead, a different concept. No-op for now; a future version could translate self effort
	into generationConfig.thinkingConfig.thinkingBudget."

	^self! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
authCurlArgs

	"Gemini uses the x-goog-api-key header. The key is read from the image directory, then
	~/.smalltalk-mentor."

	^'-H "x-goog-api-key: $(', self keyLookupShellCommand, ')"'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:34 pm (UTC)'!
bodyForMessages: neutralMessages

	"Gemini generateContent: {contents:[{role, parts:[{text}]}], generationConfig}. Roles are
	'user' and 'model' (assistant -> model). #addEffortTo: is a no-op for this provider."

	| contents body |

	contents := neutralMessages collect: [ :eachMessage |
		JsonObject new
			at: 'role' put: ((eachMessage at: 'role') = 'assistant' ifTrue: [ 'model' ] ifFalse: [ 'user' ]);
			at: 'parts' put: { JsonObject new at: 'text' put: (eachMessage at: 'content'); yourself };
			yourself ].
	body := JsonObject new
		at: 'contents' put: contents asArray;
		at: 'generationConfig' put: (JsonObject new at: 'maxOutputTokens' put: 2000; yourself);
		yourself.
	self addEffortTo: body.
	^Json render: body! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
endpoint

	"Gemini folds the model into the URL path."

	^'https://generativelanguage.googleapis.com/v1beta/models/', model, ':generateContent'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!GeminiProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	^'gemini.key'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:32 pm (UTC)'!
supportsEffort

	"Gemini has no low/medium/high effort knob (see #addEffortTo:) - don't show one in the UI."

	^false! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
endpoint

	^endpoint! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:25 pm (UTC)'!
addEffortTo: aJsonObject

	"OpenAI-compatible reasoning models (o-series, gpt-5, etc.) accept a top-level
	'reasoning_effort' of low/medium/high. Non-reasoning backends are expected to ignore
	unknown fields; if some endpoint turns out to reject it, override this to a no-op there."

	aJsonObject at: 'reasoning_effort' put: self effort! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
authCurlArgs

	"OpenAI-compatible APIs use a Bearer token. The key is read from the image directory, then
	~/.smalltalk-mentor."

	^'-H "authorization: Bearer $(', self keyLookupShellCommand, ')"'! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 1:50:28 pm (UTC)'!
bodyForMessages: neutralMessages

	"OpenAI chat/completions: {model, messages:[{role, content}], max_tokens} - the neutral
	messages are already in this shape. #addEffortTo: adds reasoning_effort."

	| body |

	body := JsonObject new
		at: 'model' put: model;
		at: 'messages' put: neutralMessages asArray;
		at: 'max_tokens' put: 2000;
		yourself.
	self addEffortTo: body.
	^Json render: body! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	^imageKeyBasename! !

!OpenAICompatibleProvider methodsFor: 'as yet unclassified' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeName: aName endpoint: anEndpoint model: aModel imageKeyBasename: anImageBasename

	name := aName.
	endpoint := anEndpoint.
	model := aModel.
	imageKeyBasename := anImageBasename! !

!OpenAICompatibleProvider class methodsFor: 'as yet unclassified' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
name: aName endpoint: anEndpoint model: aModel imageKeyBasename: anImageBasename

	"Configure an OpenAI-compatible provider (ChatGPT / Deepseek / Nvidia NIM). Its key is read
	from <imageDir>/<imageKeyBasename> then ~/.smalltalk-mentor/<imageKeyBasename>."

	^self new
		initializeName: aName endpoint: anEndpoint model: aModel imageKeyBasename: anImageBasename! !

!SmalltalkMentor methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initialize

	"Start with the first provider selected and Spanish as the response language."

	provider := SmalltalkMentor providers first.
	language := 'Spanish'! !

!SmalltalkMentor methodsFor: 'copying' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
postCopy

	"A copied mentor gets its own frozen provider, so a review keeps its provider/model even
	if the shared mentor's provider or model later changes."

	super postCopy.
	provider := provider copy! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
language

	^language! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
language: aLanguage

	language := aLanguage! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
model

	"The model of the current provider."

	^self provider model! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
model: aString

	"Set the model of the current provider."

	self provider model: aString! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
provider

	^provider! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
provider: aProvider

	provider := aProvider! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
providers

	"The known providers (registry lives on the class)."

	^SmalltalkMentor providers! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
askAbout: source

	"Single-shot convenience: review a method source with no follow-up conversation.
	See #completionForMessages: and #promptFor:."

	^self completionForMessages: {
		self userMessage: (self promptFor: source) }! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 19/Aug/2026, 2:34:56 pm (UTC)'!
isTestMethodInClass: aClassOrMetaclass selector: aSelector

	"Whether aSelector names an installed test method of aClassOrMetaclass. Guards the
	not-installed case (e.g. a debugger DoIt), which is treated as a non-test."

	^(aClassOrMetaclass includesSelector: aSelector) and: [ (aClassOrMetaclass >> aSelector) isTestMethod ]! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewClassCategoryFromMorph: aMorph

	"Class-category (system category) list menu action / cmd+0 on a class category. aMorph is
	the category-list morph; its model is the browser. Snapshot this mentor and open a
	class-category review of every class in the selected category."

	| browser systemCategory reviewMentor |

	browser := aMorph model.
	systemCategory := [ browser selectedSystemCategory ] on: Error do: [ :e | nil ].
	systemCategory ifNil: [
		^PopUpMenu inform: 'Select a class category first, then press cmd+0.' ].
	reviewMentor := self copy.
	self showTransientToast: 'Smalltalk Mentor is reviewing class category ', systemCategory asString, ' with ', reviewMentor provider name.
	SmalltalkMentorClassCategoryReview reviewSystemCategory: systemCategory mentor: reviewMentor! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewClassFromMorph: aMorph

	"Class-list menu action / cmd+0 on a class. aMorph is the class-list morph; its model is
	the browser. Snapshot this mentor and open a class review."

	| aClass reviewMentor |

	aClass := [ aMorph model selectedClass ] on: Error do: [ :e | nil ].
	aClass ifNil: [ ^PopUpMenu inform: 'Select a class first, then press cmd+0.' ].
	reviewMentor := self copy.
	self showTransientToast: 'Smalltalk Mentor is reviewing class ', aClass name, ' with ', reviewMentor provider name.
	SmalltalkMentorClassReview reviewClass: aClass mentor: reviewMentor! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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
	source := aClass sourceCodeAt: aSelector ifAbsent: [ 
		aSelector = #DoIt 
			ifTrue: [ ^PopUpMenu inform: 'Cannot analyze a #DoIt method because it is not part of the class method dictionary' ]
			ifFalse: [ ^PopUpMenu inform: 'Cannot review this method because it does not have source' ]].
	category := codeProvider selectedMessageCategoryName.
	reviewMentor := self copy.
	reviewMentor
		reviewSource: source
		class: aClass
		selector: aSelector
		category: category
		toast: (self showThinkingToast: 'Smalltalk Mentor is reviewing ', aClass name, '>>', aSelector printString, ' with ', reviewMentor provider name)! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewMethodCategoryFromMorph: aMorph

	"Method-category list menu action / cmd+0 on a method category. aMorph is the category-list
	morph; its model is the browser. Snapshot this mentor and open a method-category review of
	every method in the selected category."

	| browser classOrMeta category reviewMentor |

	browser := aMorph model.
	classOrMeta := [ browser selectedClassOrMetaClass ] on: Error do: [ :e | nil ].
	category := [ browser selectedMessageCategoryName ] on: Error do: [ :e | nil ].
	(classOrMeta isNil or: [ category isNil ]) ifTrue: [
		^PopUpMenu inform: 'Select a method category first, then press cmd+0.' ].
	reviewMentor := self copy.
	self showTransientToast: 'Smalltalk Mentor is reviewing method category ', category asString, ' of ', classOrMeta name, ' with ', reviewMentor provider name.
	SmalltalkMentorMethodCategoryReview reviewCategory: category of: classOrMeta mentor: reviewMentor! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 19/Aug/2026, 2:35:41 pm (UTC)'!
reviewSource: source class: aClass selector: aSelector category: category toast: aToast

	"Fork the first network call (on this snapshot mentor's provider) so the UI is never
	blocked, then open the conversational review window bound to this mentor when the answer
	arrives. aToast (may be nil) is removed once the reply arrives or on error."

	[ [ | messages answer proposal |
	   messages := OrderedCollection with: (self userMessage: (self promptFor: source isTestMethod: (self isTestMethodInClass: aClass selector: aSelector))).
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

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 19/Aug/2026, 2:35:12 pm (UTC)'!
promptFor: source

	"Prompt for a stand-alone source with no method context (e.g. #askAbout:); the test-only
	heuristics are left out."

	^self promptFor: source isTestMethod: false! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 19/Aug/2026, 2:35:07 pm (UTC)'!
promptFor: source isTestMethod: isTestMethod

	"Assemble the review prompt: intro, response language, the applicable project heuristics
	(grouped under ## Category headings, each named with a [id]) - the test-only categories
	(## Testing) are included only when the reviewed method is a test - the JSON output
	contract, and the method source. The suggestion is the improved version of THIS method only."

	^'You are a Smalltalk expert reviewing a single method from a Cuis Smalltalk image.

Write the "rationale" field, and all of your conversational replies, in ', self language, '. Do NOT translate Smalltalk code, selectors, or identifiers - "suggestedSource" must remain valid Smalltalk.

Enforce these project-specific review heuristics. They are grouped under "## Category" headings, and each heuristic begins with a short name in brackets like [assert-equals]. Treat them as mandatory: if the method violates any heuristic, set canImprove to true, make suggestedSource comply, and in the rationale cite the [name] of each violated heuristic. Also apply your general Smalltalk expertise for any other improvements.
<heuristics>
', (self reviewHeuristicsForTestMethod: isTestMethod), '
</heuristics>

Reply with ONLY a JSON object (no prose, no markdown fences) of the form:
{"canImprove": true or false, "suggestedSource": "<a complete, compilable method with the SAME selector, or an empty string if it is already good>", "rationale": "<one or two sentences>"}
Here is the method:

', source! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
assistantMessage: aString

	^JsonObject new
		at: 'role' put: 'assistant';
		at: 'content' put: aString;
		yourself! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
completionForMessages: aCollectionOfMessages

	"Send a full conversation (neutral {role, content} messages) to the current provider
	and answer the raw assistant text."

	^self provider completionForMessages: aCollectionOfMessages! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
userMessage: aString

	^JsonObject new
		at: 'role' put: 'user';
		at: 'content' put: aString;
		yourself! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 19/Aug/2026, 5:22:25 pm (UTC)'!
chooseEffort

	"Menu action: pick the reasoning-effort level for the current provider's model. Meaning and
	support vary by provider (see each provider's #addEffortTo:); 'medium' is the default."

	self pickEffort ifTrue: [ self showTransientToast: 'Effort: ', self provider effort ]! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 19/Aug/2026, 5:47:49 pm (UTC)'!
chooseFrom: valueArray caption: aCaption current: currentValue

	"Pop a single-choice menu over valueArray, marking currentValue with a ' (current)' suffix
	so the reader can see which one is active, and answer the chosen value (nil when cancelled).
	Cuis's PopUpMenu always highlights its first item on pop-up, so the current value is shown by
	the suffix rather than by the selection cursor."

	| displayLabels chosenIndex |

	displayLabels := valueArray collect: [ :eachValue |
		eachValue = currentValue ifTrue: [ eachValue, ' (current)' ] ifFalse: [ eachValue ] ].
	chosenIndex := PopUpMenu withCaption: aCaption chooseFrom: displayLabels.
	chosenIndex = 0 ifTrue: [ ^nil ].
	^valueArray at: chosenIndex! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 19/Aug/2026, 5:47:54 pm (UTC)'!
chooseProvider

	"Menu action: pick the active provider from a list (marking the current one), then its model
	id. Runs on the UI process."

	| chosenName chosenProvider modelAnswer |

	chosenName := self chooseFrom: (self providers collect: [ :eachProvider | eachProvider name ]) asArray caption: 'Choose LLM provider' current: self provider name.
	chosenName ifNil: [ ^self ].
	chosenProvider := self providers detect: [ :eachProvider | eachProvider name = chosenName ].
	modelAnswer := self request: 'Model id for ', chosenProvider name initialAnswer: chosenProvider model.
	(modelAnswer notNil and: [ modelAnswer withBlanksTrimmed notEmpty ])
		ifTrue: [ chosenProvider model: modelAnswer withBlanksTrimmed ].
	self provider: chosenProvider.
	self showTransientToast: 'Provider: ', chosenProvider name, ' (', chosenProvider model, ')'! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 19/Aug/2026, 5:47:51 pm (UTC)'!
pickEffort

	"Pop the effort chooser (marking the current level) and, when the user picks a level and the
	current provider supports effort, set it on that provider. Answers whether the effort
	actually changed. Runs on the UI process."

	| chosenEffort |

	self provider supportsEffort ifFalse: [
		self showTransientToast: self provider name, ' has no effort setting'.
		^false ].
	chosenEffort := self chooseFrom: LLMProvider effortLevels caption: 'Choose model effort' current: self provider effort.
	chosenEffort ifNil: [ ^false ].
	self provider effort: chosenEffort.
	^true! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showTransientToast: aString

	"Show a toast that auto-dismisses after a couple of seconds."

	| toast |

	toast := self showThinkingToast: aString.
	[ (Delay forSeconds: 2) wait.
	  UISupervisor whenUIinSafeState: [ toast ifNotNil: [ toast delete ] ] ] fork.
	^toast! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
toggleLanguage

	"Flip the response language between Spanish and English, and briefly confirm."

	language := self language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ].
	self showTransientToast: 'Smalltalk Mentor response language: ', self language! !

!SmalltalkMentor methodsFor: 'as yet unclassified' stamp: 'HAW 18/Aug/2026, 12:49:31 pm (UTC)'!
smalltalkEditorMenuSpec ^Array new! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 2:34:33 pm (UTC)'!
categoryOfHeuristic: aHeuristicId

	"The '## Category' name whose section declares [aHeuristicId], or '' when none does."

	^(self heuristicSections
		detect: [ :section | self does: section value includeSubstring: '[', aHeuristicId, ']' ]
		ifNone: [ '' -> '' ]) key! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
currentReviewHeuristics

	"The heuristics to enforce, looked up in order:
	 1. <imageDirectory>/smalltalk-mentor-heuristics.md  (per-image heuristics, checked first)
	 2. ~/.smalltalk-mentor/heuristics.md                (per-user heuristics)
	 3. the built-in #defaultReviewHeuristics
	Files are read via the shell (avoids resolving $HOME in the image), mirroring the key
	handling."

	| tmp raw |

	tmp := '/tmp/smalltalk-mentor-heuristics.txt'.
	OSProcess waitForCommand:
		'sh -c ''I="', (Smalltalk imagePath ), '/smalltalk-mentor-heuristics.md"; H="$HOME/.smalltalk-mentor/heuristics.md"; if [ -s "$I" ]; then cat "$I"; elif [ -s "$H" ]; then cat "$H"; fi > ', tmp, ' 2>/dev/null || : > ', tmp, ''''.
	raw := [ tmp asFileEntry fileContents asString ] on: Error do: [ :e | '' ].
	raw := raw withBlanksTrimmed.
	^raw isEmpty ifTrue: [ self defaultReviewHeuristics ] ifFalse: [ raw ]! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
defaultReviewHeuristics

	"Built-in project heuristics, used when ~/.smalltalk-mentor/heuristics.md is absent or blank.
	Grouped under ## Category headings; each heuristic is prefixed with a short [id] name so the
	mentor can cite it. Edit here, or override by creating that file (see #reviewHeuristicsFilePath
	/ #writeDefaultReviewHeuristicsFile)."

	^'## Testing
- [assert-equals] Prefer `assert: expected equals: actual` over `assert: expected = actual`
  (and over other `assert:`/`deny:` boolean-equality forms) so a failing test shows both
  the expected and the actual value.

## Object design
- [valid-on-creation] Objects should be valid from the moment they are created: instance
  creation messages validate their arguments with assertions encapsulated on the class side.'! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 2:34:17 pm (UTC)'!
heuristicSections

	"Split the current heuristics text into sections, one per '## Category' heading, keeping
	order. Answers a collection of associations categoryName -> sectionText, where sectionText
	keeps the heading line and the section's trailing blank line so joining sections reproduces
	the file. Any text before the first heading is kept under an empty category name."

	| sections currentCategory currentLines flushSection |

	sections := OrderedCollection new.
	currentCategory := ''.
	currentLines := OrderedCollection new.
	flushSection := [
		(currentLines anySatisfy: [ :eachLine | eachLine withBlanksTrimmed notEmpty ]) ifTrue: [
			sections add: currentCategory -> (String streamContents: [ :stream |
				currentLines do: [ :eachLine | stream nextPutAll: eachLine; nextPutAll: String newLineString ] ]) ] ].
	self currentReviewHeuristics lines do: [ :eachLine | | trimmedLine |
		trimmedLine := eachLine withBlanksTrimmed.
		(trimmedLine beginsWith: '## ') ifTrue: [
			flushSection value.
			currentCategory := (trimmedLine allButFirst: 3) withBlanksTrimmed.
			currentLines := OrderedCollection new ].
		currentLines add: eachLine ].
	flushSection value.
	^sections! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 2:34:21 pm (UTC)'!
isTestOnlyCategory: aCategoryName

	"Whether a heuristic category applies only to test methods, so it is left out when reviewing
	a non-test method. Add other test-only category names here if the need arises."

	^aCategoryName = 'Testing'! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 2:34:37 pm (UTC)'!
isTestOnlyHeuristic: aHeuristicId

	"Whether [aHeuristicId] belongs to a test-only category (see #isTestOnlyCategory:)."

	^self isTestOnlyCategory: (self categoryOfHeuristic: aHeuristicId)! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
reviewHeuristicsFilePath

	"Where project-specific review heuristics live."

	^'~/.smalltalk-mentor/heuristics.md'! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 2:34:28 pm (UTC)'!
reviewHeuristicsForTestMethod: isTestMethod

	"The heuristics text to enforce for the method under review: every section, minus the
	test-only categories (e.g. ## Testing) when the reviewed method is not a test."

	^String streamContents: [ :stream |
		self heuristicSections do: [ :section |
			((self isTestOnlyCategory: section key) and: [ isTestMethod not ])
				ifFalse: [ stream nextPutAll: section value ] ] ]! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
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

!SmalltalkMentor methodsFor: 'private' stamp: 'HAW 19/Aug/2026, 2:34:45 pm (UTC)'!
does: aString includeSubstring: aSubstring

	"Whether aString contains aSubstring (case-sensitive)."

	| substringSize |

	substringSize := aSubstring size.
	substringSize = 0 ifTrue: [ ^true ].
	1 to: aString size - substringSize + 1 do: [ :startIndex |
		(aString copyFrom: startIndex to: startIndex + substringSize - 1) = aSubstring ifTrue: [ ^true ] ].
	^false! !

!SmalltalkMentor class methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initialize

	"Install the cmd+0 menu on the current instance when the package loads."

	self initializeMenues! !

!SmalltalkMentor class methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
unload

	self unloadMenues! !

!SmalltalkMentor class methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
current

	"The single Smalltalk Mentor instance, holding the selected provider and language."

	^Current ifNil: [ Current := self new ]! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
buildProviders

	"The known providers, with sensible default models (change per provider via the menu,
	or with `aProvider model: '...'`). Each reads its key from <imageDir>/<name>.key first,
	then its home key file, then (Anthropic) the env var."

	^OrderedCollection new
		add: self claude;
		add: self chatGPT;
		add: self deepseek;
		add: self nvidiaNIM;
		add: self gemini;
		yourself! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 18/Aug/2026, 1:45:39 pm (UTC)'!
chatGPT

	^ OpenAICompatibleProvider name: 'ChatGPT'
		endpoint: 'https://api.openai.com/v1/chat/completions'
		model: 'gpt-4o'
		imageKeyBasename: 'openai.key'! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 17/Aug/2026, 9:55:53 pm (UTC)'!
claude

	^ AnthropicProvider new! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 18/Aug/2026, 1:45:41 pm (UTC)'!
deepseek

	^ OpenAICompatibleProvider name: 'Deepseek'
		endpoint: 'https://api.deepseek.com/chat/completions'
		model: 'deepseek-chat'
		imageKeyBasename: 'deepseek.key'! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 17/Aug/2026, 9:56:36 pm (UTC)'!
gemini

	^ GeminiProvider new! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 19/Aug/2026, 12:58:38 pm (UTC)'!
nvidiaNIM

	^ OpenAICompatibleProvider name: 'Nvidia NIM'
		endpoint: 'https://integrate.api.nvidia.com/v1/chat/completions'
		model: 'meta/llama-3.1-8b-instruct'
		imageKeyBasename: 'nvidia.key'! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
providers

	"The known LLM providers (cached so per-provider model changes persist for the session)."

	^Providers ifNil: [ Providers := self buildProviders ]! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 12:00:06 pm (UTC)'!
browserWindowMenuSpecs

	^{ 	
		{ #classListMenuSpec. self classReviewMenuSpecSend }.
		{ #messageListMenuSpec. self messageListMenuSpecSend }.
		{ #messageCatListMenuSpec. self methodCategoryReviewMenuSpecSend }.
		{ #systemCatListMenuSpec. self classCategoryReviewMenuSpecSend }.
		{ #SmalltalkEditor. self smalltalkEditorMenuSpecSend }}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 19/Aug/2026, 7:49:30 pm (UTC)'!
classCategoryReviewMenuSpec

	"A 'Smalltalk Mentor' submenu for the class-category (system category) list pane: review
	every class of the selected category, choose the provider/model/effort, or toggle the language."

	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Review this class category (0)'. $0. self current. #reviewClassCategoryFromMorph:. #findIcon }.
		{ 12020. 'Choose LLM provider and model...'. nil. self current. #chooseProvider. #chatIcon }.
		{ 12030. 'Choose model effort...'. nil. self current. #chooseEffort. #systemMonitorIcon }.
		{ 12040. 'Toggle response language (Spanish/English)'. nil. self current. #toggleLanguage. #preferencesDesktopFontIcon }
	}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
classCategoryReviewMenuSpecSend

	^MessageSend receiver: self selector: #classCategoryReviewMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 19/Aug/2026, 7:49:21 pm (UTC)'!
classReviewMenuSpec

	"A 'Smalltalk Mentor' submenu for the class-list pane: review the class, choose the
	provider/model/effort, or toggle the response language (all act on the current instance)."

	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Review this class (0)'. $0. self current. #reviewClassFromMorph:. #findIcon }.
		{ 12020. 'Choose LLM provider and model...'. nil. self current. #chooseProvider. #chatIcon }.
		{ 12030. 'Choose model effort...'. nil. self current. #chooseEffort. #systemMonitorIcon }.
		{ 12040. 'Toggle response language (Spanish/English)'. nil. self current. #toggleLanguage. #preferencesDesktopFontIcon }
	}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
classReviewMenuSpecSend

	^MessageSend receiver: self selector: #classReviewMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
debuggerWindowMenuSpecs

	^{ { #SmalltalkEditor. self smalltalkEditorMenuSpecSend } }.! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeMenues

	BrowserWindow registerAll: self browserWindowMenuSpecs.
	MethodSetWindow registerAll: self methodSetWindowMenuSpecs.
	DebuggerWindow registerAll: self debuggerWindowMenuSpecs.! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
messageListMenuSpec

	^self smalltalkEditorMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 10:51:19 am (UTC)'!
messageListMenuSpecSend

	^ MessageSend receiver: self selector: #messageListMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 19/Aug/2026, 7:49:27 pm (UTC)'!
methodCategoryReviewMenuSpec

	"A 'Smalltalk Mentor' submenu for the method-category (protocol) list pane: review every
	method of the selected category, choose the provider/model/effort, or toggle the language."

	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Review this method category (0)'. $0. self current. #reviewMethodCategoryFromMorph:. #findIcon }.
		{ 12020. 'Choose LLM provider and model...'. nil. self current. #chooseProvider. #chatIcon }.
		{ 12030. 'Choose model effort...'. nil. self current. #chooseEffort. #systemMonitorIcon }.
		{ 12040. 'Toggle response language (Spanish/English)'. nil. self current. #toggleLanguage. #preferencesDesktopFontIcon }
	}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
methodCategoryReviewMenuSpecSend

	^MessageSend receiver: self selector: #methodCategoryReviewMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
methodSetWindowMenuSpecs

	^ { { #messageListMenuSpec. self messageListMenuSpecSend }.
		{ #SmalltalkEditor. self smalltalkEditorMenuSpecSend }}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 19/Aug/2026, 7:49:25 pm (UTC)'!
smalltalkEditorMenuSpec

	"A 'Smalltalk Mentor' submenu in the code pane. Actions target the current instance.
	Fields: id, label, shortcutChar, target, selector, icon."

	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Ask for a better version (0)'. $0. self current. #reviewFromMorph:. #findIcon }.
		{ 12020. 'Choose LLM provider and model...'. nil. self current. #chooseProvider. #chatIcon }.
		{ 12030. 'Choose model effort...'. nil. self current. #chooseEffort. #systemMonitorIcon }.
		{ 12040. 'Toggle response language (Spanish/English)'. nil. self current. #toggleLanguage. #preferencesDesktopFontIcon }
	}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 10:52:18 am (UTC)'!
smalltalkEditorMenuSpecSend

	^MessageSend receiver: self selector: #smalltalkEditorMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
unloadMenues

	BrowserWindow unregisterAll: self browserWindowMenuSpecs.
	MethodSetWindow unregisterAll: self methodSetWindowMenuSpecs.
	DebuggerWindow unregisterAll: self debuggerWindowMenuSpecs.! !

!SmalltalkMentorClassReview methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeClass: aClass mentor: aMentor

	targetClass := aClass theNonMetaClass.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
classReferencedFindingsFor: aClass

	"Heuristic 7: the class should be referenced. Flags a class that no other class mentions and
	that has no subclasses - i.e. dead code. References from the class's own methods do not
	count."

	| result external |

	result := OrderedCollection new.
	external := (Smalltalk allCallsOn: aClass binding)
		reject: [ :mr | mr actualClass theNonMetaClass == aClass ].
	(external isEmpty and: [ aClass subclasses isEmpty ]) ifTrue: [
		result add: (SmalltalkMentorFinding
			title: 'Class not referenced: ', aClass name
			detail: 'The class ', aClass name, ' is not referenced by any other class and has no subclasses - it may be dead code.'
			editKind: #none
			editTarget: nil) ].
	^result! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
classReviewRootNodesFor: aClass

	"The class-review subtree for aClass: one root per static heuristic (children = its failing
	elements), then 'Instance methods' and 'Class methods' grouped by category. Reused both as
	the roots of a class review and, lazily, under each class of a class-category review."

	| roots |

	roots := OrderedCollection new.
	(self heuristicGroupsFor: aClass) do: [ :group |
		| children |
		children := group value collect: [ :finding |
			SmalltalkMentorNode label: finding title kind: #finding payload: finding children: #() model: self ].
		roots add: (SmalltalkMentorNode
			label: group key, ' (', children size printString, ')'
			kind: #heuristicRoot payload: nil children: children model: self) ].
	roots add: (self methodsSideNodeFor: aClass label: 'Instance methods').
	roots add: (self methodsSideNodeFor: aClass class label: 'Class methods').
	^roots! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
classVariableFindingsFor: aClass

	"Heuristic 4: every class variable should be both read and written (instance or class side)."

	| findings |

	findings := OrderedCollection new.
	aClass classVarNames asSortedCollection do: [ :classVariableName |
		| binding sources assignmentCount occurrenceCount isWritten isRead problem |
		binding := aClass bindingOf: classVariableName.
		sources := OrderedCollection new.
		(aClass whichSelectorsReferTo: binding) do: [ :referringSelector | sources add: (aClass sourceCodeAt: referringSelector) ].
		(aClass class whichSelectorsReferTo: binding) do: [ :referringSelector | sources add: (aClass class sourceCodeAt: referringSelector) ].
		assignmentCount := sources inject: 0 into: [ :runningTotal :eachSource | runningTotal + (self countOf: classVariableName, ' :=' in: eachSource) + (self countOf: classVariableName, ':=' in: eachSource) ].
		occurrenceCount := sources inject: 0 into: [ :runningTotal :eachSource | runningTotal + (self countOf: classVariableName in: eachSource) ].
		isWritten := assignmentCount > 0.
		isRead := occurrenceCount > assignmentCount.
		(isRead and: [ isWritten ]) ifFalse: [
			problem := (isRead or: [ isWritten ])
				ifFalse: [ 'is never read nor written' ]
				ifTrue: [ isRead ifTrue: [ 'is read but never written' ] ifFalse: [ 'is written but never read' ] ].
			findings add: (SmalltalkMentorFinding
				title: 'Class variable ', classVariableName, ' ', problem
				detail: 'The class variable ''', classVariableName, ''' of ', aClass name, ' ', problem, '.'
				editKind: #variable
				editTarget: (aClass -> classVariableName)) ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
commonLeafSubclassProtocolFindingsFor: rootClass

	"Heuristic 8: when rootClass has more than one leaf subclass, every message that instances of ALL
	those leaf subclasses answer - restricted to protocol introduced within rootClass's own
	hierarchy - should be implemented in rootClass itself, concretely or as subclassResponsibility,
	so the shared protocol is declared in one place. Flags each such message rootClass omits."

	| leafSubclasses sharedSelectors findings |

	findings := OrderedCollection new.
	leafSubclasses := rootClass allSubclasses select: [ :eachSubclass | eachSubclass subclasses isEmpty ].
	(leafSubclasses size between: 2 and: 300) ifFalse: [ ^findings ].
	sharedSelectors := self sharedSelectorsAmongLeaves: leafSubclasses ofRoot: rootClass.
	sharedSelectors asSortedCollection do: [ :sharedSelector |
		(rootClass includesSelector: sharedSelector) ifFalse: [
			findings add: (self missingRootProtocolFindingFor: sharedSelector root: rootClass) ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
heuristicGroupsFor: aClass

	"The static (Smalltalk) verifications for aClass, as title -> (collection of findings)
	associations. Each becomes a heuristic root in the tree."

	^OrderedCollection new
		add: 'Instance variables read & written' -> (self instanceVariableFindingsFor: aClass);
		add: 'Class variables read & written' -> (self classVariableFindingsFor: aClass);
		add: 'Methods have senders' -> (self methodsWithoutSendersFindingsFor: aClass);
		add: 'Messages have implementers' -> (self messagesWithoutImplementersFindingsFor: aClass);
		add: 'Methods are categorized' -> (self uncategorizedMethodsFindingsFor: aClass);
		add: 'No unused or write-only temporaries' -> (self unusedTemporariesFindingsFor: aClass);
		add: 'Class is referenced' -> (self classReferencedFindingsFor: aClass);
		add: 'Shared leaf-subclass protocol in root' -> (self commonLeafSubclassProtocolFindingsFor: aClass);
		yourself! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
instanceVariableFindingsFor: aClass

	"Heuristic 1: every instance variable should be both read and written in the instance-side
	methods."

	| findings |

	findings := OrderedCollection new.
	aClass instVarNames do: [ :instanceVariableName |
		| instanceVariableIndex accessorSelectors isRead isWritten problem |
		instanceVariableIndex := aClass allInstVarNames indexOf: instanceVariableName.
		accessorSelectors := aClass whichSelectorsAccess: instanceVariableName.
		isWritten := (aClass whichSelectorsStoreInto: instanceVariableName) notEmpty.
		isRead := accessorSelectors anySatisfy: [ :accessorSelector | (aClass >> accessorSelector) readsField: instanceVariableIndex ].
		(isRead and: [ isWritten ]) ifFalse: [
			problem := (isRead or: [ isWritten ])
				ifFalse: [ 'is never read nor written' ]
				ifTrue: [ isRead ifTrue: [ 'is read but never written' ] ifFalse: [ 'is written but never read' ] ].
			findings add: (SmalltalkMentorFinding
				title: 'Instance variable ', instanceVariableName, ' ', problem
				detail: 'The instance variable ''', instanceVariableName, ''' of ', aClass name, ' ', problem, '.'
				editKind: #variable
				editTarget: (aClass -> instanceVariableName)) ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
messagesWithoutImplementersFindingsFor: aClass

	"Heuristic 3: every message sent by this class's methods should have an implementer."

	| findings seenMessages |

	findings := OrderedCollection new.
	seenMessages := Set new.
	{ aClass. aClass class } do: [ :classOrMetaclass |
		classOrMetaclass selectors asSortedCollection do: [ :eachSelector |
			(classOrMetaclass >> eachSelector) messages do: [ :sentMessage |
				(seenMessages includes: sentMessage) ifFalse: [
					seenMessages add: sentMessage.
					(Smalltalk allImplementorsOf: sentMessage) isEmpty ifTrue: [
						findings add: (SmalltalkMentorFinding
							title: 'No implementer: #', sentMessage
							detail: 'The message #', sentMessage, ' is sent (e.g. in ', classOrMetaclass name, '>>', eachSelector, ') but no class implements it - likely a typo or a missing method.'
							editKind: #method
							editTarget: (classOrMetaclass -> eachSelector)) ] ] ] ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
methodsWithoutSendersFindingsFor: aClass

	"Heuristic 2: every implemented message should have a sender. Excludes methods that override an
	inherited implementation and test methods (run by metaprogramming)."

	| findings |

	findings := OrderedCollection new.
	{ aClass. aClass class } do: [ :classOrMetaclass |
		classOrMetaclass selectors asSortedCollection do: [ :eachSelector |
			((Smalltalk allCallsOn: eachSelector) isEmpty
				and: [ (classOrMetaclass superclass canUnderstand: eachSelector) not
				and: [ (classOrMetaclass >> eachSelector) isTestMethod not ] ]) ifTrue: [
				findings add: (SmalltalkMentorFinding
					title: 'No senders: ', classOrMetaclass name, '>>', eachSelector
					detail: 'The method ', classOrMetaclass name, '>>', eachSelector, ' has no senders in the image and does not override an inherited method - it may be dead code.'
					editKind: #method
					editTarget: (classOrMetaclass -> eachSelector)) ] ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
uncategorizedMethodsFindingsFor: aClass

	"Heuristic 5: every method should be in a meaningful protocol (not 'as yet unclassified')."

	| findings |

	findings := OrderedCollection new.
	{ aClass. aClass class } do: [ :classOrMetaclass |
		classOrMetaclass selectors asSortedCollection do: [ :eachSelector |
			| categoryName |
			categoryName := self categoryOf: eachSelector in: classOrMetaclass.
			(categoryName isNil or: [ categoryName asString = 'as yet unclassified' ]) ifTrue: [
				findings add: (SmalltalkMentorFinding
					title: 'Uncategorized: ', classOrMetaclass name, '>>', eachSelector
					detail: 'The method ', classOrMetaclass name, '>>', eachSelector, ' is not categorized. Move it into a meaningful protocol.'
					editKind: #method
					editTarget: (classOrMetaclass -> eachSelector)) ] ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
unusedTemporariesFindingsFor: aClass

	"Heuristic 6: no method should declare a temporary variable that is never read - an unreferenced
	temporary, or one that is only written."

	| findings |

	findings := OrderedCollection new.
	{ aClass. aClass class } do: [ :classOrMetaclass |
		classOrMetaclass selectors asSortedCollection do: [ :eachSelector |
			findings addAll: (self unusedTemporariesFindingsIn: classOrMetaclass selector: eachSelector) ] ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
buildRootNodes

	^self classReviewRootNodesFor: targetClass! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
methodsSideNodeFor: aClassOrMetaclass label: aLabel

	"A side node ('Instance methods' / 'Class methods') whose children are category nodes, each
	with one method leaf per method."

	| categoryNodes |

	categoryNodes := OrderedCollection new.
	aClassOrMetaclass organization categories asSortedCollection do: [ :categoryName |
		| selectorsInCategory methodNodes |
		selectorsInCategory := (aClassOrMetaclass organization listAtCategoryNamed: categoryName) asSortedCollection.
		selectorsInCategory notEmpty ifTrue: [
			methodNodes := selectorsInCategory collect: [ :eachSelector |
				SmalltalkMentorNode label: eachSelector asString kind: #method payload: (aClassOrMetaclass -> eachSelector) children: #() model: self ].
			categoryNodes add: (SmalltalkMentorNode
				label: categoryName asString kind: #category payload: nil children: methodNodes model: self) ] ].
	^SmalltalkMentorNode
		label: aLabel, ' (', aClassOrMetaclass selectors size printString, ')'
		kind: #side payload: nil children: categoryNodes model: self! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
nodeSelected: aNode

	"Dispatch a tree selection: a method leaf triggers a (lazy) LLM review; a finding leaf
	shows an editor (method or class-definition) or text; headers clear the panel."

	aNode kind = #method ifTrue: [ ^self showMethodReview: aNode payload ].
	aNode kind = #finding ifTrue: [ ^self showFinding: aNode payload ].
	self clearDetail! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
rootNodes

	"Tree roots (cached): one per static heuristic (children = its failing elements), then
	'Instance methods' and 'Class methods' grouped by category."

	^treeRoots ifNil: [ treeRoots := self buildRootNodes ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
selectedIndex

	"The currently selected wrapper node (or nil). The tree reads this back to keep the row
	highlighted."

	^selectedIndex! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
selectedIndex: aWrapper

	"The tree passes the selected wrapper node here (via complexContents), not an integer.
	Remember it, refresh the visual selection (so the row shows selected), and act on it."

	selectedIndex := aWrapper.
	self changed: #selectedIndex.
	(aWrapper isKindOf: SmalltalkMentorNode) ifTrue: [ self nodeSelected: aWrapper ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
clearDetail

	detailHolder removeAllMorphs! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
codePaneForBrowser: aBrowser

	"A code pane identical to a class browser's (method-mode syntax highlighting, refactorings
	menu, senders/implementors, etc.), backed by a real Browser model."

	^TextModelMorph
		textProvider: aBrowser
		textGetter: #acceptedContents
		textSetter: #contents:notifying:
		selectionGetter: #contentsSelection! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
renderDetail: aMorph

	"Replace the detail pane with aMorph, themed with the window's tool color. Morphs added
	after the window opened do NOT inherit the window colour automatically (openInWorld only
	themes what was there at open time), so LLM review panels / editors / text would otherwise
	show the default gray theme instead of the browser one."

	detailHolder removeAllMorphs.
	detailHolder addMorph: aMorph layoutSpec: LayoutSpec useAll.
	window ifNotNil: [ aMorph adoptWidgetsColor: window widgetsColor ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showFinding: aFinding

	"A static finding was selected: for a method-related finding show an editable code pane on
	that method; for a variable-related finding show the class definition editor with the
	variable selected; otherwise show the text description."

	aFinding editKind = #method ifTrue: [ ^self showMethodEditorFor: aFinding editTarget ].
	aFinding editKind = #variable ifTrue: [ ^self showClassDefinitionEditorFor: aFinding editTarget ].
	self showText: aFinding detail! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showMethodEditorFor: aClassSelectorAssociation

	"Show the method in a real browser code pane (same styling, menu and refactorings as the
	system browser). Editing + cmd+S compiles it into the class."

	| browser |

	browser := Browser new.
	browser setClass: aClassSelectorAssociation key selector: aClassSelectorAssociation value.
	self renderDetail: (self codePaneForBrowser: browser)! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showReviewPanel: aReview

	self renderDetail: aReview buildContent! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showText: aString

	self renderDetail: (TextModelMorph withText: aString asText)! !

!SmalltalkMentorClassReview methodsFor: 'reviewing' stamp: 'HAW 19/Aug/2026, 2:35:50 pm (UTC)'!
buildReviewFor: aClassSelectorAssociation

	"Do the LLM review for one method with its own frozen mentor (per-method language), and
	answer a ready SmalltalkMentorReview."

	| reviewedClass reviewedSelector source methodMentor prompt answer proposal conversationMessages review |

	reviewedClass := aClassSelectorAssociation key.
	reviewedSelector := aClassSelectorAssociation value.
	source := reviewedClass sourceCodeAt: reviewedSelector.
	methodMentor := mentor copy.
	prompt := methodMentor promptFor: source isTestMethod: (methodMentor isTestMethodInClass: reviewedClass selector: reviewedSelector).
	answer := methodMentor provider completionForMessages: { methodMentor userMessage: prompt }.
	proposal := methodMentor parseProposalFrom: answer.
	conversationMessages := OrderedCollection new.
	conversationMessages add: (methodMentor userMessage: prompt); add: (methodMentor assistantMessage: answer).
	review := SmalltalkMentorReview new
		initializeClass: reviewedClass
		selector: reviewedSelector
		category: (self categoryOf: reviewedSelector in: reviewedClass)
		current: source
		suggested: (proposal at: 'suggestedSource' ifAbsent: [ '' ])
		rationale: (proposal at: 'rationale' ifAbsent: [ '' ])
		messages: conversationMessages
		mentor: methodMentor.
	^review! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
hideThinking

	thinkingToast ifNotNil: [ thinkingToast delete. thinkingToast := nil ]! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showThinkingFor: aClassSelectorAssociation

	"Show the 'analyzing' toast (as when a single method is reviewed) and a placeholder in the
	right panel."

	| reviewedClass reviewedSelector location |

	reviewedClass := aClassSelectorAssociation key.
	reviewedSelector := aClassSelectorAssociation value.
	location := reviewedClass name, '>>', reviewedSelector printString.
	thinkingToast := mentor showThinkingToast: 'Smalltalk Mentor is analyzing ', location, ' with ', mentor provider name.
	self showText: 'Analyzing ', location, ' with ', mentor provider name, ' ...'! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
browseNode: aNode

	"Context menu 'Browse': open a class browser on the selected method, or on the relevant
	class definition for variable/other nodes."

	aNode kind = #method ifTrue: [
		^BrowserWindow fullOnClass: aNode payload key selector: aNode payload value ].
	aNode kind = #finding ifTrue: [
		| finding |
		finding := aNode payload.
		finding editKind = #method ifTrue: [
			^BrowserWindow fullOnClass: finding editTarget key selector: finding editTarget value ].
		finding editKind = #variable ifTrue: [
			^BrowserWindow fullOnClass: finding editTarget key selector: nil ] ].
	aNode kind = #classTop ifTrue: [
		^BrowserWindow fullOnClass: aNode payload selector: nil ].
	^BrowserWindow fullOnClass: targetClass selector: nil! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 19/Aug/2026, 5:48:09 pm (UTC)'!
changeEffort

	"Effort button below the tree: pick the reasoning-effort level for this review's provider
	(used by the future lazy per-method reviews), then refresh the effort button label."

	mentor pickEffort ifTrue: [
		effortButton ifNotNil: [ effortButton label: mentor provider effortButtonLabel ] ]! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 19/Aug/2026, 5:48:14 pm (UTC)'!
changeProvider

	"Provider button below the tree: pick the LLM provider (marking the current one) and its
	model for this review's future lazy reviews. Uses a copy so changes stay local to this
	window. Refreshes the provider and effort buttons."

	| chosenName chosenProvider modelAnswer |

	chosenName := mentor chooseFrom: (mentor providers collect: [ :eachProvider | eachProvider name ]) asArray caption: 'Choose LLM provider' current: mentor provider name.
	chosenName ifNil: [ ^self ].
	chosenProvider := (mentor providers detect: [ :eachProvider | eachProvider name = chosenName ]) copy.
	modelAnswer := mentor request: 'Model id for ', chosenProvider name initialAnswer: chosenProvider model.
	(modelAnswer notNil and: [ modelAnswer withBlanksTrimmed notEmpty ]) ifTrue: [ chosenProvider model: modelAnswer withBlanksTrimmed ].
	mentor provider: chosenProvider.
	providerButton ifNotNil: [ providerButton label: 'LLM: ', mentor provider printString ].
	effortButton ifNotNil: [ effortButton label: mentor provider effortButtonLabel ]! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
runAgainNode: aNode

	"Context menu 'Run again': for a method review re-run the LLM review; otherwise re-run the
	static verifications and refresh the tree."

	aNode kind = #method ifTrue: [
		methodReviewCache removeKey: aNode payload ifAbsent: [ ].
		^self showMethodReview: aNode payload ].
	treeRoots := nil.
	self changed: #rootNodes! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 19/Aug/2026, 5:48:21 pm (UTC)'!
openWindow

	"Master-detail window built the same way as the system browser (a LinearLayoutMorph row
	inside the window's own layoutMorph, with a drag adjuster between the panes) and themed with
	the browser tool color: left = tree (with right-click menu) + a provider button (name and
	model) and an effort button (current effort); right = detail. The provider/model with its
	effort is shown inside each method review panel."

	| leftCol row providerRow |

	window := SmalltalkMentorReviewWindow new.
	window setLabel: 'Smalltalk Mentor - ', self windowLabel.
	treeMorph := SmalltalkMentorTreeMorph
		withModel: self
		listGetter: #rootNodes
		indexGetter: #selectedIndex
		indexSetter: #selectedIndex:.
	providerButton := PluggableButtonMorph model: self action: #changeProvider label: 'LLM: ', mentor provider printString.
	effortButton := PluggableButtonMorph model: self action: #changeEffort label: mentor provider effortButtonLabel.
	providerRow := LinearLayoutMorph newRow.
	providerRow
		addMorph: providerButton proportionalWidth: 0.6;
		addMorph: effortButton proportionalWidth: 0.4.
	leftCol := LinearLayoutMorph newColumn.
	leftCol
		addMorph: treeMorph proportionalHeight: 1.0;
		addMorph: providerRow fixedHeight: 30.
	detailHolder := LayoutMorph newColumn.
	row := LinearLayoutMorph newRow.
	row
		addMorph: leftCol proportionalWidth: 0.34;
		addAdjusterAndMorph: detailHolder proportionalWidth: 0.66.
	window layoutMorph addMorph: row proportionalHeight: 1.0.
	window openInWorld! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
start

	"Open the class-review window. The static findings are computed lazily by the tree; method
	reviews happen when a method is selected."

	self openWindow! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
windowLabel

	"The window title suffix (after 'Smalltalk Mentor - '). Subclasses override for the
	method-category and class-category reviews."

	^'class ', targetClass name! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
categoryOf: aSelector in: aClassOrMeta

	"The method's protocol, defaulting safely."

	^[ aClassOrMeta organization categoryOfElement: aSelector ]
		on: Error do: [ :e | 'as yet unclassified' ]! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
countOf: aSubstring in: aString

	"Case-sensitive count of non-overlapping occurrences of aSubstring in aString."

	| substringSize occurrenceCount scanIndex |

	substringSize := aSubstring size.
	substringSize = 0 ifTrue: [ ^0 ].
	occurrenceCount := 0.
	scanIndex := 1.
	[ scanIndex + substringSize - 1 <= aString size ] whileTrue: [
		(aString copyFrom: scanIndex to: scanIndex + substringSize - 1) = aSubstring
			ifTrue: [ occurrenceCount := occurrenceCount + 1. scanIndex := scanIndex + substringSize ]
			ifFalse: [ scanIndex := scanIndex + 1 ] ].
	^occurrenceCount! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
firstIndexOf: aSubstring in: aString

	"First 1-based index of aSubstring in aString (case-sensitive), or 0."

	| substringSize |

	substringSize := aSubstring size.
	substringSize = 0 ifTrue: [ ^0 ].
	1 to: aString size - substringSize + 1 do: [ :scanIndex |
		(aString copyFrom: scanIndex to: scanIndex + substringSize - 1) = aSubstring ifTrue: [ ^scanIndex ] ].
	^0! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
missingRootProtocolFindingFor: aSelector root: rootClass

	"A finding: aSelector is answered by every leaf subclass of rootClass but rootClass does not
	implement it. Points at one subclass implementation as a reference to lift."

	| anImplementor |

	anImplementor := rootClass allSubclasses detect: [ :eachSubclass | eachSubclass includesSelector: aSelector ] ifNone: [ nil ].
	^SmalltalkMentorFinding
		title: 'Not in root: #', aSelector, ' (every leaf subclass of ', rootClass name, ' answers it)'
		detail: 'Instances of every leaf subclass of ', rootClass name, ' answer #', aSelector, ', but ', rootClass name, ' does not implement it. Lift it to ', rootClass name, ' as a concrete method or as subclassResponsibility so the shared protocol is declared in one place.'
		editKind: (anImplementor isNil ifTrue: [ #none ] ifFalse: [ #method ])
		editTarget: (anImplementor isNil ifTrue: [ nil ] ifFalse: [ anImplementor -> aSelector ])! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
sharedSelectorsAmongLeaves: leafSubclasses ofRoot: rootClass

	"The selectors that instances of every leaf subclass answer, restricted to protocol
	introduced within rootClass's own hierarchy (protocol inherited from above rootClass is
	excluded, so shared Object protocol is not reported)."

	| protocolAboveRoot sharedSelectors |

	protocolAboveRoot := rootClass superclass
		ifNil: [ Set new ]
		ifNotNil: [ :aSuperclass | aSuperclass allSelectors asSet ].
	sharedSelectors := nil.
	leafSubclasses do: [ :eachLeaf | | protocolIntroducedBelowRoot |
		protocolIntroducedBelowRoot := eachLeaf allSelectors asSet reject: [ :eachSelector | protocolAboveRoot includes: eachSelector ].
		sharedSelectors := sharedSelectors
			ifNil: [ protocolIntroducedBelowRoot ]
			ifNotNil: [ sharedSelectors select: [ :eachSelector | protocolIntroducedBelowRoot includes: eachSelector ] ] ].
	^sharedSelectors ifNil: [ Set new ]! !

!SmalltalkMentorClassReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
unusedTemporariesFindingsIn: aClassOrMetaclass selector: aSelector

	"The unused/write-only temporary variables of one method, as findings (empty if none, or if
	the method cannot be parsed). isUnusedTemp is 'never read' (hasRefs not), which covers both
	an unreferenced temporary and a write-only one. Only real TempVariableNodes are considered:
	closure analysis bundles block-captured temporaries into a RemoteTempVectorNode (a subclass
	whose name is a range like '<0-6>') that must be ignored. Arguments are not temporaries."

	| findings |

	findings := OrderedCollection new.
	[ | methodNode temporaryNodes |
	  methodNode := (aClassOrMetaclass >> aSelector) methodNode.
	  methodNode ensureClosureAnalysisDone.
	  temporaryNodes := IdentitySet new.
	  methodNode accept: (ParseNodeEnumerator ofBlock: [ :parseNode |
		(parseNode isKindOf: BlockNode) ifTrue: [
			(parseNode temporaries ifNil: [ #() ]) do: [ :temporaryNode |
				temporaryNode class == TempVariableNode ifTrue: [ temporaryNodes add: temporaryNode ] ] ] ]).
	  (temporaryNodes asSortedCollection: [ :firstNode :secondNode | firstNode name <= secondNode name ]) do: [ :temporaryNode |
		temporaryNode isUnusedTemp ifTrue: [ | isWritten problem |
			isWritten := (temporaryNode instVarNamed: 'hasDefs') == true.
			problem := isWritten ifTrue: [ 'is assigned but never read' ] ifFalse: [ 'is declared but never used' ].
			findings add: (SmalltalkMentorFinding
				title: 'Temporary ', temporaryNode name, ' ', problem, ': ', aClassOrMetaclass name, '>>', aSelector
				detail: 'The temporary variable ''', temporaryNode name, ''' in ', aClassOrMetaclass name, '>>', aSelector, ' ', problem, '.'
				editKind: #method
				editTarget: (aClassOrMetaclass -> aSelector)) ] ] ]
		on: Error do: [ :error | ].
	^findings! !

!SmalltalkMentorClassReview methodsFor: 'as yet unclassified' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showClassDefinitionEditorFor: aClassVariableAssociation

	"Show the class definition (of the finding's class) in a real browser code pane
	(class-definition mode: refactorings, add/remove instance variable, etc.). Accept redefines
	the class. The variable is pre-selected."

	| definedClass variableName browser codePane classDefinitionText variableIndex |

	definedClass := aClassVariableAssociation key.
	variableName := aClassVariableAssociation value.
	browser := Browser new.
	browser setClass: definedClass selector: nil.
	browser editClass.
	codePane := self codePaneForBrowser: browser.
	self renderDetail: codePane.
	classDefinitionText := browser acceptedContents asString.
	variableIndex := self firstIndexOf: variableName in: classDefinitionText.
	variableIndex > 0 ifTrue: [ [ codePane editor selectFrom: variableIndex to: variableIndex + variableName size - 1 ] on: Error do: [ :error | ] ]! !

!SmalltalkMentorClassReview class methodsFor: 'instance creation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewClass: aClass mentor: aMentor

	"Open a class-review window for aClass using aMentor (a frozen snapshot). Runs the four
	static verifications synchronously, opens the window, then reviews every method in the
	background."

	^(self new initializeClass: aClass mentor: aMentor) start! !

!SmalltalkMentorClassCategoryReview methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeSystemCategory: aString mentor: aMentor

	systemCategory := aString.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorClassCategoryReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
classesInCategory

	"The (non-meta) classes of the reviewed system category, sorted alphabetically by name."

	^((SystemOrganization listAtCategoryNamed: systemCategory)
		collect: [ :nameSym | Smalltalk at: nameSym ifAbsent: [ nil ] ])
		select: [ :each | each isBehavior ]! !

!SmalltalkMentorClassCategoryReview methodsFor: 'tree' stamp: 'HAW 19/Aug/2026, 12:36:50 am (UTC)'!
buildRootNodes

	"One top node per class of the system category, sorted alphabetically. Each class expands
	lazily into the very same subtree a class review shows for it (static heuristic roots + method
	categories), so opening a class here behaves like reviewing that class."

	| sortedClasses |

	sortedClasses := self classesInCategory asSortedCollection: [ :firstClass :secondClass | firstClass name <= secondClass name ].
	^(sortedClasses collect: [ :eachClass |
		SmalltalkMentorNode
			label: eachClass name
			kind: #classTop
			payload: eachClass
			childrenBlock: [ self classReviewRootNodesFor: eachClass ]
			model: self ]) asOrderedCollection! !

!SmalltalkMentorClassCategoryReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
windowLabel

	^'class category ', systemCategory asString! !

!SmalltalkMentorClassCategoryReview class methodsFor: 'instance creation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewSystemCategory: aString mentor: aMentor

	"Open a class-category review window: every class of the system category aString, each
	behaving as a class review when expanded, using aMentor for lazy method reviews."

	^(self new initializeSystemCategory: aString mentor: aMentor) start! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeClassOrMeta: aClassOrMeta category: aCategory mentor: aMentor

	"aClassOrMeta is the class or metaclass whose method category is being reviewed; it is NOT
	normalized to the instance side, so a class-side category reviews class methods."

	targetClass := aClassOrMeta.
	category := aCategory.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'tree' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
buildRootNodes

	"One method leaf per method of the reviewed category (reviewed lazily on selection, exactly
	as in a class review). The virtual '-- all --' category reviews every method of the class."

	| selectorsToReview |

	selectorsToReview := category asString = ClassOrganizer allCategory asString
		ifTrue: [ targetClass selectors asSortedCollection ]
		ifFalse: [ (targetClass organization listAtCategoryNamed: category) asSortedCollection ].
	^(selectorsToReview collect: [ :eachSelector |
		SmalltalkMentorNode
			label: eachSelector asString
			kind: #method
			payload: (targetClass -> eachSelector)
			children: #()
			model: self ]) asOrderedCollection! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
windowLabel

	^'method category ', category asString, ' of ', targetClass name! !

!SmalltalkMentorMethodCategoryReview class methodsFor: 'instance creation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
reviewCategory: aCategory of: aClassOrMeta mentor: aMentor

	"Open a method-category review window: the methods of aCategory in aClassOrMeta, each
	reviewed lazily by aMentor when selected."

	^(self new initializeClassOrMeta: aClassOrMeta category: aCategory mentor: aMentor) start! !

!SmalltalkMentorFinding methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeTitle: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget

	title := aTitle.
	detail := aDetail.
	editKind := anEditKind.
	editTarget := anEditTarget! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
detail

	^detail! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
editKind

	^editKind! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
editTarget

	^editTarget! !

!SmalltalkMentorFinding methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
title

	^title! !

!SmalltalkMentorFinding class methodsFor: 'instance creation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
title: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget

	"editKind is #method (editTarget = class->selector), #variable (editTarget = var name in
	targetClass), or #none (text-only detail)."

	^self new initializeTitle: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget! !

!SmalltalkMentorReview methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeClass: aClass selector: aSelector category: aCategory current: currentSrc suggested: suggestedSrc rationale: aRationale messages: aMessagesCollection mentor: aMentor

	targetClass := aClass.
	selector := aSelector.
	category := aCategory.
	currentSource := currentSrc withCuisLineEndings.
	suggestedSource := self formattedSource: suggestedSrc.
	rationale := aRationale.
	messages := aMessagesCollection.
	mentor := aMentor.
	busy := false! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 19/Aug/2026, 5:48:59 pm (UTC)'!
buildContent

	"Build (once) and answer the review's content morph: a provider/model/effort label,
	transcript, original | suggested panes, and - below a drag adjuster - a labelled, resizable
	multi-line follow-up input, then the buttons (Send, Effort, Idioma). The ORIGINAL pane is a
	real browser code pane; the SUGGESTED pane is syntax-highlighted but no-copy. Enter inserts a
	newline in the input; cmd+Enter (or the button) sends it. The drag adjuster above the label
	grows or shrinks the input."

	| contentColumn panesRow buttonsRow originalPaneMorph sendButton suggestedPaneText originalBrowser suggestedModel conversationLabel inputGroup inputModel |

	contentMorph ifNotNil: [ ^contentMorph ].
	contentColumn := LayoutMorph newColumn.
	providerLabel := LabelMorph contents: 'LLM: ', mentor provider labelDescription.
	transcriptMorph := TextModelMorph withText: ('Smalltalk Mentor: ', rationale, String newLineString) asText.
	suggestedPaneText := suggestedSource isEmpty ifTrue: [ currentSource ] ifFalse: [ suggestedSource ].
	originalBrowser := Browser new.
	originalBrowser setClass: targetClass selector: selector.
	originalPaneMorph := TextModelMorph
		textProvider: originalBrowser
		textGetter: #acceptedContents
		textSetter: #contents:notifying:
		selectionGetter: #contentsSelection.
	suggestedModel := SmalltalkMentorNoCopyTextModel withText: suggestedPaneText asText.
	suggestedModel styleClass: targetClass.
	suggestedMorph := TextModelMorph withModel: suggestedModel.
	panesRow := LayoutMorph newRow.
	panesRow addMorph: originalPaneMorph layoutSpec: (LayoutSpec proportionalWidth: 0.5 proportionalHeight: 1.0).
	panesRow addAdjusterAndMorph: suggestedMorph proportionalWidth: 0.5.
	conversationLabel := LabelMorph contents: 'Tell the mentor (ask a follow-up or push back, then press cmd+Enter):'.
	inputModel := SmalltalkMentorConversationTextModel withText: '' asText.
	inputModel review: self.
	inputMorph := SmalltalkMentorConversationTextMorph withModel: inputModel.
	inputGroup := LayoutMorph newColumn.
	inputGroup addMorph: conversationLabel layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 18).
	inputGroup addMorph: inputMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 1.0).
	sendButton := PluggableButtonMorph model: self action: #sendFollowUp label: 'Send (cmd+Enter)'.
	effortButton := PluggableButtonMorph model: self action: #changeEffort label: mentor provider effortButtonLabel.
	languageButton := PluggableButtonMorph model: self action: #switchLanguage label: 'Idioma: ', mentor language.
	buttonsRow := LayoutMorph newRow.
	buttonsRow addMorph: sendButton layoutSpec: (LayoutSpec proportionalWidth: 0.45 proportionalHeight: 1.0).
	buttonsRow addMorph: effortButton layoutSpec: (LayoutSpec proportionalWidth: 0.25 proportionalHeight: 1.0).
	buttonsRow addMorph: languageButton layoutSpec: (LayoutSpec proportionalWidth: 0.3 proportionalHeight: 1.0).
	contentColumn addMorph: providerLabel layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 20).
	contentColumn addMorph: transcriptMorph layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.28).
	contentColumn addAdjusterAndMorph: panesRow proportionalHeight: 0.57.
	contentColumn addAdjusterAndMorph: inputGroup proportionalHeight: 0.15.
	contentColumn addMorph: buttonsRow layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 34).
	contentMorph := contentColumn.
	^contentMorph! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
closeWindow

	window ifNotNil: [ window delete ]! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
open

	"Open the review as its own window (single-method review), themed with the browser tool
	color. The provider/model is shown in the panel (via #buildContent), not the title."

	window := SmalltalkMentorReviewWindow new.
	window setLabel: 'Smalltalk Mentor - ', targetClass name, '>>', selector printString.
	window addMorph: self buildContent layoutSpec: LayoutSpec useAll.
	window openInWorld! !

!SmalltalkMentorReview methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
listLabel

	"How this method review appears in the class-review window's left list."

	^targetClass name, '>>', selector printString! !

!SmalltalkMentorReview methodsFor: 'compiling' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
accept

	"Compile the current contents of the right-hand pane into the target class."

	| suggestedSourceText |

	suggestedSourceText := suggestedMorph text asString.
	suggestedSourceText isEmpty ifTrue: [ ^PopUpMenu inform: 'Nothing to compile.' ].
	[ targetClass compile: suggestedSourceText classified: category ]
		on: Error
		do: [ :error | ^PopUpMenu inform: 'Compile failed: ', error messageText ].
	Transcript show: 'Compiled Smalltalk Mentor suggestion into ', targetClass name, '>>', selector printString; newLine.
	self closeWindow! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
appendTranscript: aString

	"Append a line to the dialogue transcript and scroll it to the bottom (must run on
	the UI process)."

	| newText end |

	newText := transcriptMorph text asString, aString, String newLineString.
	transcriptMorph model actualContents: newText asText.
	end := newText size.
	[ transcriptMorph editor selectFrom: end + 1 to: end.
	  transcriptMorph scrollSelectionIntoView ] on: Error do: [ :e | ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 19/Aug/2026, 5:48:44 pm (UTC)'!
changeEffort

	"Effort button: pick the reasoning-effort level for this review's provider (it affects the
	follow-up messages you send), then refresh the LLM label (which keeps the effort) and the
	effort button label."

	mentor pickEffort ifTrue: [
		providerLabel ifNotNil: [ providerLabel contents: 'LLM: ', mentor provider labelDescription ].
		effortButton ifNotNil: [ effortButton label: mentor provider effortButtonLabel ] ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
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
		   suggested isEmpty ifFalse: [ self showSuggestion: suggested ].
		   self appendTranscript: 'Smalltalk Mentor: ', (proposal at: 'rationale' ifAbsent: [ '(no rationale)' ]).
		   busy := false ] ]
		on: Error
		do: [ :e |
			UISupervisor whenUIinSafeState: [
				self appendTranscript: 'Error: ', e messageText.
				busy := false ] ] ] fork! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 19/Aug/2026, 1:15:37 pm (UTC)'!
sendFollowUp

	"Send the typed follow-up (plus the current suggestion-pane code) to the provider, keeping
	the conversation. Triggered by the Send button or by cmd+Enter in the input field. The input
	is a multi-line pane whose editor edits the model in place, so its text is read live."

	| note content |

	busy == true ifTrue: [ ^self ].
	note := inputMorph text asString withBlanksTrimmed.
	note isEmpty ifTrue: [ ^self ].
	content := note, String newLineString, String newLineString,
		'For reference, the current version of the method I am looking at is:', String newLineString,
		suggestedMorph text asString, String newLineString, String newLineString,
		'Reply again with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'.
	UISupervisor whenUIinSafeState: [
		inputMorph model actualContents: '' asText.
		inputMorph updateActualContents ].
	self postUserContent: content transcriptLabel: 'You: ', note! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showSuggestion: aString

	"Replace the right-hand pane with a new suggestion, pretty-printed so it is properly
	multi-lined (some providers, e.g. Nvidia NIM, return single-line source)."

	suggestedSource := self formattedSource: aString.
	suggestedMorph ifNotNil: [ suggestedMorph model actualContents: suggestedSource asText ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
switchLanguage

	"Flip this conversation's language between Spanish and English (on this review's mentor),
	relabel the button, and ask the provider to restate the current rationale in the new
	language."

	| conversationContent |

	busy == true ifTrue: [ ^self ].
	mentor language: (mentor language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ]).
	languageButton ifNotNil: [ languageButton label: 'Idioma: ', mentor language ].
	conversationContent := 'From now on, reply in ', mentor language, '. Restate your previous rationale in ', mentor language,
		' without changing suggestedSource. Reply with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'.
	self postUserContent: conversationContent transcriptLabel: 'You: (idioma -> ', mentor language, ')'! !

!SmalltalkMentorReview methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
formattedSource: aString

	"Pretty-print a suggested method so it is properly multi-lined and indented regardless of
	how the provider formatted it - some models (e.g. Nvidia NIM / llama) return the whole
	method on a single line. Falls back to the raw (line-ending-normalized) text if it does
	not parse."

	aString withBlanksTrimmed isEmpty ifTrue: [ ^aString ].
	^[ Compiler format: aString in: targetClass notifying: nil ]
		on: Error do: [ :e | aString withCuisLineEndings ]! !

!SmalltalkMentorReview class methodsFor: 'instance creation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
openFor: aClass selector: aSelector category: aCategory current: currentSrc suggested: suggestedSrc rationale: aRationale messages: aMessagesCollection mentor: aMentor

	^(self new
		initializeClass: aClass
		selector: aSelector
		category: aCategory
		current: currentSrc
		suggested: suggestedSrc
		rationale: aRationale
		messages: aMessagesCollection
		mentor: aMentor) open! !

!SmalltalkMentorConversationEditor methodsFor: 'typing/selecting keys' stamp: 'HAW 19/Aug/2026, 1:14:44 pm (UTC)'!
returnKey: aKeyboardEvent

	"cmd+Enter sends the typed message to the mentor; a plain Enter inserts a newline (this is a
	multi-line input)."

	(aKeyboardEvent commandAltKeyPressed and: [ model isKindOf: SmalltalkMentorConversationTextModel ]) ifTrue: [
		model review ifNotNil: [ :conversationReview | conversationReview sendFollowUp ].
		^true ].
	^super returnKey: aKeyboardEvent! !

!SmalltalkMentorNoCopyEditor methodsFor: 'clipboard' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
clipboardTextPut: aText

	"Copy is disabled for the suggested-code pane so students type the refactoring themselves
	instead of copying the mentor's answer. Swallow the clipboard write."

	^aText! !

!SmalltalkMentorNode methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeLabel: aLabel kind: aKind payload: aPayload children: aChildrenCollection model: aModel

	self setItem: aPayload model: aModel.
	label := aLabel.
	kind := aKind.
	childNodes := aChildrenCollection! !

!SmalltalkMentorNode methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
kind

	^kind! !

!SmalltalkMentorNode methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
payload

	"The wrapped domain object (a finding detail string, or a class->selector association)."

	^item! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
asString

	^label! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
contents

	"Child wrappers for the tree. Children may be provided lazily as a block (evaluated and
	cached on first expansion) so a subtree's cost is only paid when it is opened."

	(childNodes isKindOf: BlockClosure) ifTrue: [ childNodes := childNodes value ].
	^childNodes ifNil: [ #() ]! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
hasContents

	"A node with a lazy children block always shows as expandable."

	(childNodes isKindOf: BlockClosure) ifTrue: [ ^true ].
	^(childNodes ifNil: [ #() ]) notEmpty! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
sendSettingMessageTo: aModel

	"Called by the tree when this node is selected."

	aModel nodeSelected: self! !

!SmalltalkMentorNode class methodsFor: 'instance creation' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
label: aLabel kind: aKind payload: aPayload children: aChildrenCollection model: aModel

	^self new
		initializeLabel: aLabel kind: aKind payload: aPayload children: aChildrenCollection model: aModel! !

!SmalltalkMentorNode class methodsFor: 'as yet unclassified' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
label: aLabel kind: aKind payload: aPayload childrenBlock: aBlock model: aModel

	"Like #label:kind:payload:children:model: but the children are computed lazily by aBlock
	the first time the node is expanded."

	^self new initializeLabel: aLabel kind: aKind payload: aPayload children: aBlock model: aModel! !
SmalltalkMentor initialize!
