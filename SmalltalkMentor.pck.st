'From Cuis7.9 [latest update: #8158] on 9 September 2026 at 10:09:49 am'!
'Description Add per-method heuristics as method objects and review the code with them'!
!provides: 'SmalltalkMentor' 1 51!
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

!classDefinition: #SmalltalkDesignHeuristic category: #SmalltalkMentor!
Object subclass: #SmalltalkDesignHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkDesignHeuristic class' category: #SmalltalkMentor!
SmalltalkDesignHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ClassIsReferencedHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #ClassIsReferencedHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ClassIsReferencedHeuristic class' category: #SmalltalkMentor!
ClassIsReferencedHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ClassVariablesReadAndWrittenHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #ClassVariablesReadAndWrittenHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ClassVariablesReadAndWrittenHeuristic class' category: #SmalltalkMentor!
ClassVariablesReadAndWrittenHeuristic class
	instanceVariableNames: ''!

!classDefinition: #InstanceCreationFunnelHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #InstanceCreationFunnelHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'InstanceCreationFunnelHeuristic class' category: #SmalltalkMentor!
InstanceCreationFunnelHeuristic class
	instanceVariableNames: ''!

!classDefinition: #InstanceVariablesReadAndWrittenHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #InstanceVariablesReadAndWrittenHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'InstanceVariablesReadAndWrittenHeuristic class' category: #SmalltalkMentor!
InstanceVariablesReadAndWrittenHeuristic class
	instanceVariableNames: ''!

!classDefinition: #MessagesHaveImplementersHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #MessagesHaveImplementersHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'MessagesHaveImplementersHeuristic class' category: #SmalltalkMentor!
MessagesHaveImplementersHeuristic class
	instanceVariableNames: ''!

!classDefinition: #MethodsAreCategorizedHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #MethodsAreCategorizedHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'MethodsAreCategorizedHeuristic class' category: #SmalltalkMentor!
MethodsAreCategorizedHeuristic class
	instanceVariableNames: ''!

!classDefinition: #MethodsHaveSendersHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #MethodsHaveSendersHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'MethodsHaveSendersHeuristic class' category: #SmalltalkMentor!
MethodsHaveSendersHeuristic class
	instanceVariableNames: ''!

!classDefinition: #NoEmptyMethodCategoriesHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #NoEmptyMethodCategoriesHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'NoEmptyMethodCategoriesHeuristic class' category: #SmalltalkMentor!
NoEmptyMethodCategoriesHeuristic class
	instanceVariableNames: ''!

!classDefinition: #NoUnusedTemporariesHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #NoUnusedTemporariesHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'NoUnusedTemporariesHeuristic class' category: #SmalltalkMentor!
NoUnusedTemporariesHeuristic class
	instanceVariableNames: ''!

!classDefinition: #OneInitializeMessageHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #OneInitializeMessageHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'OneInitializeMessageHeuristic class' category: #SmalltalkMentor!
OneInitializeMessageHeuristic class
	instanceVariableNames: ''!

!classDefinition: #RepeatedClassWordHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #RepeatedClassWordHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'RepeatedClassWordHeuristic class' category: #SmalltalkMentor!
RepeatedClassWordHeuristic class
	instanceVariableNames: ''!

!classDefinition: #SelfOverExplicitClassReferenceHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #SelfOverExplicitClassReferenceHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SelfOverExplicitClassReferenceHeuristic class' category: #SmalltalkMentor!
SelfOverExplicitClassReferenceHeuristic class
	instanceVariableNames: ''!

!classDefinition: #SharedLeafSubclassProtocolHeuristic category: #SmalltalkMentor!
SmalltalkDesignHeuristic subclass: #SharedLeafSubclassProtocolHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SharedLeafSubclassProtocolHeuristic class' category: #SmalltalkMentor!
SharedLeafSubclassProtocolHeuristic class
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
	instanceVariableNames: 'reviewedCategory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorMethodCategoryReview class' category: #SmalltalkMentor!
SmalltalkMentorMethodCategoryReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMentorMethodReview category: #SmalltalkMentor!
SmalltalkMentorClassReview subclass: #SmalltalkMentorMethodReview
	instanceVariableNames: 'selector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorMethodReview class' category: #SmalltalkMentor!
SmalltalkMentorMethodReview class
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
	instanceVariableNames: 'targetClass selector category currentSource suggestedSource rationale suggestedMorph messages transcriptMorph inputMorph busy languageButton mentor contentMorph providerLabel effortButton'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMentorReview class' category: #SmalltalkMentor!
SmalltalkMentorReview class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkMethodHeuristic category: #SmalltalkMentor!
Object subclass: #SmalltalkMethodHeuristic
	instanceVariableNames: 'compiledMethod'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SmalltalkMethodHeuristic class' category: #SmalltalkMentor!
SmalltalkMethodHeuristic class
	instanceVariableNames: ''!

!classDefinition: #AndOrOverBooleanOperatorsHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #AndOrOverBooleanOperatorsHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'AndOrOverBooleanOperatorsHeuristic class' category: #SmalltalkMentor!
AndOrOverBooleanOperatorsHeuristic class
	instanceVariableNames: ''!

!classDefinition: #AndOrTakeBlocksHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #AndOrTakeBlocksHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'AndOrTakeBlocksHeuristic class' category: #SmalltalkMentor!
AndOrTakeBlocksHeuristic class
	instanceVariableNames: ''!

!classDefinition: #AvoidSettersHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #AvoidSettersHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'AvoidSettersHeuristic class' category: #SmalltalkMentor!
AvoidSettersHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ComparisonWithNilHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #ComparisonWithNilHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ComparisonWithNilHeuristic class' category: #SmalltalkMentor!
ComparisonWithNilHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ConditionalOnEmptyTestHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #ConditionalOnEmptyTestHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ConditionalOnEmptyTestHeuristic class' category: #SmalltalkMentor!
ConditionalOnEmptyTestHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ConditionalOnNilTestHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #ConditionalOnNilTestHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ConditionalOnNilTestHeuristic class' category: #SmalltalkMentor!
ConditionalOnNilTestHeuristic class
	instanceVariableNames: ''!

!classDefinition: #DenyOverAssertNotHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #DenyOverAssertNotHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'DenyOverAssertNotHeuristic class' category: #SmalltalkMentor!
DenyOverAssertNotHeuristic class
	instanceVariableNames: ''!

!classDefinition: #EqualityOverIdentityHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #EqualityOverIdentityHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'EqualityOverIdentityHeuristic class' category: #SmalltalkMentor!
EqualityOverIdentityHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ExceptionBlockSingleSendHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #ExceptionBlockSingleSendHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ExceptionBlockSingleSendHeuristic class' category: #SmalltalkMentor!
ExceptionBlockSingleSendHeuristic class
	instanceVariableNames: ''!

!classDefinition: #ExceptionBlockWithoutAssignmentHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #ExceptionBlockWithoutAssignmentHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'ExceptionBlockWithoutAssignmentHeuristic class' category: #SmalltalkMentor!
ExceptionBlockWithoutAssignmentHeuristic class
	instanceVariableNames: ''!

!classDefinition: #IfTrueIfFalseOrderHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #IfTrueIfFalseOrderHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'IfTrueIfFalseOrderHeuristic class' category: #SmalltalkMentor!
IfTrueIfFalseOrderHeuristic class
	instanceVariableNames: ''!

!classDefinition: #InstanceCreationFormatHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #InstanceCreationFormatHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'InstanceCreationFormatHeuristic class' category: #SmalltalkMentor!
InstanceCreationFormatHeuristic class
	instanceVariableNames: ''!

!classDefinition: #KeywordMessageSendFormatHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #KeywordMessageSendFormatHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'KeywordMessageSendFormatHeuristic class' category: #SmalltalkMentor!
KeywordMessageSendFormatHeuristic class
	instanceVariableNames: ''!

!classDefinition: #MessageKeywordsLowercaseHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #MessageKeywordsLowercaseHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'MessageKeywordsLowercaseHeuristic class' category: #SmalltalkMentor!
MessageKeywordsLowercaseHeuristic class
	instanceVariableNames: ''!

!classDefinition: #MethodComplexityHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #MethodComplexityHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'MethodComplexityHeuristic class' category: #SmalltalkMentor!
MethodComplexityHeuristic class
	instanceVariableNames: ''!

!classDefinition: #MoveHelperMethodToRightClassHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #MoveHelperMethodToRightClassHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'MoveHelperMethodToRightClassHeuristic class' category: #SmalltalkMentor!
MoveHelperMethodToRightClassHeuristic class
	instanceVariableNames: ''!

!classDefinition: #NoExtraParenthesisHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #NoExtraParenthesisHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'NoExtraParenthesisHeuristic class' category: #SmalltalkMentor!
NoExtraParenthesisHeuristic class
	instanceVariableNames: ''!

!classDefinition: #NoNilPreconditionHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #NoNilPreconditionHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'NoNilPreconditionHeuristic class' category: #SmalltalkMentor!
NoNilPreconditionHeuristic class
	instanceVariableNames: ''!

!classDefinition: #NoSetGetHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #NoSetGetHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'NoSetGetHeuristic class' category: #SmalltalkMentor!
NoSetGetHeuristic class
	instanceVariableNames: ''!

!classDefinition: #NoTypePreconditionHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #NoTypePreconditionHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'NoTypePreconditionHeuristic class' category: #SmalltalkMentor!
NoTypePreconditionHeuristic class
	instanceVariableNames: ''!

!classDefinition: #RedundantIfTrueConditionHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #RedundantIfTrueConditionHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'RedundantIfTrueConditionHeuristic class' category: #SmalltalkMentor!
RedundantIfTrueConditionHeuristic class
	instanceVariableNames: ''!

!classDefinition: #SizeComparedWithZeroHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #SizeComparedWithZeroHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'SizeComparedWithZeroHeuristic class' category: #SmalltalkMentor!
SizeComparedWithZeroHeuristic class
	instanceVariableNames: ''!

!classDefinition: #TestingForEqualityHeuristic category: #SmalltalkMentor!
SmalltalkMethodHeuristic subclass: #TestingForEqualityHeuristic
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmalltalkMentor'!
!classDefinition: 'TestingForEqualityHeuristic class' category: #SmalltalkMentor!
TestingForEqualityHeuristic class
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


!SmalltalkMentorConversationTextModel methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
editorClass

	^SmalltalkMentorConversationEditor! !

!SmalltalkMentorConversationTextModel methodsFor: 'accessing' stamp: 'HAW 19/Aug/2026, 1:14:36 pm (UTC)'!
review

	^review! !

!SmalltalkMentorConversationTextModel methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:16:35 am (UTC)'!
initializeReview: aReview

	review := aReview! !

!SmalltalkMentorConversationTextModel class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:16:33 am (UTC)'!
withText: aText review: aReview

	^(self withText: aText) initializeReview: aReview! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
aboutToStyleWith: anSHTextStyler

	anSHTextStyler classOrMetaClass: styleClass.
	^true! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
editorClass

	^SmalltalkMentorNoCopyEditor! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'styling' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
textStylerClass

	^SHTextStylerST80! !

!SmalltalkMentorNoCopyTextModel methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:16:24 am (UTC)'!
initializeStyleClass: aClassOrMetaclass

	styleClass := aClassOrMetaclass! !

!SmalltalkMentorNoCopyTextModel class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:16:21 am (UTC)'!
withText: aText styleClass: aClassOrMetaclass

	^(self withText: aText) initializeStyleClass: aClassOrMetaclass! !

!SmalltalkMentorTreeMorph methodsFor: 'events' stamp: 'HAW 9/Sep/2026, 3:07:57 am (UTC)'!
mouseButton2Down: aMouseButtonEvent localPosition: localEventPosition

	| itemMorph node menu |

	itemMorph := self itemFromPoint: localEventPosition.
	itemMorph ifNil: [
		^super
			mouseButton2Down: aMouseButtonEvent
			localPosition: localEventPosition ].
	self setSelectedMorph: itemMorph.
	node := itemMorph complexContents.
	menu := MenuMorph new.
	menu
		add: 'Run again'
		target: model
		action: #runAgainNode:
		argumentList: { node }.
	menu
		add: 'Browse'
		target: model
		action: #browseNode:
		argumentList: { node }.
	menu popUpInWorld! !

!SmalltalkMentorConversationTextMorph methodsFor: 'model access' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
canDiscardEdits

	^self text asString withBlanksTrimmed isEmpty! !

!SmalltalkMentorReviewWindow methodsFor: 'GUI building' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
windowColor

	^Theme current browser! !

!LLMProvider methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
effort

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

!LLMProvider methodsFor: 'printing' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
effortButtonLabel

	^'Effort: ', (self supportsEffort ifTrue: [ self effort ] ifFalse: [ 'n/a' ])! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 9/Sep/2026, 2:44:22 am (UTC)'!
effortDescription

	^self supportsEffort ifTrue: [ ' - effort: ', self effort ] ifFalse: [ '' ]! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 9/Sep/2026, 3:05:47 am (UTC)'!
labelDescription

	^(name ifNil: [ self class name ]), ' (',
		(model ifNil: [ '?' ]), self effortDescription, ')'! !

!LLMProvider methodsFor: 'printing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
printOn: aStream

	aStream nextPutAll: (name ifNil: [ self class name ]), ' (', (model ifNil: [ '?' ]), ')'! !

!LLMProvider methodsFor: 'requesting' stamp: 'HAW 9/Sep/2026, 2:44:13 am (UTC)'!
completionForMessages: neutralMessages

	| requestPath responsePath |

	requestPath := '/tmp/smalltalk-mentor-req.json'.
	responsePath := '/tmp/smalltalk-mentor-resp.json'.
	requestPath asFileEntry fileContents: (self bodyForMessages: neutralMessages).
	OSProcess waitForCommand: (self curlCommandFrom: requestPath to: responsePath).
	^self extractTextFrom: responsePath asFileEntry fileContents! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
addEffortTo: aJsonObject

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
authCurlArgs

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
bodyForMessages: neutralMessages

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:44:15 am (UTC)'!
curlCommandFrom: aRequestPath to: aResponsePath

	^'curl -sS ', self endpoint,
		' -H "content-type: application/json" ', self authCurlArgs,
		' --data-binary @', aRequestPath,
		' -o ', aResponsePath! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
endpoint

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:39 am (UTC)'!
errorMessageIn: aReply for: jsonString

	| errorObject |

	errorObject := aReply at: 'error'.
	^errorObject isString
		ifTrue: [ errorObject ]
		ifFalse: [ errorObject at: 'message' ifAbsent: [ jsonString ] ]! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
extractTextFrom: jsonString

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
homeKeyPath

	^'$HOME/.smalltalk-mentor/', self keyImageBasename! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:17:35 am (UTC)'!
imageKeyPath

	^Smalltalk imagePath, '/', self keyImageBasename! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
keyImageBasename

	^self subclassResponsibility! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
keyLookupShellCommand

	^'cat "', self imageKeyPath, '" 2>/dev/null || cat "', self homeKeyPath, '" 2>/dev/null'! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:35 am (UTC)'!
replyFrom: jsonString

	| reply |

	reply := Json readFrom: jsonString readStream.
	(reply includesKey: 'error') ifTrue: [
		self error: 'API error: ', (self errorMessageIn: reply for: jsonString) ].
	^reply! !

!LLMProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
supportsEffort

	^true! !

!LLMProvider class methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
effortLevels

	^#('low' 'medium' 'high' 'xhigh' 'max')! !

!AnthropicProvider methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initialize

	name := 'Claude'.
	model := 'claude-opus-4-8'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
addEffortTo: aJsonObject

	aJsonObject at: 'output_config' put: (JsonObject new at: 'effort' put: self effort; yourself)! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
authCurlArgs

	^'-H "anthropic-version: 2023-06-01" -H "x-api-key: $(', self keyLookupShellCommand, ' || printf %s "$ANTHROPIC_API_KEY")"'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
bodyForMessages: neutralMessages

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

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:48 am (UTC)'!
extractTextFrom: jsonString

	| content |

	content := (self replyFrom: jsonString)
		at: 'content'
		ifAbsent: [ ^self error: 'No content in reply: ', jsonString ].
	^content inject: '' into: [ :text :eachBlock | text, (self textOf: eachBlock) ]! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	^'anthropic.key'! !

!AnthropicProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:51 am (UTC)'!
textOf: aContentBlock

	^(aContentBlock at: 'type' ifAbsent: [ '' ]) = 'text'
		ifTrue: [ aContentBlock at: 'text' ifAbsent: [ '' ] ]
		ifFalse: [ '' ]! !

!GeminiProvider methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initialize

	name := 'Gemini'.
	model := 'gemini-2.0-flash'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
addEffortTo: aJsonObject

	^self! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
authCurlArgs

	^'-H "x-goog-api-key: $(', self keyLookupShellCommand, ')"'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:23 am (UTC)'!
bodyForMessages: neutralMessages

	| body |

	body := JsonObject new
		at: 'contents' put: (neutralMessages collect: [ :each | self contentFor: each ]) asArray;
		at: 'generationConfig' put: self generationConfig;
		yourself.
	self addEffortTo: body.
	^Json render: body! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:17 am (UTC)'!
contentFor: aNeutralMessage

	^JsonObject new
		at: 'role' put: (self roleFor: aNeutralMessage);
		at: 'parts' put: { JsonObject new at: 'text' put: (aNeutralMessage at: 'content'); yourself };
		yourself! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
endpoint

	^'https://generativelanguage.googleapis.com/v1beta/models/', model, ':generateContent'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:05:41 am (UTC)'!
extractTextFrom: jsonString

	| candidates |

	candidates := (self replyFrom: jsonString)
		at: 'candidates'
		ifAbsent: [ ^self error: 'No candidates in reply: ', jsonString ].
	candidates ifEmpty: [ ^self error: 'Empty candidates (possibly blocked): ', jsonString ].
	^self textOfCandidate: candidates first in: jsonString! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:05:31 am (UTC)'!
generationConfig

	^JsonObject new at: 'maxOutputTokens' put: 2000; yourself! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	^'gemini.key'! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:20 am (UTC)'!
roleFor: aNeutralMessage

	^(aNeutralMessage at: 'role') = 'assistant' ifTrue: [ 'model' ] ifFalse: [ 'user' ]! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
supportsEffort

	^false! !

!GeminiProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 6:58:35 am (UTC)'!
textOfCandidate: aCandidate in: jsonString

	| content parts |

	content := aCandidate
		at: 'content'
		ifAbsent: [ ^self error: 'No content in candidate: ', jsonString ].
	parts := content at: 'parts' ifAbsent: [ ^self error: 'No parts in content: ', jsonString ].
	^parts
		inject: ''
		into: [ :text :eachPart | text, (eachPart at: 'text' ifAbsent: [ '' ]) ]! !

!OpenAICompatibleProvider methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
endpoint

	^endpoint! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
addEffortTo: aJsonObject

	aJsonObject at: 'reasoning_effort' put: self effort! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
authCurlArgs

	^'-H "authorization: Bearer $(', self keyLookupShellCommand, ')"'! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
bodyForMessages: neutralMessages

	| body |

	body := JsonObject new
		at: 'model' put: model;
		at: 'messages' put: neutralMessages asArray;
		at: 'max_tokens' put: 2000;
		yourself.
	self addEffortTo: body.
	^Json render: body! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:05:45 am (UTC)'!
extractTextFrom: jsonString

	| choices message |

	choices := (self replyFrom: jsonString)
		at: 'choices'
		ifAbsent: [ ^self error: 'No choices in reply: ', jsonString ].
	choices ifEmpty: [ ^self error: 'Empty choices in reply: ', jsonString ].
	message := choices first
		at: 'message'
		ifAbsent: [ ^self error: 'No message in choice: ', jsonString ].
	^message at: 'content' ifAbsent: [ '' ]! !

!OpenAICompatibleProvider methodsFor: 'private' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
keyImageBasename

	^imageKeyBasename! !

!OpenAICompatibleProvider methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeName: aName endpoint: anEndpoint model: aModel imageKeyBasename: anImageBasename

	name := aName.
	endpoint := anEndpoint.
	model := aModel.
	imageKeyBasename := anImageBasename! !

!OpenAICompatibleProvider class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:44:50 am (UTC)'!
name: aName endpoint: anEndpoint model: aModel imageKeyBasename: anImageBasename

	^self new
		initializeName: aName
		endpoint: anEndpoint
		model: aModel
		imageKeyBasename: anImageBasename! !

!SmalltalkDesignHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:24:41 pm (UTC)'!
description

	^self subclassResponsibility! !

!SmalltalkDesignHeuristic methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:24:33 am (UTC)'!
labelFor: findings

	^self name, ' (', findings size printString, ')'! !

!SmalltalkDesignHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:44:26 pm (UTC)'!
listingLine

	^self name, ': ', self description! !

!SmalltalkDesignHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:24:36 pm (UTC)'!
name

	^self subclassResponsibility! !

!SmalltalkDesignHeuristic methodsFor: 'verifying' stamp: 'HAW 8/Sep/2026, 2:24:47 pm (UTC)'!
findingsFor: aClass

	^self subclassResponsibility! !

!SmalltalkDesignHeuristic methodsFor: 'descriptions' stamp: 'HAW 9/Sep/2026, 2:26:44 am (UTC)'!
neverReadNorWrittenDescription

	^'is never read nor written'! !

!SmalltalkDesignHeuristic methodsFor: 'descriptions' stamp: 'HAW 9/Sep/2026, 2:26:46 am (UTC)'!
readButNeverWrittenDescription

	^'is read but never written'! !

!SmalltalkDesignHeuristic methodsFor: 'descriptions' stamp: 'HAW 9/Sep/2026, 2:26:48 am (UTC)'!
writtenButNeverReadDescription

	^'is written but never read'! !

!ClassIsReferencedHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:32:07 pm (UTC)'!
description

	^'A class should be referenced by another class or have subclasses. One that is neither may be dead code.'! !

!ClassIsReferencedHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:32:01 pm (UTC)'!
name

	^'Class is referenced'! !

!ClassIsReferencedHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:28:54 am (UTC)'!
findingsFor: aClass

	(aClass isReferencedByOthers
		or: [ aClass subclasses notEmpty
		or: [ aClass inheritsFrom: TestCase ] ]) ifTrue: [ ^#() ].
	^Array with: (self findingFor: aClass)! !

!ClassIsReferencedHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:28:56 am (UTC)'!
findingFor: aClass

	^SmalltalkMentorFinding
		title: self name, ': ', aClass name
		detail: 'The class ', aClass name, ' is not referenced by any other class and has no subclasses - it may be dead code.'
		editKind: #none
		editTarget: nil! !

!ClassVariablesReadAndWrittenHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:25:53 pm (UTC)'!
description

	^'Every class variable should be both read and written, on the instance or the class side. One that is only read, only written, or never used is likely dead state.'! !

!ClassVariablesReadAndWrittenHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:25:47 pm (UTC)'!
name

	^'Class variables read & written'! !

!ClassVariablesReadAndWrittenHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:45:58 am (UTC)'!
findingsFor: aClass

	^(aClass classVarNames asSortedCollection reject: [ :each |
		(aClass readsClassVariableNamed: each)
			and: [ aClass writesClassVariableNamed: each ] ])
		collect: [ :each | self findingFor: each in: aClass ]! !

!ClassVariablesReadAndWrittenHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:00 am (UTC)'!
findingFor: aClassVariableName in: aClass

	| problem |

	problem := self problemWith: aClassVariableName in: aClass.
	^SmalltalkMentorFinding
		title: self name, ': ', aClassVariableName, ' ', problem
		detail: 'The class variable ', aClassVariableName, ' ', problem, '.'
		editKind: #variable
		editTarget: aClass -> aClassVariableName! !

!ClassVariablesReadAndWrittenHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:27:11 am (UTC)'!
problemWith: aClassVariableName in: aClass

	(aClass readsClassVariableNamed: aClassVariableName) ifFalse: [
		^(aClass writesClassVariableNamed: aClassVariableName)
			ifTrue: [ self writtenButNeverReadDescription ]
			ifFalse: [ self neverReadNorWrittenDescription ] ].
	^self readButNeverWrittenDescription! !

!InstanceCreationFunnelHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:30:43 pm (UTC)'!
description

	^'All instance creation messages should funnel through a single class-side message that runs the preconditions and sends the one initialize; only that message should send new to self.'! !

!InstanceCreationFunnelHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:30:38 pm (UTC)'!
name

	^'Instance creation funnelled through one message'! !

!InstanceCreationFunnelHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 6:59:21 am (UTC)'!
findingsFor: aClass

	| instantiatingSelectors |

	instantiatingSelectors := aClass class selectorsSendingNewToSelf.
	instantiatingSelectors size <= 1 ifTrue: [ ^#() ].
	^instantiatingSelectors
		collect: [ :each | self findingFor: each in: aClass class ]! !

!InstanceCreationFunnelHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:46 am (UTC)'!
findingFor: aSelector in: aMetaclass

	| location |

	location := (aMetaclass -> aSelector) methodLocationString.
	^SmalltalkMentorFinding
		title: self name, ': ', location
		detail: 'The class-side method ', location, ' sends self new directly; the instance creation messages should funnel through a single one that runs the preconditions and sends the only initialize.'
		editKind: #method
		editTarget: aMetaclass -> aSelector! !

!InstanceVariablesReadAndWrittenHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:25:16 pm (UTC)'!
description

	^'Every instance variable should be both read and written, in this class or a subclass, since an instance variable is in scope in the subclasses. One that is only read, only written, or never used is likely dead state.'! !

!InstanceVariablesReadAndWrittenHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:25:10 pm (UTC)'!
name

	^'Instance variables read & written'! !

!InstanceVariablesReadAndWrittenHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:45:53 am (UTC)'!
findingsFor: aClass

	^(aClass instVarNames reject: [ :each |
		(aClass readsInstanceVariableNamed: each)
			and: [ aClass writesInstanceVariableNamed: each ] ])
		collect: [ :each | self findingFor: each in: aClass ]! !

!InstanceVariablesReadAndWrittenHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:45:56 am (UTC)'!
findingFor: anInstanceVariableName in: aClass

	| problem |

	problem := self problemWith: anInstanceVariableName in: aClass.
	^SmalltalkMentorFinding
		title: self name, ': ', anInstanceVariableName, ' ', problem
		detail: 'The instance variable ', anInstanceVariableName, ' ', problem, '.'
		editKind: #variable
		editTarget: aClass -> anInstanceVariableName! !

!InstanceVariablesReadAndWrittenHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:26:58 am (UTC)'!
problemWith: anInstanceVariableName in: aClass

	(aClass readsInstanceVariableNamed: anInstanceVariableName) ifFalse: [
		^(aClass writesInstanceVariableNamed: anInstanceVariableName)
			ifTrue: [ self writtenButNeverReadDescription ]
			ifFalse: [ self neverReadNorWrittenDescription ] ].
	^self readButNeverWrittenDescription! !

!MessagesHaveImplementersHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:26:47 pm (UTC)'!
description

	^'Every message a method sends should have an implementer in the image. A send with no implementer is likely a typo or a missing method.'! !

!MessagesHaveImplementersHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:26:41 pm (UTC)'!
name

	^'Messages have implementers'! !

!MessagesHaveImplementersHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:46:07 am (UTC)'!
findingsFor: aClass

	| findings seenMessages |

	findings := OrderedCollection new.
	seenMessages := Set new.
	aClass compiledMethodsOnBothSides do: [ :each |
		self
			addUnimplementedMessagesSentIn: each
			skipping: seenMessages
			to: findings ].
	^findings! !

!MessagesHaveImplementersHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:09:33 am (UTC)'!
addUnimplementedMessagesSentIn: aCompiledMethod skipping: seenMessages to: findings

	| newMessages |

	newMessages := aCompiledMethod messages
		reject: [ :each | seenMessages includes: each ].
	newMessages do: [ :eachMessage |
		seenMessages add: eachMessage.
		(Smalltalk allImplementorsOf: eachMessage) ifEmpty: [
			findings add: (self findingFor: eachMessage sentIn: aCompiledMethod) ] ]! !

!MessagesHaveImplementersHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:31:39 am (UTC)'!
findingFor: aMessage sentIn: aCompiledMethod

	^SmalltalkMentorFinding
		title: self name, ': #', aMessage
		detail: 'The message #', aMessage, ' is sent (e.g. in ', aCompiledMethod locationString, ') but no class implements it - likely a typo or a missing method.'
		editKind: #method
		editTarget: aCompiledMethod classSelectorAssociation! !

!MethodsAreCategorizedHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:27:08 pm (UTC)'!
description

	^'Every method should live in a meaningful protocol, not in ''as yet unclassified''.'! !

!MethodsAreCategorizedHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:27:01 pm (UTC)'!
name

	^'Methods are categorized'! !

!MethodsAreCategorizedHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:27:36 am (UTC)'!
findingsFor: aClass

	^(aClass compiledMethodsOnBothSides select: [ :each | each isUncategorized ])
		collect: [ :each | self findingFor: each ]! !

!MethodsAreCategorizedHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:31:41 am (UTC)'!
findingFor: aCompiledMethod

	^SmalltalkMentorFinding
		title: self name, ': ', aCompiledMethod locationString
		detail: 'The method ', aCompiledMethod locationString, ' is not categorized. Move it into a meaningful protocol.'
		editKind: #method
		editTarget: aCompiledMethod classSelectorAssociation! !

!MethodsHaveSendersHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:26:26 pm (UTC)'!
description

	^'Every method should have a sender. A method with no senders in the image that does not override an inherited one may be dead code. Test methods are excluded.'! !

!MethodsHaveSendersHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:26:20 pm (UTC)'!
name

	^'Methods have senders'! !

!MethodsHaveSendersHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:46:03 am (UTC)'!
findingsFor: aClass

	^(aClass compiledMethodsOnBothSides reject: [ :each |
		each hasSenders
			or: [ each overridesInheritedMethod or: [ each isTestMethod ] ] ])
		collect: [ :each | self findingFor: each ]! !

!MethodsHaveSendersHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:31:36 am (UTC)'!
findingFor: aCompiledMethod

	^SmalltalkMentorFinding
		title: self name, ': ', aCompiledMethod locationString
		detail: 'The method ', aCompiledMethod locationString, ' has no senders in the image and does not override an inherited method - it may be dead code.'
		editKind: #method
		editTarget: aCompiledMethod classSelectorAssociation! !

!NoEmptyMethodCategoriesHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:28:14 pm (UTC)'!
description

	^'A method category that has no methods should be removed.'! !

!NoEmptyMethodCategoriesHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:28:09 pm (UTC)'!
name

	^'No empty method categories'! !

!NoEmptyMethodCategoriesHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 3:09:26 am (UTC)'!
findingsFor: aClass

	^{ aClass. aClass class }
		inject: OrderedCollection new
		into: [ :findings :eachSide |
			findings addAll: (self findingsIn: eachSide); yourself ]! !

!NoEmptyMethodCategoriesHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:29 am (UTC)'!
findingFor: aCategoryName in: aClassOrMetaclass

	^SmalltalkMentorFinding
		title: self name, ': ', aClassOrMetaclass name, ' - ', aCategoryName
		detail: 'The method category ', aCategoryName, ' has no methods. Remove it.'
		editKind: #none
		editTarget: nil! !

!NoEmptyMethodCategoriesHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:27 am (UTC)'!
findingsIn: aClassOrMetaclass

	^aClassOrMetaclass emptyMethodCategories
		collect: [ :each | self findingFor: each in: aClassOrMetaclass ]! !

!NoUnusedTemporariesHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:27:39 pm (UTC)'!
description

	^'A method should not declare a temporary variable that is never read, whether it is unreferenced or only assigned.'! !

!NoUnusedTemporariesHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:27:33 pm (UTC)'!
name

	^'No unused or write-only temporaries'! !

!NoUnusedTemporariesHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:46:12 am (UTC)'!
findingsFor: aClass

	^aClass compiledMethodsOnBothSides
		inject: OrderedCollection new
		into: [ :findings :each | findings addAll: (self findingsIn: each); yourself ]! !

!NoUnusedTemporariesHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:29 am (UTC)'!
descriptionOf: aTemporaryNode

	^aTemporaryNode name, ' ', (aTemporaryNode isAssignedTemporary
		ifTrue: [ 'is assigned but never read' ]
		ifFalse: [ 'is declared but never used' ])! !

!NoUnusedTemporariesHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:32 am (UTC)'!
findingFor: aTemporaryNode in: aCompiledMethod

	| description |

	description := self descriptionOf: aTemporaryNode.
	^SmalltalkMentorFinding
		title: self name, ': ', description, ' in ', aCompiledMethod locationString
		detail: 'The temporary variable ', description, '.'
		editKind: #method
		editTarget: aCompiledMethod classSelectorAssociation! !

!NoUnusedTemporariesHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:14 am (UTC)'!
findingsIn: aCompiledMethod

	^[ aCompiledMethod unusedTemporaryNodes
		collect: [ :each | self findingFor: each in: aCompiledMethod ] ]
			on: Error do: [ :error | #() ]! !

!OneInitializeMessageHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:31:19 pm (UTC)'!
description

	^'A class should define a single initialize message, and it should do assignments and nothing else, an optional super initialize aside.'! !

!OneInitializeMessageHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:31:14 pm (UTC)'!
name

	^'One initialize message doing only assignments'! !

!OneInitializeMessageHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:28:30 am (UTC)'!
findingsFor: aClass

	| initializeSelectors |

	initializeSelectors := aClass selectors asSortedCollection
		select: [ :each | each beginsWith: 'initialize' ].
	^(self multipleFindingsFor: aClass among: initializeSelectors),
		(self notOnlyAssignmentsFindingsFor: aClass among: initializeSelectors)! !

!OneInitializeMessageHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:51 am (UTC)'!
findingForMultiple: aSelector in: aClass

	| location |

	location := (aClass -> aSelector) methodLocationString.
	^SmalltalkMentorFinding
		title: self name, ': multiple initialize messages, ', location
		detail: 'The class defines more than one initialize message; the instance creation messages should funnel through one.'
		editKind: #method
		editTarget: aClass -> aSelector! !

!OneInitializeMessageHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:53 am (UTC)'!
findingForNotOnlyAssignments: aSelector in: aClass

	| location |

	location := (aClass -> aSelector) methodLocationString.
	^SmalltalkMentorFinding
		title: self name, ': ', location, ' does more than assignments'
		detail: 'The method ', location, ' does more than assignments; an initialize message only assigns instance variables, aside from an optional super initialize.'
		editKind: #method
		editTarget: aClass -> aSelector! !

!OneInitializeMessageHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:48 am (UTC)'!
multipleFindingsFor: aClass among: initializeSelectors

	initializeSelectors size <= 1 ifTrue: [ ^#() ].
	^initializeSelectors
		collect: [ :each | self findingForMultiple: each in: aClass ]! !

!OneInitializeMessageHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:28:34 am (UTC)'!
notOnlyAssignmentsFindingsFor: aClass among: initializeSelectors

	^(initializeSelectors reject: [ :each | (aClass >> each) doesOnlyAssignments ])
		collect: [ :each | self findingForNotOnlyAssignments: each in: aClass ]! !

!RepeatedClassWordHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:28:45 pm (UTC)'!
description

	^'An instance variable or message name should not repeat a word of the class name, since it is already read in the context of its class. A class-side selector may keep the prefix only when the unprefixed name would shadow reserved Class, Metaclass or Object protocol.'! !

!RepeatedClassWordHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:28:38 pm (UTC)'!
name

	^'No class-name prefix in names'! !

!RepeatedClassWordHeuristic methodsFor: 'verifying' stamp: 'HAW 8/Sep/2026, 11:56:54 pm (UTC)'!
findingsFor: aClass

	| classNameWords |

	classNameWords := aClass name camelCaseWords.
	^(self variableFindingsFor: aClass words: classNameWords),
		(self selectorFindingsFor: aClass words: classNameWords),
		(self selectorFindingsFor: aClass class words: classNameWords)! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:52 am (UTC)'!
hasReservedClassSideNameAfterFirstWord: aName

	| remainingWords |

	remainingWords := aName camelCaseWords allButFirst collect: [ :each | each asLowercase ].
	^self reservedClassSideNames includes: remainingWords asArray! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:46 am (UTC)'!
isSelector: aSelector exemptFromClassWordIn: aClassOrMetaclass

	^(aClassOrMetaclass >> aSelector) isTestMethod
		or: [ (aClassOrMetaclass superclass canUnderstand: aSelector)
		or: [ aClassOrMetaclass isMeta and: [ self keepsPrefixOnClassSide: aSelector ] ] ]! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:49 am (UTC)'!
keepsPrefixOnClassSide: aSelector

	^self hasReservedClassSideNameAfterFirstWord: aSelector firstKeywordWithoutColon! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:58 am (UTC)'!
name: aName startsWithAnyWordOf: classNameWords

	| firstWord |

	aName ifEmpty: [ ^false ].
	firstWord := aName camelCaseWords first.
	^classNameWords anySatisfy: [ :each | each sameAs: firstWord ]! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:55 am (UTC)'!
reservedClassSideNames

	^#( #('name') #('definition') #('category') #('comment') #('class' 'name') )! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:44 am (UTC)'!
selector: aSelector repeatsAClassWordIn: aClassOrMetaclass words: classNameWords

	^(self name: aSelector firstKeywordWithoutColon startsWithAnyWordOf: classNameWords)
		and: [ (self isSelector: aSelector exemptFromClassWordIn: aClassOrMetaclass) not ]! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:59:49 pm (UTC)'!
selectorFindingFor: aSelector in: aClassOrMetaclass

	| location |

	location := aClassOrMetaclass name, '>>', aSelector asString.
	^SmalltalkMentorFinding
		title: (self titleFor: location)
		detail: 'The selector ', location, ' repeats a word of the class name. A message name is read in the context of its receiver''s class, so drop the class-name prefix.'
		editKind: #method
		editTarget: aClassOrMetaclass -> aSelector! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:38:41 am (UTC)'!
selectorFindingsFor: aClassOrMetaclass words: classNameWords

	| selectors repeatedSelectors |

	selectors := aClassOrMetaclass selectors asSortedCollection.
	repeatedSelectors := selectors select: [ :each |
		self selector: each repeatsAClassWordIn: aClassOrMetaclass words: classNameWords ].
	^repeatedSelectors collect: [ :each |
		self selectorFindingFor: each in: aClassOrMetaclass ]! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:59:48 pm (UTC)'!
titleFor: aLocation

	^self name, ': ', aLocation! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 12:01:10 am (UTC)'!
variableFindingFor: anInstanceVariableName in: aClass

	^SmalltalkMentorFinding
		title: (self titleFor: aClass name, ' - ', anInstanceVariableName)
		detail: 'The instance variable ', anInstanceVariableName, ' repeats a word of the class name; a name is read in the context of its class, so drop the prefix.'
		editKind: #variable
		editTarget: aClass -> anInstanceVariableName! !

!RepeatedClassWordHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:39:01 am (UTC)'!
variableFindingsFor: aClass words: classNameWords

	| repeatedNames |

	repeatedNames := aClass instVarNames select: [ :each |
		self name: each startsWithAnyWordOf: classNameWords ].
	^repeatedNames collect: [ :each | self variableFindingFor: each in: aClass ]! !

!SelfOverExplicitClassReferenceHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:29:47 pm (UTC)'!
description

	^'Inside a class''s own methods, do not name the class. Use self class in instance methods and self in class-side methods, so subclasses resolve to the right class. Name the class only when you mean that exact class regardless of subclass.'! !

!SelfOverExplicitClassReferenceHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:29:40 pm (UTC)'!
name

	^'Prefer self / self class over explicit class reference'! !

!SelfOverExplicitClassReferenceHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:46:34 am (UTC)'!
findingsFor: aClass

	| ownReferences |

	ownReferences := (Smalltalk allCallsOn: aClass binding)
		select: [ :each | each actualClass theNonMetaClass = aClass ].
	^ownReferences collect: [ :each | self findingFor: each in: aClass ]! !

!SelfOverExplicitClassReferenceHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:39:56 am (UTC)'!
findingFor: aMethodReference in: aClass

	| replacement location |

	replacement := self replacementFor: aMethodReference in: aClass.
	location := aMethodReference locationString.
	^SmalltalkMentorFinding
		title: (self titleFor: location replacement: replacement)
		detail: 'Check whether ', location, ' can refer to its class as ', replacement, '.'
		editKind: #method
		editTarget: aMethodReference classSelectorAssociation! !

!SelfOverExplicitClassReferenceHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:40:00 am (UTC)'!
replacementFor: aMethodReference in: aClass

	^aMethodReference actualClass = aClass class ifTrue: [ 'self' ] ifFalse: [ 'self class' ]! !

!SelfOverExplicitClassReferenceHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:39 am (UTC)'!
titleFor: aLocation replacement: aReplacement

	^self name, ': ', aLocation, ' (may be ', aReplacement, ')'! !

!SharedLeafSubclassProtocolHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:32:32 pm (UTC)'!
description

	^'When every leaf subclass of a class answers the same message, that message should be declared in the root, concretely or as subclassResponsibility, so the shared protocol lives in one place.'! !

!SharedLeafSubclassProtocolHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:32:26 pm (UTC)'!
name

	^'Shared leaf-subclass protocol in root'! !

!SharedLeafSubclassProtocolHeuristic methodsFor: 'verifying' stamp: 'HAW 9/Sep/2026, 2:29:00 am (UTC)'!
findingsFor: rootClass

	(rootClass leafSubclasses size between: 2 and: 300) ifFalse: [ ^#() ].
	^(rootClass selectorsSharedByAllLeafSubclasses asSortedCollection
		reject: [ :each | rootClass includesSelector: each ])
		collect: [ :each | self findingFor: each root: rootClass ]! !

!SharedLeafSubclassProtocolHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:56 am (UTC)'!
findingFor: aSelector root: rootClass

	^SmalltalkMentorFinding
		title: (self titleFor: aSelector root: rootClass)
		detail: 'Declare #', aSelector, ' in ', rootClass name, ', concretely or as subclassResponsibility, since every leaf subclass answers it.'
		editKind: #method
		editTarget: (rootClass subclassImplementing: aSelector) -> aSelector! !

!SharedLeafSubclassProtocolHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:46:58 am (UTC)'!
titleFor: aSelector root: rootClass

	^self name, ': #', aSelector, ' (every leaf subclass of ', rootClass name, ' answers it)'! !

!SmalltalkMentor methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:14:20 am (UTC)'!
initialize

	provider := self class providers first.
	language := 'Spanish'! !

!SmalltalkMentor methodsFor: 'copying' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
postCopy

	super postCopy.
	provider := provider copy! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
language

	^language! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
model

	^self provider model! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
model: aString

	self provider model: aString! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
provider

	^provider! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
provider: aProvider

	provider := aProvider! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:14:23 am (UTC)'!
providers

	^self class providers! !

!SmalltalkMentor methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 3:07:01 am (UTC)'!
switchLanguage

	language := language = 'Spanish' ifTrue: [ 'English' ] ifFalse: [ 'Spanish' ]! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 7:06:03 am (UTC)'!
announceReviewOf: aDescription

	UISupervisor showTransientToastLabeled:
		'Smalltalk Mentor is reviewing ', aDescription, ' with ', self provider name! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 11:40:08 am (UTC)'!
codeProviderOf: aMorph

	((aMorph respondsTo: #codeProvider) and: [ aMorph codeProvider notNil ]) ifTrue: [
		^aMorph codeProvider ].
	(aMorph respondsTo: #model) ifTrue: [ ^aMorph model ].
	^nil! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 3:07:07 am (UTC)'!
reviewClass: aClass selector: aSelector

	(aClass isNil or: [ aSelector isNil ]) ifTrue: [
		^PopUpMenu inform: self class selectMethodFirstMessage ].
	(aClass includesSelector: aSelector) ifFalse: [
		^PopUpMenu inform: (self class notInstalledMessageFor: aSelector) ].
	self announceReviewOf: aClass name, '>>', aSelector printString.
	SmalltalkMentorMethodReview
		openOn: aClass
		selector: aSelector
		mentor: self copy! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 3:07:09 am (UTC)'!
reviewClassCategoryFromMorph: aMorph

	| systemCategory |

	systemCategory := [ aMorph model selectedSystemCategory ]
		on: Error
		do: [ :error | nil ].
	systemCategory ifNil: [
		^PopUpMenu inform: self class selectClassCategoryFirstMessage ].
	self announceReviewOf: 'class category ', systemCategory asString.
	SmalltalkMentorClassCategoryReview openOn: systemCategory mentor: self copy! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 2:14:45 am (UTC)'!
reviewClassFromMorph: aMorph

	| aClass |

	aClass := [ aMorph model selectedClass ] on: Error do: [ :error | nil ].
	aClass ifNil: [ ^PopUpMenu inform: self class selectClassFirstMessage ].
	self announceReviewOf: 'class ', aClass name.
	SmalltalkMentorClassReview openOn: aClass mentor: self copy! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 11:40:10 am (UTC)'!
reviewFromMorph: aMorph

	| codeProvider |

	codeProvider := self codeProviderOf: aMorph.
	(codeProvider respondsTo: #selectedClassOrMetaClass) ifFalse: [
		^PopUpMenu inform: self class openInBrowserFirstMessage ].
	self
		reviewClass: codeProvider selectedClassOrMetaClass
		selector: codeProvider selectedMessageName! !

!SmalltalkMentor methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 3:07:11 am (UTC)'!
reviewMethodCategoryFromMorph: aMorph

	| browser classOrMetaclass category |

	browser := aMorph model.
	classOrMetaclass := [ browser selectedClassOrMetaClass ]
		on: Error
		do: [ :error | nil ].
	category := [ browser selectedMessageCategoryName ]
		on: Error
		do: [ :error | nil ].
	(classOrMetaclass isNil or: [ category isNil ]) ifTrue: [
		^PopUpMenu inform: self class selectMethodCategoryFirstMessage ].
	self announceReviewOf: 'method category ', category asString, ' of ', classOrMetaclass name.
	SmalltalkMentorMethodCategoryReview
		openOn: category
		of: classOrMetaclass
		mentor: self copy! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 11:41:07 am (UTC)'!
assistantMessage: aContent

	^self messageWithRole: 'assistant' content: aContent! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 11:41:10 am (UTC)'!
messageWithRole: aRole content: aContent

	^JsonObject new
		at: 'role' put: aRole;
		at: 'content' put: aContent;
		yourself! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 3:06:52 am (UTC)'!
parseProposalFrom: aString

	^Json readFrom: (self jsonObjectTextIn: aString) readStream! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 2:15:34 am (UTC)'!
promptFor: source isTestMethod: isTestMethod

	^self promptIntroduction,
		(self reviewHeuristicsForTestMethod: isTestMethod),
		self promptReplyContract,
		source! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 2:15:36 am (UTC)'!
promptIntroduction

	^'You are a Smalltalk expert reviewing a single method from a Cuis Smalltalk image.

Write the "rationale" field, and all of your conversational replies, in ', self language, '. Do NOT translate Smalltalk code, selectors, or identifiers - "suggestedSource" must remain valid Smalltalk.

Enforce these project-specific review heuristics. They are grouped under "## Category" headings, and each heuristic begins with a short name in brackets like [assert-equals]. Treat them as mandatory: if the method violates any heuristic, set canImprove to true, make suggestedSource comply, and in the rationale cite the [name] of each violated heuristic. Also apply your general Smalltalk expertise for any other improvements.
<heuristics>
'! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 2:15:38 am (UTC)'!
promptReplyContract

	^'
</heuristics>

Reply with ONLY a JSON object (no prose, no markdown fences) of the form:
{"canImprove": true or false, "suggestedSource": "<a complete, compilable method with the SAME selector, or an empty string if it is already good>", "rationale": "<one or two sentences>"}
Here is the method:

'! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 11:41:02 am (UTC)'!
rationaleOf: aProposal

	^aProposal at: 'rationale' ifAbsent: [ '' ]! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 11:41:00 am (UTC)'!
suggestedSourceOf: aProposal

	^aProposal at: 'suggestedSource' ifAbsent: [ '' ]! !

!SmalltalkMentor methodsFor: 'llm - prompt' stamp: 'HAW 9/Sep/2026, 11:41:05 am (UTC)'!
userMessage: aContent

	^self messageWithRole: 'user' content: aContent! !

!SmalltalkMentor methodsFor: 'llm - messages' stamp: 'HAW 9/Sep/2026, 2:01:42 am (UTC)'!
completionForMessages: aCollectionOfMessages

	^self provider completionForMessages: aCollectionOfMessages! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 3:06:23 am (UTC)'!
askModelFor: aProvider

	(self request: 'Model id for ', aProvider name initialAnswer: aProvider model)
		ifNotNil: [ :answer |
			answer withBlanksTrimmed ifNotEmpty: [ :model | aProvider model: model ] ]! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 3:06:59 am (UTC)'!
chooseEffort

	^PopUpMenu
		withCaption: 'Choose model effort'
		chooseFrom: LLMProvider effortLevels
		current: self provider effort! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 7:04:30 am (UTC)'!
chooseProvider

	self pickProvider ifNotNil: [ :chosenProvider |
		self askModelFor: chosenProvider.
		self provider: chosenProvider.
		UISupervisor showTransientToastLabeled: 'Provider: ', chosenProvider labelDescription ]! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 7:04:32 am (UTC)'!
pickEffort

	self provider supportsEffort ifFalse: [
		UISupervisor showTransientToastLabeled: self provider name, ' has no effort setting'.
		^false ].
	^self chooseEffort
		ifNil: [ false ]
		ifNotNil: [ :chosenEffort | self provider effort: chosenEffort. true ]! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:23:10 am (UTC)'!
pickProvider

	| chosenName |

	chosenName := PopUpMenu
		withCaption: 'Choose LLM provider'
		chooseFrom: self providerNames
		current: self provider name.
	chosenName ifNil: [ ^nil ].
	^self providers detect: [ :each | each name = chosenName ]! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:15:03 am (UTC)'!
providerNames

	^(self providers collect: [ :each | each name ]) asArray! !

!SmalltalkMentor methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 7:06:05 am (UTC)'!
toggleLanguage

	self switchLanguage.
	UISupervisor showTransientToastLabeled: 'Smalltalk Mentor response language: ', language! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:15:17 am (UTC)'!
categoryOfHeuristic: aHeuristicId

	^(self heuristicSections
		detect: [ :section | section value includesSubString: '[', aHeuristicId, ']' ]
		ifNone: [ '' -> '' ]) key! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:15:23 am (UTC)'!
currentReviewHeuristics

	^self heuristicsFileContents withBlanksTrimmed
		ifEmpty: [ self defaultReviewHeuristics ]
		ifNotEmpty: [ :contents | contents ]! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
defaultReviewHeuristics

	^'## Testing
- [assert-equals] Prefer `assert: expected equals: actual` over `assert: expected = actual`
  (and over other `assert:`/`deny:` boolean-equality forms) so a failing test shows both
  the expected and the actual value.

## Object design
- [valid-on-creation] Objects should be valid from the moment they are created: instance
  creation messages validate their arguments with assertions encapsulated on the class side.'! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 3:06:28 am (UTC)'!
heuristicSections

	^self heuristicSectionLines
		select: [ :each | each value includesNonBlankLine ]
		thenCollect: [ :each | each key -> each value linesJoinedWithNewLine ]! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 6:58:37 am (UTC)'!
heuristicsFileContents

	| temporaryPath |

	temporaryPath := '/tmp/smalltalk-mentor-heuristics.txt'.
	OSProcess waitForCommand:
		(self class heuristicsFileCommandWritingTo: temporaryPath).
	^[ temporaryPath asFileEntry fileContents asString ]
		on: Error
		do: [ :error | '' ]! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:15:19 am (UTC)'!
isTestOnlyCategory: aCategoryName

	^self testOnlyCategories includes: aCategoryName! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
isTestOnlyHeuristic: aHeuristicId

	^self isTestOnlyCategory: (self categoryOfHeuristic: aHeuristicId)! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
reviewHeuristicsFilePath

	^'~/.smalltalk-mentor/heuristics.md'! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
reviewHeuristicsForTestMethod: isTestMethod

	^String streamContents: [ :stream |
		self heuristicSections do: [ :section |
			((self isTestOnlyCategory: section key) and: [ isTestMethod not ])
				ifFalse: [ stream nextPutAll: section value ] ] ]! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:15:21 am (UTC)'!
testOnlyCategories

	^#('Testing')! !

!SmalltalkMentor methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 2:15:30 am (UTC)'!
writeDefaultReviewHeuristicsFile

	| seedPath |

	seedPath := '/tmp/smalltalk-mentor-heuristics-seed.txt'.
	seedPath asFileEntry fileContents: self defaultReviewHeuristics.
	OSProcess waitForCommand:
		'sh -c ''mkdir -p "$HOME/.smalltalk-mentor"; F="$HOME/.smalltalk-mentor/heuristics.md"; [ -f "$F" ] || cp ', seedPath, ' "$F"'''.
	Transcript show: 'Seeded ', self reviewHeuristicsFilePath, ' (if it did not already exist)'; newLine! !

!SmalltalkMentor methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:06:30 am (UTC)'!
heuristicSectionLines

	| sections |

	sections := OrderedCollection with: '' -> OrderedCollection new.
	self currentReviewHeuristics lines do: [ :eachLine |
		eachLine isMarkdownSectionHeader ifTrue: [
			sections add: eachLine markdownSectionTitle -> OrderedCollection new ].
		sections last value add: eachLine ].
	^sections! !

!SmalltalkMentor methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:06:55 am (UTC)'!
jsonObjectTextIn: aString

	| start stop |

	start := aString indexOf: ${.
	stop := aString lastIndexOf: $}.
	(start = 0 or: [ stop < start ]) ifTrue: [
		^self error: 'No JSON object found in the reply: ', aString ].
	^aString copyFrom: start to: stop! !

!SmalltalkMentor class methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
initialize

	self initializeMenues! !

!SmalltalkMentor class methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
unload

	self unloadMenues! !

!SmalltalkMentor class methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
current

	^Current ifNil: [ Current := self new ]! !

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
buildProviders

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

!SmalltalkMentor class methodsFor: 'providers' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
providers

	^Providers ifNil: [ Providers := self buildProviders ]! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:23:03 am (UTC)'!
browserWindowMenuSpecs

	^{
		{ #classListMenuSpec. self classReviewMenuSpecSend }.
		{ #messageListMenuSpec. self messageListMenuSpecSend }.
		{ #messageCatListMenuSpec. self methodCategoryReviewMenuSpecSend }.
		{ #systemCatListMenuSpec. self classCategoryReviewMenuSpecSend }.
		{ #SmalltalkEditor. self smalltalkEditorMenuSpecSend }}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
classCategoryReviewMenuSpec

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

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
classReviewMenuSpec

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

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:23:03 am (UTC)'!
debuggerWindowMenuSpecs

	^{ { #SmalltalkEditor. self smalltalkEditorMenuSpecSend } }.! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeMenues

	BrowserWindow registerAll: self browserWindowMenuSpecs.
	MethodSetWindow registerAll: self methodSetWindowMenuSpecs.
	DebuggerWindow registerAll: self debuggerWindowMenuSpecs.! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:23:00 am (UTC)'!
messageListMenuSpec

	^self smalltalkEditorMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 10:51:19 am (UTC)'!
messageListMenuSpecSend

	^ MessageSend receiver: self selector: #messageListMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
methodCategoryReviewMenuSpec

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

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:23:03 am (UTC)'!
methodSetWindowMenuSpecs

	^ { { #messageListMenuSpec. self messageListMenuSpecSend }.
		{ #SmalltalkEditor. self smalltalkEditorMenuSpecSend }}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:23:00 am (UTC)'!
smalltalkEditorMenuSpec

	^{
		{ 12000. 'Smalltalk Mentor'. nil. nil. 12000. #helpIcon }.
		{ 12010. 'Ask for a better version (0)'. $0. self current. #reviewFromMorph:. #findIcon }.
		{ 12020. 'Choose LLM provider and model...'. nil. self current. #chooseProvider. #chatIcon }.
		{ 12030. 'Choose model effort...'. nil. self current. #chooseEffort. #systemMonitorIcon }.
		{ 12040. 'Toggle response language (Spanish/English)'. nil. self current. #toggleLanguage. #preferencesDesktopFontIcon }
	}! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 9/Sep/2026, 2:23:03 am (UTC)'!
smalltalkEditorMenuSpecSend

	^MessageSend receiver: self selector: #smalltalkEditorMenuSpec! !

!SmalltalkMentor class methodsFor: 'menues' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
unloadMenues

	BrowserWindow unregisterAll: self browserWindowMenuSpecs.
	MethodSetWindow unregisterAll: self methodSetWindowMenuSpecs.
	DebuggerWindow unregisterAll: self debuggerWindowMenuSpecs.! !

!SmalltalkMentor class methodsFor: 'error messages' stamp: 'HAW 9/Sep/2026, 2:14:38 am (UTC)'!
notInstalledMessageFor: aSelector

	^aSelector = #DoIt
		ifTrue: [ 'Cannot analyze a #DoIt method because it is not part of the class method dictionary' ]
		ifFalse: [ 'Cannot review this method because it is not installed' ]! !

!SmalltalkMentor class methodsFor: 'error messages' stamp: 'HAW 9/Sep/2026, 2:14:36 am (UTC)'!
openInBrowserFirstMessage

	^'Open this in a browser and select a method first.'! !

!SmalltalkMentor class methodsFor: 'error messages' stamp: 'HAW 9/Sep/2026, 2:14:29 am (UTC)'!
selectClassCategoryFirstMessage

	^'Select a class category first, then press cmd+0.'! !

!SmalltalkMentor class methodsFor: 'error messages' stamp: 'HAW 9/Sep/2026, 2:14:26 am (UTC)'!
selectClassFirstMessage

	^'Select a class first, then press cmd+0.'! !

!SmalltalkMentor class methodsFor: 'error messages' stamp: 'HAW 9/Sep/2026, 2:14:31 am (UTC)'!
selectMethodCategoryFirstMessage

	^'Select a method category first, then press cmd+0.'! !

!SmalltalkMentor class methodsFor: 'error messages' stamp: 'HAW 9/Sep/2026, 2:14:34 am (UTC)'!
selectMethodFirstMessage

	^'Select a method first, then press cmd+0.'! !

!SmalltalkMentor class methodsFor: 'heuristics' stamp: 'HAW 9/Sep/2026, 3:06:48 am (UTC)'!
heuristicsFileCommandWritingTo: aPath

	^'sh -c ''I="', Smalltalk imagePath, '/smalltalk-mentor-heuristics.md"; ',
		'H="$HOME/.smalltalk-mentor/heuristics.md"; ',
		'if [ -s "$I" ]; then cat "$I"; elif [ -s "$H" ]; then cat "$H"; fi > ', aPath,
		' 2>/dev/null || : > ', aPath, ''''! !

!SmalltalkMentorClassReview methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeClass: aClass mentor: aMentor

	targetClass := aClass theNonMetaClass.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 8/Sep/2026, 11:56:40 pm (UTC)'!
heuristics

	^{
		InstanceVariablesReadAndWrittenHeuristic new.
		ClassVariablesReadAndWrittenHeuristic new.
		MethodsHaveSendersHeuristic new.
		MessagesHaveImplementersHeuristic new.
		MethodsAreCategorizedHeuristic new.
		NoUnusedTemporariesHeuristic new.
		NoEmptyMethodCategoriesHeuristic new.
		RepeatedClassWordHeuristic new.
		SelfOverExplicitClassReferenceHeuristic new.
		InstanceCreationFunnelHeuristic new.
		OneInitializeMessageHeuristic new.
		ClassIsReferencedHeuristic new.
		SharedLeafSubclassProtocolHeuristic new }! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 8/Sep/2026, 11:44:02 pm (UTC)'!
methodHeuristicClasses

	^{
		TestingForEqualityHeuristic.
		DenyOverAssertNotHeuristic.
		ExceptionBlockSingleSendHeuristic.
		ExceptionBlockWithoutAssignmentHeuristic.
		MessageKeywordsLowercaseHeuristic.
		NoSetGetHeuristic.
		NoNilPreconditionHeuristic.
		NoTypePreconditionHeuristic.
		AvoidSettersHeuristic.
		MethodComplexityHeuristic.
		MoveHelperMethodToRightClassHeuristic.
		InstanceCreationFormatHeuristic.
		KeywordMessageSendFormatHeuristic.
		AndOrTakeBlocksHeuristic.
		IfTrueIfFalseOrderHeuristic.
		AndOrOverBooleanOperatorsHeuristic.
		RedundantIfTrueConditionHeuristic.
		EqualityOverIdentityHeuristic.
		ConditionalOnEmptyTestHeuristic.
		ComparisonWithNilHeuristic.
		ConditionalOnNilTestHeuristic.
		SizeComparedWithZeroHeuristic.
		NoExtraParenthesisHeuristic }! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 8/Sep/2026, 11:44:35 pm (UTC)'!
methodHeuristicsFor: aCompiledMethod

	^self methodHeuristicClasses collect: [ :each | each for: aCompiledMethod ]! !

!SmalltalkMentorClassReview methodsFor: 'verifications' stamp: 'HAW 9/Sep/2026, 2:23:34 am (UTC)'!
rootNodesFor: aClass

	| roots |

	roots := self heuristicRootNodesFor: aClass.
	roots add: (self methodsSideNodeFor: aClass label: 'Instance methods').
	roots add: (self methodsSideNodeFor: aClass class label: 'Class methods').
	^roots! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:38 pm (UTC)'!
addClassHeuristicRootsFor: aClass to: roots

	self heuristics do: [ :each |
		self addRootFor: each findings: (each findingsFor: aClass) to: roots ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:40 pm (UTC)'!
addMethodHeuristicRootsFor: aClass to: roots

	self methodHeuristicClasses do: [ :each |
		self addRootFor: each overMethodsOf: aClass to: roots ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:24:31 am (UTC)'!
addRootFor: aHeuristic findings: findings to: roots

	findings ifEmpty: [ ^self ].
	roots add: (SmalltalkMentorNode
		label: (aHeuristic labelFor: findings)
		kind: #heuristicRoot
		payload: aHeuristic description
		children: (self findingNodesFor: findings)
		model: self)! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:47 pm (UTC)'!
addRootFor: aHeuristicClass overMethodsOf: aClass to: roots

	| methodHeuristics findings |

	methodHeuristics := aClass compiledMethodsOnBothSides
		collect: [ :each | aHeuristicClass for: each ].
	methodHeuristics ifEmpty: [ ^self ].
	findings := OrderedCollection new.
	methodHeuristics do: [ :each | findings addAll: each value ].
	self addRootFor: methodHeuristics first findings: findings to: roots! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:50 pm (UTC)'!
allHeuristicsPassedNodeFor: aClass

	^self allHeuristicsPassedNodeListing:
		self heuristics, (self methodHeuristicsListedFor: aClass)! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:52 pm (UTC)'!
allHeuristicsPassedNodeListing: heuristics

	| listing |

	listing := String streamContents: [ :stream |
		heuristics
			do: [ :each | stream nextPutAll: each listingLine ]
			separatedBy: [ stream newLine; newLine ] ].
	^SmalltalkMentorNode
		label: 'All heuristics passed'
		kind: #allPassed
		payload: listing
		children: #()
		model: self! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:23:34 am (UTC)'!
buildRootNodes

	^self rootNodesFor: targetClass! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:43:20 am (UTC)'!
categoryNodeFor: aCategoryName in: aClassOrMetaclass

	| selectors methodNodes |

	selectors := aClassOrMetaclass organization listAtCategoryNamed: aCategoryName.
	methodNodes := selectors asSortedCollection
		collect: [ :each | self methodNodeFor: each in: aClassOrMetaclass ].
	^SmalltalkMentorNode
		label: aCategoryName asString
		kind: #category
		payload: nil
		children: methodNodes
		model: self! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 3:07:25 am (UTC)'!
categoryNodesFor: aClassOrMetaclass

	^aClassOrMetaclass nonEmptyMethodCategories asSortedCollection
		collect: [ :each | self categoryNodeFor: each in: aClassOrMetaclass ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:45 pm (UTC)'!
findingNodesFor: findings

	^findings collect: [ :each |
		SmalltalkMentorNode
			label: each title
			kind: #finding
			payload: each
			children: #()
			model: self ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:24:28 am (UTC)'!
heuristicRootNodesFor: aClass

	| roots |

	roots := OrderedCollection new.
	self addClassHeuristicRootsFor: aClass to: roots.
	self addMethodHeuristicRootsFor: aClass to: roots.
	^roots ifEmpty: [
		OrderedCollection with: (self allHeuristicsPassedNodeFor: aClass) ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:44:48 pm (UTC)'!
methodHeuristicsListedFor: aClass

	| methods |

	methods := aClass compiledMethodsOnBothSides.
	methods ifEmpty: [ ^#() ].
	^self methodHeuristicsFor: methods first! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:24:49 am (UTC)'!
methodNodeFor: aSelector in: aClassOrMetaclass

	^SmalltalkMentorNode
		label: aSelector asString
		kind: #method
		payload: aClassOrMetaclass -> aSelector
		children: #()
		model: self! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:43:14 am (UTC)'!
methodsSideNodeFor: aClassOrMetaclass label: aLabel

	^SmalltalkMentorNode
		label: aLabel, ' (', aClassOrMetaclass selectors size printString, ')'
		kind: #side
		payload: nil
		children: (self categoryNodesFor: aClassOrMetaclass)
		model: self! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
nodeSelected: aNode

	aNode kind = #method ifTrue: [ ^self showMethodReview: aNode payload ].
	aNode kind = #finding ifTrue: [ ^self showFinding: aNode payload ].
	aNode kind = #heuristicRoot ifTrue: [ ^self showText: aNode payload ].
	aNode kind = #allPassed ifTrue: [ ^self showText: aNode payload ].
	self clearDetail! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
rootNodes

	^treeRoots ifNil: [ treeRoots := self buildRootNodes ]! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
selectedIndex

	^selectedIndex! !

!SmalltalkMentorClassReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:24:26 am (UTC)'!
selectedIndex: aWrapper

	selectedIndex := aWrapper.
	self changed: #selectedIndex.
	(aWrapper isKindOf: SmalltalkMentorNode) ifTrue: [
		self nodeSelected: aWrapper ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:42:46 am (UTC)'!
analyzeInBackground: aClassSelectorAssociation

	[ [ self showReviewOf: aClassSelectorAssociation ]
		on: Error
		do: [ :error |
			UISupervisor whenUIinSafeState: [
				self hideThinking.
				self showText: 'Review failed: ', error messageText ] ] ] fork! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
clearDetail

	detailHolder removeAllMorphs! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
renderDetail: aMorph

	detailHolder removeAllMorphs.
	detailHolder addMorph: aMorph layoutSpec: LayoutSpec useAll.
	window ifNotNil: [ aMorph adoptWidgetsColor: window widgetsColor ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:24:00 am (UTC)'!
showClassDefinitionEditorFor: aClassVariableAssociation

	| browser codePane |

	browser := Browser new.
	browser setClass: aClassVariableAssociation key selector: nil.
	browser editClass.
	codePane := browser newCodePaneMorph.
	self renderDetail: codePane.
	codePane selectFirstOccurrenceOf: aClassVariableAssociation value! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:43:09 am (UTC)'!
showFinding: aFinding

	aFinding editKind = #method ifTrue: [
		^self showMethodEditorFor: aFinding editTarget ].
	aFinding editKind = #variable ifTrue: [
		^self showClassDefinitionEditorFor: aFinding editTarget ].
	self showText: aFinding detail! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:43:11 am (UTC)'!
showMethodEditorFor: aClassSelectorAssociation

	| browser |

	browser := Browser new.
	browser
		setClass: aClassSelectorAssociation key
		selector: aClassSelectorAssociation value.
	self renderDetail: browser newCodePaneMorph! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:42:44 am (UTC)'!
showMethodReview: aClassSelectorAssociation

	methodReviewCache
		at: aClassSelectorAssociation
		ifPresent: [ :cached | ^self showReviewPanel: cached ].
	self showThinkingFor: aClassSelectorAssociation.
	self analyzeInBackground: aClassSelectorAssociation! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 9/Sep/2026, 2:24:14 am (UTC)'!
showReviewOf: aClassSelectorAssociation

	| review |

	review := self buildReviewFor: aClassSelectorAssociation.
	UISupervisor whenUIinSafeState: [
		self hideThinking.
		methodReviewCache at: aClassSelectorAssociation put: review.
		self showReviewPanel: review ]! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showReviewPanel: aReview

	self renderDetail: aReview buildContent! !

!SmalltalkMentorClassReview methodsFor: 'detail' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
showText: aString

	self renderDetail: (TextModelMorph withText: aString asText)! !

!SmalltalkMentorClassReview methodsFor: 'reviewing' stamp: 'HAW 9/Sep/2026, 11:41:52 am (UTC)'!
buildReviewFor: aClassSelectorAssociation

	| reviewedClass reviewedSelector source methodMentor prompt answer |

	reviewedClass := aClassSelectorAssociation key.
	reviewedSelector := aClassSelectorAssociation value.
	source := reviewedClass sourceCodeAt: reviewedSelector.
	methodMentor := mentor copy.
	prompt := methodMentor
		promptFor: source
		isTestMethod: (reviewedClass isTestMethodAt: reviewedSelector).
	answer := methodMentor provider
		completionForMessages: { methodMentor userMessage: prompt }.
	^SmalltalkMentorReview
		on: aClassSelectorAssociation
		source: source
		prompt: prompt
		answer: answer
		mentor: methodMentor! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 9/Sep/2026, 2:24:21 am (UTC)'!
analysisOf: aLocation

	^aLocation, ' with ', mentor provider name! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
hideThinking

	thinkingToast ifNotNil: [ thinkingToast delete. thinkingToast := nil ]! !

!SmalltalkMentorClassReview methodsFor: 'thinking' stamp: 'HAW 9/Sep/2026, 6:59:52 am (UTC)'!
showThinkingFor: aClassSelectorAssociation

	| location |

	location := aClassSelectorAssociation methodLocationString.
	thinkingToast := UISupervisor
		showToastLabeled: 'Smalltalk Mentor is analyzing ', (self analysisOf: location).
	self showText: 'Analyzing ', (self analysisOf: location), ' ...'! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 9/Sep/2026, 6:58:40 am (UTC)'!
browseFinding: aFinding

	aFinding editKind = #method ifTrue: [ ^aFinding editTarget openMethodBrowser ].
	aFinding editKind = #variable ifTrue: [
		^aFinding editTarget key openClassBrowser ].
	^targetClass openClassBrowser! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 9/Sep/2026, 2:42:55 am (UTC)'!
browseNode: aNode

	aNode kind = #method ifTrue: [ ^aNode payload openMethodBrowser ].
	aNode kind = #finding ifTrue: [ ^self browseFinding: aNode payload ].
	aNode kind = #classTop ifTrue: [ ^aNode payload openClassBrowser ].
	^targetClass openClassBrowser! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 9/Sep/2026, 2:23:49 am (UTC)'!
changeEffort

	mentor pickEffort ifTrue: [
		effortButton ifNotNil: [
			effortButton label: mentor provider effortButtonLabel ] ]! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 9/Sep/2026, 2:43:01 am (UTC)'!
changeProvider

	mentor pickProvider ifNotNil: [ :chosenProvider | | windowProvider |
		windowProvider := chosenProvider copy.
		mentor askModelFor: windowProvider.
		mentor provider: windowProvider.
		self updateProviderButtons ]! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
runAgainNode: aNode

	aNode kind = #method ifTrue: [
		methodReviewCache removeKey: aNode payload ifAbsent: [ ].
		^self showMethodReview: aNode payload ].
	treeRoots := nil.
	self changed: #rootNodes! !

!SmalltalkMentorClassReview methodsFor: 'menu actions' stamp: 'HAW 9/Sep/2026, 6:58:42 am (UTC)'!
updateProviderButtons

	| provider |

	provider := mentor provider.
	providerButton ifNotNil: [ providerButton label: 'LLM: ', provider printString ].
	effortButton ifNotNil: [ effortButton label: provider effortButtonLabel ]! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:24:56 am (UTC)'!
newLeftColumn

	| leftColumn |

	treeMorph := SmalltalkMentorTreeMorph
		withModel: self
		listGetter: #rootNodes
		indexGetter: #selectedIndex
		indexSetter: #selectedIndex:.
	leftColumn := LinearLayoutMorph newColumn.
	leftColumn
		addMorph: treeMorph proportionalHeight: 1.0;
		addMorph: self newProviderRow fixedHeight: 30.
	^leftColumn! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:43:28 am (UTC)'!
newMainRow

	| row |

	detailHolder := LayoutMorph newColumn.
	row := LinearLayoutMorph newRow.
	row
		addMorph: self newLeftColumn proportionalWidth: 0.34;
		addAdjusterAndMorph: detailHolder proportionalWidth: 0.66.
	^row! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:24:58 am (UTC)'!
newProviderRow

	| providerRow |

	providerButton := PluggableButtonMorph
		model: self
		action: #changeProvider
		label: 'LLM: ', mentor provider printString.
	effortButton := PluggableButtonMorph
		model: self
		action: #changeEffort
		label: mentor provider effortButtonLabel.
	providerRow := LinearLayoutMorph newRow.
	providerRow
		addMorph: providerButton proportionalWidth: 0.6;
		addMorph: effortButton proportionalWidth: 0.4.
	^providerRow! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:43:24 am (UTC)'!
openWindow

	window := SmalltalkMentorReviewWindow new.
	window setLabel: 'Smalltalk Mentor - ', self windowLabel.
	window layoutMorph addMorph: self newMainRow proportionalHeight: 1.0.
	window openInWorld! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
start

	self openWindow! !

!SmalltalkMentorClassReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
windowLabel

	^'class ', targetClass name! !

!SmalltalkMentorClassReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:15:46 am (UTC)'!
on: aClass mentor: aMentor

	^self new initializeClass: aClass mentor: aMentor! !

!SmalltalkMentorClassReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:15:49 am (UTC)'!
openOn: aClass mentor: aMentor

	^(self on: aClass mentor: aMentor) start! !

!SmalltalkMentorClassCategoryReview methodsFor: 'initialization' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
initializeSystemCategory: aString mentor: aMentor

	systemCategory := aString.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorClassCategoryReview methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:43 am (UTC)'!
classesInCategory

	^((SystemOrganization listAtCategoryNamed: systemCategory)
		collect: [ :nameSym | Smalltalk at: nameSym ifAbsent: [ nil ] ])
		select: [ :each | each isBehavior ]! !

!SmalltalkMentorClassCategoryReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 2:43:33 am (UTC)'!
buildRootNodes

	| sortedClasses |

	sortedClasses := self classesInCategory
		asSortedCollection: [ :first :second | first name <= second name ].
	^(sortedClasses collect: [ :eachClass |
		SmalltalkMentorNode
			label: eachClass name
			kind: #classTop
			payload: eachClass
			childrenBlock: [ self rootNodesFor: eachClass ]
			model: self ]) asOrderedCollection! !

!SmalltalkMentorClassCategoryReview methodsFor: 'ui' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
windowLabel

	^'class category ', systemCategory asString! !

!SmalltalkMentorClassCategoryReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:15:56 am (UTC)'!
on: aSystemCategory mentor: aMentor

	^self new initializeSystemCategory: aSystemCategory mentor: aMentor! !

!SmalltalkMentorClassCategoryReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:15:58 am (UTC)'!
openOn: aSystemCategory mentor: aMentor

	^(self on: aSystemCategory mentor: aMentor) start! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:16:06 am (UTC)'!
initializeClassOrMeta: aClassOrMeta category: aCategory mentor: aMentor

	targetClass := aClassOrMeta.
	reviewedCategory := aCategory.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 3:08:01 am (UTC)'!
buildRootNodes

	| methodNodes |

	methodNodes := self selectorsToReview
		collect: [ :each | self methodNodeFor: each in: targetClass ].
	^methodNodes asOrderedCollection! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'tree' stamp: 'HAW 9/Sep/2026, 3:08:03 am (UTC)'!
selectorsToReview

	| selectors |

	selectors := reviewedCategory asString = ClassOrganizer allCategory asString
		ifTrue: [ targetClass selectors ]
		ifFalse: [ targetClass organization listAtCategoryNamed: reviewedCategory ].
	^selectors asSortedCollection! !

!SmalltalkMentorMethodCategoryReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:06 am (UTC)'!
windowLabel

	^'method category ', reviewedCategory asString, ' of ', targetClass name! !

!SmalltalkMentorMethodCategoryReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:43:40 am (UTC)'!
on: aCategory of: aClassOrMetaclass mentor: aMentor

	^self new
		initializeClassOrMeta: aClassOrMetaclass
		category: aCategory
		mentor: aMentor! !

!SmalltalkMentorMethodCategoryReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:16:10 am (UTC)'!
openOn: aCategory of: aClassOrMetaclass mentor: aMentor

	^(self on: aCategory of: aClassOrMetaclass mentor: aMentor) start! !

!SmalltalkMentorMethodReview methodsFor: 'initialization' stamp: 'HAW 8/Sep/2026, 11:21:54 pm (UTC)'!
initializeClass: aClassOrMetaclass selector: aSelector mentor: aMentor

	targetClass := aClassOrMetaclass.
	selector := aSelector.
	mentor := aMentor.
	methodReviewCache := Dictionary new! !

!SmalltalkMentorMethodReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:45:07 pm (UTC)'!
buildRootNodes

	| methodHeuristics roots |

	methodHeuristics := self methodHeuristicsFor: targetClass >> selector.
	roots := self rootsFor: methodHeuristics.
	roots add: self llmReviewNode.
	^roots! !

!SmalltalkMentorMethodReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:45:11 pm (UTC)'!
llmReviewNode

	^SmalltalkMentorNode
		label: 'Ask the LLM for a better version'
		kind: #method
		payload: targetClass -> selector
		children: #()
		model: self! !

!SmalltalkMentorMethodReview methodsFor: 'tree' stamp: 'HAW 8/Sep/2026, 11:50:00 pm (UTC)'!
rootsFor: methodHeuristics

	| roots |

	roots := OrderedCollection new.
	methodHeuristics do: [ :each |
		self addRootFor: each findings: each value to: roots ].
	^roots ifEmpty: [
		OrderedCollection with:
			(self allHeuristicsPassedNodeListing: methodHeuristics) ]! !

!SmalltalkMentorMethodReview methodsFor: 'ui' stamp: 'HAW 8/Sep/2026, 11:22:00 pm (UTC)'!
windowLabel

	^'method ', targetClass name, '>>', selector asString! !

!SmalltalkMentorMethodReview class methodsFor: 'instance creation' stamp: 'HAW 8/Sep/2026, 11:50:02 pm (UTC)'!
on: aClassOrMetaclass selector: aSelector mentor: aMentor

	^self new
		initializeClass: aClassOrMetaclass
		selector: aSelector
		mentor: aMentor! !

!SmalltalkMentorMethodReview class methodsFor: 'instance creation' stamp: 'HAW 8/Sep/2026, 11:45:01 pm (UTC)'!
openOn: aClassOrMetaclass selector: aSelector mentor: aMentor

	^(self on: aClassOrMetaclass selector: aSelector mentor: aMentor) start! !

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

!SmalltalkMentorFinding class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:45:45 am (UTC)'!
title: aTitle detail: aDetail editKind: anEditKind editTarget: anEditTarget

	^self new
		initializeTitle: aTitle
		detail: aDetail
		editKind: anEditKind
		editTarget: anEditTarget! !

!SmalltalkMentorReview methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:23:32 am (UTC)'!
initializeClass: aClass selector: aSelector category: aCategory current: aCurrentSource suggested: aSuggestedSource rationale: aRationale messages: aMessagesCollection mentor: aMentor

	targetClass := aClass.
	selector := aSelector.
	category := aCategory.
	currentSource := aCurrentSource withCuisLineEndings.
	suggestedSource := self formattedSource: aSuggestedSource.
	rationale := aRationale.
	messages := aMessagesCollection.
	mentor := aMentor.
	busy := false! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:46 am (UTC)'!
buildContent

	^contentMorph ifNil: [ contentMorph := self newContentColumn ]! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 6:58:54 am (UTC)'!
languageButtonLabel

	^'Idioma: ', mentor language! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 3:07:34 am (UTC)'!
newButtonsRow

	| buttonsRow |

	buttonsRow := LayoutMorph newRow.
	buttonsRow
		addMorph: self newSendButton
		layoutSpec: (LayoutSpec proportionalWidth: 0.45 proportionalHeight: 1.0).
	buttonsRow
		addMorph: self newEffortButton
		layoutSpec: (LayoutSpec proportionalWidth: 0.25 proportionalHeight: 1.0).
	buttonsRow
		addMorph: self newLanguageButton
		layoutSpec: (LayoutSpec proportionalWidth: 0.3 proportionalHeight: 1.0).
	^buttonsRow! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:48 am (UTC)'!
newContentColumn

	| column |

	column := LayoutMorph newColumn.
	column
		addMorph: self newProviderLabel
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 20).
	column
		addMorph: self newTranscriptMorph
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.28).
	column addAdjusterAndMorph: self newPanesRow proportionalHeight: 0.57.
	column addAdjusterAndMorph: self newInputGroup proportionalHeight: 0.15.
	column
		addMorph: self newButtonsRow
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 34).
	^column! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 3:07:39 am (UTC)'!
newEffortButton

	^effortButton := PluggableButtonMorph
		model: self
		action: #changeEffort
		label: mentor provider effortButtonLabel! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 6:58:44 am (UTC)'!
newInputGroup

	| inputGroup conversationLabel inputModel |

	conversationLabel := LabelMorph
		contents: 'Tell the mentor (ask a follow-up or push back, then press cmd+Enter):'.
	inputModel := SmalltalkMentorConversationTextModel
		withText: '' asText
		review: self.
	inputMorph := SmalltalkMentorConversationTextMorph withModel: inputModel.
	inputGroup := LayoutMorph newColumn.
	inputGroup
		addMorph: conversationLabel
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 18).
	inputGroup
		addMorph: inputMorph
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 1.0).
	^inputGroup! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 6:58:57 am (UTC)'!
newLanguageButton

	^languageButton := PluggableButtonMorph
		model: self
		action: #switchLanguage
		label: self languageButtonLabel! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:58 am (UTC)'!
newOriginalPane

	| originalBrowser |

	originalBrowser := Browser new.
	originalBrowser setClass: targetClass selector: selector.
	^originalBrowser newCodePaneMorph! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:55 am (UTC)'!
newPanesRow

	| panesRow |

	panesRow := LayoutMorph newRow.
	panesRow
		addMorph: self newOriginalPane
		layoutSpec: (LayoutSpec proportionalWidth: 0.5 proportionalHeight: 1.0).
	panesRow addAdjusterAndMorph: self newSuggestedPane proportionalWidth: 0.5.
	^panesRow! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:50 am (UTC)'!
newProviderLabel

	^providerLabel := LabelMorph contents: 'LLM: ', mentor provider labelDescription! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 3:07:36 am (UTC)'!
newSendButton

	^PluggableButtonMorph model: self action: #sendFollowUp label: 'Send (cmd+Enter)'! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:45:33 am (UTC)'!
newSuggestedPane

	| suggestedModel |

	suggestedModel := SmalltalkMentorNoCopyTextModel
		withText: self suggestedPaneText asText
		styleClass: targetClass.
	^suggestedMorph := TextModelMorph withModel: suggestedModel! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:16:53 am (UTC)'!
newTranscriptMorph

	^transcriptMorph := TextModelMorph
		withText: ('Smalltalk Mentor: ', rationale, String newLineString) asText! !

!SmalltalkMentorReview methodsFor: 'ui' stamp: 'HAW 9/Sep/2026, 2:45:35 am (UTC)'!
suggestedPaneText

	^suggestedSource ifEmpty: [ currentSource ] ifNotEmpty: [ :source | source ]! !

!SmalltalkMentorReview methodsFor: 'compiling' stamp: 'HAW 9/Sep/2026, 3:07:30 am (UTC)'!
accept

	| suggestedSourceText |

	suggestedSourceText := suggestedMorph text asString.
	suggestedSourceText ifEmpty: [ ^PopUpMenu inform: 'Nothing to compile.' ].
	[ targetClass compile: suggestedSourceText classified: category ]
		on: Error
		do: [ :error | ^PopUpMenu inform: 'Compile failed: ', error messageText ].
	self logCompiledSuggestion! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:44:52 am (UTC)'!
appendTranscript: aString

	| newText |

	newText := transcriptMorph text asString, aString, String newLineString.
	transcriptMorph model actualContents: newText asText.
	self scrollTranscriptTo: newText size! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 11:41:43 am (UTC)'!
askProvider

	| answer proposal |

	answer := mentor provider completionForMessages: messages.
	messages add: (mentor assistantMessage: answer).
	proposal := mentor parseProposalFrom: answer.
	UISupervisor whenUIinSafeState: [ self showProposal: proposal ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 3:07:47 am (UTC)'!
askProviderInBackground

	[ [ self askProvider ]
		on: Error
		do: [ :error |
			UISupervisor whenUIinSafeState: [ self showProviderError: error ] ] ] fork! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:44:58 am (UTC)'!
changeEffort

	mentor pickEffort ifTrue: [ self updateEffortLabels ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:45:20 am (UTC)'!
clearInput

	UISupervisor whenUIinSafeState: [
		inputMorph model actualContents: '' asText.
		inputMorph updateActualContents ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:45:18 am (UTC)'!
followUpContentFor: aNote

	^aNote, String newLineString, String newLineString,
		'For reference, the current version of the method I am looking at is:', String newLineString,
		suggestedMorph text asString, String newLineString, String newLineString,
		'Reply again with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 7:04:43 am (UTC)'!
languageChangeLabel

	^'You: (idioma -> ', mentor language, ')'! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 3:07:32 am (UTC)'!
logCompiledSuggestion

	Transcript
		show: 'Compiled Smalltalk Mentor suggestion into ', (targetClass -> selector) methodLocationString;
		newLine! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 11:41:46 am (UTC)'!
postUserContent: contentString transcriptLabel: aLabel

	busy ifTrue: [ ^self ].
	messages add: (mentor userMessage: contentString).
	self appendTranscript: aLabel.
	self appendTranscript: '(Smalltalk Mentor is thinking...)'.
	busy := true.
	self askProviderInBackground! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 11:41:38 am (UTC)'!
rationaleOrDefaultOf: aProposal

	^(mentor rationaleOf: aProposal) ifEmpty: [ '(no rationale)' ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:45:25 am (UTC)'!
restateInCurrentLanguageContent

	^'From now on, reply in ', mentor language, '. Restate your previous rationale in ', mentor language,
		' without changing suggestedSource. Reply with ONLY the same JSON object {canImprove, suggestedSource, rationale}.'! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:44:55 am (UTC)'!
scrollTranscriptTo: anEnd

	[ transcriptMorph editor selectFrom: anEnd + 1 to: anEnd.
	  transcriptMorph scrollSelectionIntoView ] on: Error do: [ :error | ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:45:15 am (UTC)'!
sendFollowUp

	| note |

	busy ifTrue: [ ^self ].
	note := inputMorph text asString withBlanksTrimmed.
	note ifEmpty: [ ^self ].
	self clearInput.
	self postUserContent: (self followUpContentFor: note) transcriptLabel: 'You: ', note! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 11:41:35 am (UTC)'!
showProposal: aProposal

	(mentor suggestedSourceOf: aProposal)
		ifNotEmpty: [ :suggestion | self showSuggestion: suggestion ].
	self appendTranscript: 'Smalltalk Mentor: ', (self rationaleOrDefaultOf: aProposal).
	busy := false! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:45:11 am (UTC)'!
showProviderError: anError

	self appendTranscript: 'Error: ', anError messageText.
	busy := false! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 2:17:29 am (UTC)'!
showSuggestion: aString

	suggestedSource := self formattedSource: aString.
	suggestedMorph ifNotNil: [
		suggestedMorph model actualContents: suggestedSource asText ]! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 7:04:41 am (UTC)'!
switchLanguage

	busy ifTrue: [ ^self ].
	mentor switchLanguage.
	languageButton ifNotNil: [ languageButton label: self languageButtonLabel ].
	self
		postUserContent: self restateInCurrentLanguageContent
		transcriptLabel: self languageChangeLabel! !

!SmalltalkMentorReview methodsFor: 'conversation' stamp: 'HAW 9/Sep/2026, 7:04:39 am (UTC)'!
updateEffortLabels

	| provider |

	provider := mentor provider.
	providerLabel ifNotNil: [
		providerLabel contents: 'LLM: ', provider labelDescription ].
	effortButton ifNotNil: [ effortButton label: provider effortButtonLabel ]! !

!SmalltalkMentorReview methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:17:32 am (UTC)'!
formattedSource: aString

	aString withBlanksTrimmed ifEmpty: [ ^aString ].
	^[ Compiler format: aString in: targetClass notifying: nil ]
		on: Error do: [ :error | aString withCuisLineEndings ]! !

!SmalltalkMentorReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:23:28 am (UTC)'!
on: aClass selector: aSelector category: aCategory current: aCurrentSource suggested: aSuggestedSource rationale: aRationale messages: aMessagesCollection mentor: aMentor

	^self new
		initializeClass: aClass
		selector: aSelector
		category: aCategory
		current: aCurrentSource
		suggested: aSuggestedSource
		rationale: aRationale
		messages: aMessagesCollection
		mentor: aMentor! !

!SmalltalkMentorReview class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 11:41:49 am (UTC)'!
on: aClassSelectorAssociation source: source prompt: prompt answer: answer mentor: aMentor

	| proposal messages |

	proposal := aMentor parseProposalFrom: answer.
	messages := OrderedCollection
		with: (aMentor userMessage: prompt)
		with: (aMentor assistantMessage: answer).
	^self
		on: aClassSelectorAssociation key
		selector: aClassSelectorAssociation value
		category: aClassSelectorAssociation methodCategory
		current: source
		suggested: (aMentor suggestedSourceOf: proposal)
		rationale: (aMentor rationaleOf: proposal)
		messages: messages
		mentor: aMentor! !

!SmalltalkMethodHeuristic methodsFor: 'initialization' stamp: 'HAW 8/Sep/2026, 11:12:44 pm (UTC)'!
initializeFor: aCompiledMethod

	compiledMethod := aCompiledMethod! !

!SmalltalkMethodHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:12:48 pm (UTC)'!
description

	^self subclassResponsibility! !

!SmalltalkMethodHeuristic methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:24:36 am (UTC)'!
labelFor: findings

	^self name, ' (', findings size printString, ')'! !

!SmalltalkMethodHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:44:24 pm (UTC)'!
listingLine

	^self name, ': ', self description! !

!SmalltalkMethodHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:12:46 pm (UTC)'!
name

	^self subclassResponsibility! !

!SmalltalkMethodHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:38:48 pm (UTC)'!
finding

	^SmalltalkMentorFinding
		title: self name, ': ', self location
		detail: self violationDetail
		editKind: #method
		editTarget: self reviewedClass -> self selector! !

!SmalltalkMethodHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:12:50 pm (UTC)'!
isViolated

	^self subclassResponsibility! !

!SmalltalkMethodHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:12:52 pm (UTC)'!
value

	^self isViolated
		ifTrue: [ OrderedCollection with: self finding ]
		ifFalse: [ OrderedCollection new ]! !

!SmalltalkMethodHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:12:57 pm (UTC)'!
violationDetail

	^'The method ', self location, ' does not follow the heuristic: ', self description! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:38:59 pm (UTC)'!
anyAssertionArgumentSends: selectors

	^self assertionArguments anySatisfy: [ :eachArgument |
		eachArgument allNodes anySatisfy: [ :each | each isSendOfAnyOf: selectors ] ]! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:38:58 pm (UTC)'!
assertionArguments

	^self firstArgumentsOfSendsOf: self assertionSelectors! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:38:55 pm (UTC)'!
assertionSelectors

	^#(assert: assert:description: deny: deny:description:)! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:44:23 pm (UTC)'!
exceptionBlocks

	| expectations |

	expectations := self messageNodes select: [ :each |
		each isExceptionExpectationWithBlock ].
	^expectations collect: [ :each | each arguments first ]! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:38:53 pm (UTC)'!
firstArgumentsOfSendsOf: selectors

	| sends |

	sends := self messageNodes select: [ :each | each isSendOfAnyOf: selectors ].
	^sends collect: [ :each | each arguments first ]! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:36 pm (UTC)'!
formattedSourceCode

	^[ Compiler format: self sourceCode in: self reviewedClass notifying: nil ]
		on: Error do: [ :error | self sourceCode ]! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:13 pm (UTC)'!
isClassSide

	^self reviewedClass isMeta! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:05:15 am (UTC)'!
isOverriddenInSubclasses

	^compiledMethod isOverriddenInSubclasses! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:11 pm (UTC)'!
isTestMethod

	^compiledMethod isTestMethod! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:03 pm (UTC)'!
location

	^self reviewedClass name, '>>', self selector asString! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:38:51 pm (UTC)'!
messageNodes

	^self parseTree allNodes select: [ :each | each isMessageNode ]! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:29:13 am (UTC)'!
overridesAnInheritedMethod

	^compiledMethod overridesInheritedMethod! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:07 pm (UTC)'!
parseTree

	^compiledMethod methodNode! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:12:58 pm (UTC)'!
reviewedClass

	^compiledMethod methodClass! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:00 pm (UTC)'!
selector

	^compiledMethod selector! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:20 pm (UTC)'!
sendsAnyMessageSatisfying: aBlock

	^self messageNodes anySatisfy: aBlock! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:05 pm (UTC)'!
sourceCode

	^compiledMethod sourceCode asString! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:13:09 pm (UTC)'!
statements

	^self parseTree block statements! !

!SmalltalkMethodHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
tokens

	^(Scanner new scanTokens: self sourceCode withoutSmalltalkLiterals)
		withNestedArraysFlattened! !

!SmalltalkMethodHeuristic class methodsFor: 'instance creation' stamp: 'HAW 8/Sep/2026, 11:12:42 pm (UTC)'!
for: aCompiledMethod

	^self new initializeFor: aCompiledMethod! !

!AndOrOverBooleanOperatorsHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:41 pm (UTC)'!
description

	^'Use and: and or:, which short-circuit, instead of & and |.'! !

!AndOrOverBooleanOperatorsHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:39 pm (UTC)'!
name

	^'and:/or: over & and |'! !

!AndOrOverBooleanOperatorsHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:39:55 pm (UTC)'!
isViolated

	^self sendsAnyMessageSatisfying: [ :each | each isSendOfAnyOf: { #&. #| } ]! !

!AndOrTakeBlocksHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:28 pm (UTC)'!
description

	^'The argument of and: and or: is a block, so it is evaluated only when needed.'! !

!AndOrTakeBlocksHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:26 pm (UTC)'!
name

	^'and:/or: take blocks'! !

!AndOrTakeBlocksHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:39:47 pm (UTC)'!
isViolated

	^self sendsAnyMessageSatisfying: [ :each |
		(each isSendOfAnyOf: #(and: or: and:and: or:or: and:and:and: or:or:or:))
			and: [ each arguments anySatisfy: [ :eachArgument |
				(eachArgument isKindOf: BlockNode) not ] ] ]! !

!AvoidSettersHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:34 pm (UTC)'!
description

	^'Setters break immutability; when state must change, copy it from an already valid instance with syncWith:.'! !

!AvoidSettersHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:31 pm (UTC)'!
name

	^'Avoid setters'! !

!AvoidSettersHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:42 pm (UTC)'!
isViolated

	^self hasSetterSelector and: [ self hasSetterBody ]! !

!AvoidSettersHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:57:56 pm (UTC)'!
hasSetterBody

	| statements |

	statements := self statements.
	^statements size = 2
		and: [ statements first isAssignmentOfArgumentToInstanceVariable ]! !

!AvoidSettersHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:43 pm (UTC)'!
hasSetterSelector

	^self isClassSide not
		and: [ (self selector beginsWith: 'initialize') not
		and: [ self selector numArgs = 1 ] ]! !

!ComparisonWithNilHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:10 pm (UTC)'!
description

	^'Prefer isNil and notNil over comparing with nil.'! !

!ComparisonWithNilHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:08 pm (UTC)'!
name

	^'isNil over = nil'! !

!ComparisonWithNilHeuristic methodsFor: 'evaluating' stamp: 'HAW 9/Sep/2026, 11:39:24 am (UTC)'!
isViolated

	| tokens |

	tokens := self tokens.
	^(1 to: tokens size - 1) anySatisfy: [ :index |
		self hasNilComparisonAt: index in: tokens ]! !

!ComparisonWithNilHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:39:28 am (UTC)'!
hasNilComparisonAt: anIndex in: tokens

	^(self isNilAt: anIndex + 1 comparedAt: anIndex in: tokens)
		or: [ self isNilAt: anIndex comparedAt: anIndex + 1 in: tokens ]! !

!ComparisonWithNilHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:39:31 am (UTC)'!
isNilAt: aNilIndex comparedAt: aComparisonIndex in: tokens

	^(tokens at: aNilIndex) isNil
		and: [ tokens isSmalltalkComparisonAt: aComparisonIndex ]! !

!ConditionalOnEmptyTestHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:04 pm (UTC)'!
description

	^'Prefer ifEmpty: and ifNotEmpty: over isEmpty ifTrue: and notEmpty ifTrue:.'! !

!ConditionalOnEmptyTestHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:02 pm (UTC)'!
name

	^'ifEmpty: over isEmpty ifTrue:'! !

!ConditionalOnEmptyTestHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:44:11 pm (UTC)'!
isViolated

	^self sendsAnyMessageSatisfying: [ :each |
		each isConditionalSend
			and: [ each receiver isSendOfAnyOf: #(isEmpty notEmpty isEmptyOrNil) ] ]! !

!ConditionalOnNilTestHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:17 pm (UTC)'!
description

	^'Prefer ifNil: and ifNotNil: over isNil ifTrue: and notNil ifTrue:.'! !

!ConditionalOnNilTestHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:14 pm (UTC)'!
name

	^'ifNil: over isNil ifTrue:'! !

!ConditionalOnNilTestHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:44:09 pm (UTC)'!
isViolated

	^self sendsAnyMessageSatisfying: [ :each |
		each isConditionalSend
			and: [ each receiver isSendOfAnyOf: #(isNil notNil isNotNil) ] ]! !

!DenyOverAssertNotHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:43 pm (UTC)'!
description

	^'A test expecting a false condition sends deny: rather than assert: with a negated condition.'! !

!DenyOverAssertNotHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:41 pm (UTC)'!
name

	^'Prefer deny: over assert: not'! !

!DenyOverAssertNotHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:39:17 pm (UTC)'!
isViolated

	^self isTestMethod and: [
		(self firstArgumentsOfSendsOf: #(assert: assert:description:))
			anySatisfy: [ :each | each isSendOfAnyOf: #(not) ] ]! !

!EqualityOverIdentityHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:30:14 pm (UTC)'!
description

	^'Compare with = unless it must be exactly the same object.'! !

!EqualityOverIdentityHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 2:30:07 pm (UTC)'!
name

	^'Prefer = over =='! !

!EqualityOverIdentityHeuristic methodsFor: 'evaluating' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
isViolated

	^self tokens anySatisfy: [ :each | each isSymbol and: [ #(== ~~) includes: each ] ]! !

!ExceptionBlockSingleSendHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:50 pm (UTC)'!
description

	^'The block a test hands to should:raise: holds only the message send expected to fail.'! !

!ExceptionBlockSingleSendHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:47 pm (UTC)'!
name

	^'Exception block with a single send'! !

!ExceptionBlockSingleSendHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:20 pm (UTC)'!
isViolated

	^self isTestMethod and: [
		self exceptionBlocks anySatisfy: [ :each | each statements size ~= 1 ] ]! !

!ExceptionBlockWithoutAssignmentHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:57 pm (UTC)'!
description

	^'The result of a message send expected to signal an exception is neither assigned to a variable nor asserted to be nil.'! !

!ExceptionBlockWithoutAssignmentHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:55 pm (UTC)'!
name

	^'No assignment of a failing send'! !

!ExceptionBlockWithoutAssignmentHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:21 pm (UTC)'!
isViolated

	^self isTestMethod and: [
		self assignsAFailingSend or: [ self anyAssertionArgumentSends: #(isNil) ] ]! !

!ExceptionBlockWithoutAssignmentHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:23 pm (UTC)'!
assignsAFailingSend

	^self assignsInsideAnExceptionBlock or: [ self assignsTheResultOfOnDo ]! !

!ExceptionBlockWithoutAssignmentHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:25 pm (UTC)'!
assignsInsideAnExceptionBlock

	^self exceptionBlocks anySatisfy: [ :eachBlock |
		eachBlock allNodes anySatisfy: [ :each | each isAssignmentNode ] ]! !

!ExceptionBlockWithoutAssignmentHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:26 pm (UTC)'!
assignsTheResultOfOnDo

	^self parseTree allNodes anySatisfy: [ :each |
		each isAssignmentNode and: [ each value isSendOfAnyOf: #(on:do:) ] ]! !

!IfTrueIfFalseOrderHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:34 pm (UTC)'!
description

	^'Prefer ifTrue:ifFalse: over ifFalse:ifTrue:.'! !

!IfTrueIfFalseOrderHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:32 pm (UTC)'!
name

	^'ifTrue:ifFalse: over ifFalse:ifTrue:'! !

!IfTrueIfFalseOrderHeuristic methodsFor: 'evaluating' stamp: 'HAW 9/Sep/2026, 11:39:43 am (UTC)'!
isViolated

	^(self sendsAnyMessageSatisfying: [ :each | each isSendOfAnyOf: #(ifFalse:ifTrue:) ])
		or: [ self hasIfFalseIfTrueInTokens ]! !

!IfTrueIfFalseOrderHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:39:48 am (UTC)'!
hasIfFalseIfTrueAt: anIndex in: tokens

	| closingIndex |

	(tokens hasSmalltalkBlockAfterSelector: #ifFalse: at: anIndex) ifFalse: [ ^false ].
	closingIndex := tokens smalltalkBlockCloseIndexFrom: anIndex + 1.
	^closingIndex < tokens size and: [ (tokens at: closingIndex + 1) = #ifTrue: ]! !

!IfTrueIfFalseOrderHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 11:39:46 am (UTC)'!
hasIfFalseIfTrueInTokens

	| tokens |

	tokens := self tokens.
	^(1 to: tokens size) anySatisfy: [ :index | self hasIfFalseIfTrueAt: index in: tokens ]! !

!InstanceCreationFormatHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:00 pm (UTC)'!
description

	^'An instance creation message runs its preconditions, each as a self assert... send, and then answers ^self new initialize...'! !

!InstanceCreationFormatHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:58 pm (UTC)'!
name

	^'Instance creation format'! !

!InstanceCreationFormatHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:44:17 pm (UTC)'!
isViolated

	^self isClassSide
		and: [ self instantiates
		and: [ self hasInstanceCreationFormat not ] ]! !

!InstanceCreationFormatHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:39:30 pm (UTC)'!
hasInstanceCreationFormat

	| statements |

	statements := self statements.
	^(statements allButLast allSatisfy: [ :each | each isSelfAssertSend ])
		and: [ statements last isReturnOfInitializedInstance ]! !

!InstanceCreationFormatHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:44:19 pm (UTC)'!
instantiates

	^self statements anySatisfy: [ :each |
		each valueExpression isBuiltOnNewInstance ]! !

!KeywordMessageSendFormatHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:21 pm (UTC)'!
description

	^'A keyword message send longer than 80 characters is written with the receiver on the first line and one tabbed line per keyword and argument.'! !

!KeywordMessageSendFormatHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:19 pm (UTC)'!
name

	^'Keyword message send format'! !

!KeywordMessageSendFormatHeuristic methodsFor: 'evaluating' stamp: 'HAW 9/Sep/2026, 3:09:30 am (UTC)'!
isViolated

	| bodyLines |

	bodyLines := self sourceCode withoutSmalltalkLiterals lines allButFirst.
	^bodyLines anySatisfy: [ :each |
		each size > 80 and: [ each hasSmalltalkKeyword ] ]! !

!MessageKeywordsLowercaseHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:05 pm (UTC)'!
description

	^'Every keyword of a selector starts with a lowercase letter.'! !

!MessageKeywordsLowercaseHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:03 pm (UTC)'!
name

	^'Message keywords start lowercase'! !

!MessageKeywordsLowercaseHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:30 pm (UTC)'!
isViolated

	^self selector keywords anySatisfy: [ :each | each first isUppercase ]! !

!MethodComplexityHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:42 pm (UTC)'!
description

	^'A method does not send more than 10 messages or so.'! !

!MethodComplexityHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:40 pm (UTC)'!
name

	^'Method complexity'! !

!MethodComplexityHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:16:44 pm (UTC)'!
isViolated

	^self messageNodes size > 10! !

!MethodComplexityHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:16:46 pm (UTC)'!
violationDetail

	^'The method ', self location, ' sends ', self messageNodes size printString, ' messages; a method does not send more than 10 or so.'! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:50 pm (UTC)'!
description

	^'A method referencing no self, super nor instance variable is a helper: it belongs on the class of one of its parameters, as an extension method when that class is in another package.'! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:48 pm (UTC)'!
name

	^'Move helper method to the right class'! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'evaluating' stamp: 'HAW 9/Sep/2026, 2:47:04 am (UTC)'!
isViolated

	^self selector numArgs > 0
		and: [ self isExemptFromMoving not
		and: [ self referencesItsOwnState not ] ]! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'private' stamp: 'HAW 9/Sep/2026, 3:05:19 am (UTC)'!
isExemptFromMoving

	^self isClassSide
		or: [ self isTestMethod
		or: [ self overridesAnInheritedMethod
		or: [ self isOverriddenInSubclasses ] ] ]! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:53 pm (UTC)'!
referencesAnInstanceVariable

	^(1 to: self reviewedClass instSize) anySatisfy: [ :each |
		(compiledMethod readsField: each) or: [ compiledMethod writesField: each ] ]! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:50 pm (UTC)'!
referencesItsOwnState

	^self referencesSelfOrSuper or: [ self referencesAnInstanceVariable ]! !

!MoveHelperMethodToRightClassHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:52 pm (UTC)'!
referencesSelfOrSuper

	^self tokens anySatisfy: [ :each |
		each isSymbol and: [ #(self super) includes: each ] ]! !

!NoExtraParenthesisHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:33 pm (UTC)'!
description

	^'Message precedence makes some parentheses unnecessary; they are left out.'! !

!NoExtraParenthesisHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:29 pm (UTC)'!
name

	^'No extra parenthesis'! !

!NoExtraParenthesisHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:18:36 pm (UTC)'!
isViolated

	^self sourceCode smalltalkParenthesisCount > self formattedSourceCode smalltalkParenthesisCount! !

!NoNilPreconditionHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:21 pm (UTC)'!
description

	^'An instance creation precondition does not test whether a parameter is nil; nil should not flow in the first place.'! !

!NoNilPreconditionHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:19 pm (UTC)'!
name

	^'No nil precondition'! !

!NoNilPreconditionHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:35 pm (UTC)'!
isViolated

	^self isClassSide and: [
		self anyAssertionArgumentSends: #(isNil notNil isNotNil ifNil: ifNotNil:) ]! !

!NoSetGetHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:12 pm (UTC)'!
description

	^'A getter is named after what it answers and a setter after what it sets; neither starts with get or set.'! !

!NoSetGetHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:09 pm (UTC)'!
name

	^'No get/set accessors'! !

!NoSetGetHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:32 pm (UTC)'!
isViolated

	^self selector ~= #setUp and: [
		#('get' 'set') anySatisfy: [ :each | self selectorStartsWithWord: each ] ]! !

!NoSetGetHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:49:34 pm (UTC)'!
selectorStartsWithWord: aPrefix

	| selectorString |

	selectorString := self selector asString.
	^(selectorString beginsWith: aPrefix)
		and: [ selectorString isUppercaseAt: aPrefix size + 1 ]! !

!NoTypePreconditionHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:27 pm (UTC)'!
description

	^'An instance creation precondition does not test the type of a parameter.'! !

!NoTypePreconditionHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:16:25 pm (UTC)'!
name

	^'No type precondition'! !

!NoTypePreconditionHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:57:49 pm (UTC)'!
isViolated

	^self isClassSide
		and: [ self anyAssertionArgumentSends: self selectorsTestingType ]! !

!NoTypePreconditionHeuristic methodsFor: 'private' stamp: 'HAW 8/Sep/2026, 11:57:51 pm (UTC)'!
selectorsTestingType

	^#(isKindOf: isMemberOf: respondsTo: class isString isNumber isInteger isSymbol isCollection isBlock isFloat isArray)! !

!RedundantIfTrueConditionHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:48 pm (UTC)'!
description

	^'A boolean is used directly: object ifTrue:, not object = true ifTrue:.'! !

!RedundantIfTrueConditionHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:17:46 pm (UTC)'!
name

	^'No comparison with true or false'! !

!RedundantIfTrueConditionHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:57 pm (UTC)'!
isViolated

	^self sendsAnyMessageSatisfying: [ :each |
		(each isSendOfAnyOf: #(= == ~= ~~))
			and: [ each arguments first isBooleanPseudoVariable ] ]! !

!SizeComparedWithZeroHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:23 pm (UTC)'!
description

	^'Prefer isEmpty and notEmpty over comparing size with 0.'! !

!SizeComparedWithZeroHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:18:21 pm (UTC)'!
name

	^'isEmpty over size = 0'! !

!SizeComparedWithZeroHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:44:07 pm (UTC)'!
isViolated

	^self sendsAnyMessageSatisfying: [ :each |
		(each isSendOfAnyOf: #(= == ~= ~~ > <=))
			and: [ (each receiver isSendOfAnyOf: #(size))
			and: [ each arguments first isZeroLiteral ] ] ]! !

!TestingForEqualityHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:37 pm (UTC)'!
description

	^'A test compares with assert: actual equals: expected, not with assert: expected = actual, so a failure shows both values.'! !

!TestingForEqualityHeuristic methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:15:35 pm (UTC)'!
name

	^'Prefer assert:equals: over assert: with ='! !

!TestingForEqualityHeuristic methodsFor: 'evaluating' stamp: 'HAW 8/Sep/2026, 11:49:17 pm (UTC)'!
isViolated

	^self isTestMethod and: [
		self assertionArguments anySatisfy: [ :each |
			each isSendOfAnyOf: #(= == ~= ~~) ] ]! !

!SmalltalkMentorConversationEditor methodsFor: 'typing/selecting keys' stamp: 'HAW 9/Sep/2026, 3:07:59 am (UTC)'!
returnKey: aKeyboardEvent

	| sendsWithCommand |

	sendsWithCommand := aKeyboardEvent commandAltKeyPressed
		and: [ model isKindOf: SmalltalkMentorConversationTextModel ].
	sendsWithCommand ifTrue: [
		model review ifNotNil: [ :review | review sendFollowUp ].
		^true ].
	^super returnKey: aKeyboardEvent! !

!SmalltalkMentorNoCopyEditor methodsFor: 'clipboard' stamp: 'HAW 9/Sep/2026, 2:01:44 am (UTC)'!
clipboardTextPut: aText

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

!SmalltalkMentorNode methodsFor: 'accessing' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
payload

	^item! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 18/Aug/2026, 6:56:14 pm (UTC)'!
asString

	^label! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
contents

	(childNodes isKindOf: BlockClosure) ifTrue: [ childNodes := childNodes value ].
	^childNodes ifNil: [ #() ]! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
hasContents

	(childNodes isKindOf: BlockClosure) ifTrue: [ ^true ].
	^(childNodes ifNil: [ #() ]) notEmpty! !

!SmalltalkMentorNode methodsFor: 'tree wrapper' stamp: 'HAW 9/Sep/2026, 2:01:45 am (UTC)'!
sendSettingMessageTo: aModel

	aModel nodeSelected: self! !

!SmalltalkMentorNode class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:45:40 am (UTC)'!
label: aLabel kind: aKind payload: aPayload children: aChildrenCollection model: aModel

	^self new
		initializeLabel: aLabel
		kind: aKind
		payload: aPayload
		children: aChildrenCollection
		model: aModel! !

!SmalltalkMentorNode class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:45:42 am (UTC)'!
label: aLabel kind: aKind payload: aPayload childrenBlock: aBlock model: aModel

	^self
		label: aLabel
		kind: aKind
		payload: aPayload
		children: aBlock
		model: aModel! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:43 am (UTC)'!
addDeclaredTemporariesTo: aCollection

	^self! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:19 am (UTC)'!
allNodes

	| nodes |

	nodes := OrderedCollection new.
	self accept: (ParseNodeEnumerator ofBlock: [ :each | nodes add: each ]).
	^nodes! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:48 am (UTC)'!
isAllowedInInitialize

	^self isAssignmentNode! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:51 pm (UTC)'!
isAssignmentOfArgumentToInstanceVariable

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:44 pm (UTC)'!
isBooleanPseudoVariable

	^(self isPseudoVariableNamed: 'true') or: [ self isPseudoVariableNamed: 'false' ]! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:07 pm (UTC)'!
isBuiltOnNewInstance

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:37 pm (UTC)'!
isConditionalSend

	^self isSendOfAnyOf: #(ifTrue: ifFalse: ifTrue:ifFalse: ifFalse:ifTrue:)! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:24 pm (UTC)'!
isExceptionExpectationWithBlock

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:15 pm (UTC)'!
isInitializeSentToNewInstance

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:40 pm (UTC)'!
isPseudoVariableNamed: aName

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:20 pm (UTC)'!
isReturnOfInitializedInstance

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:11 pm (UTC)'!
isSelfAssertSend

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:34 pm (UTC)'!
isSendOfAnyOf: selectors

	^self isMessageNode and: [ selectors includes: self selectorSymbol ]! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:02 pm (UTC)'!
isSendOfNewToSelf

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:46 pm (UTC)'!
isZeroLiteral

	^false! !

!ParseNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:55 pm (UTC)'!
valueExpression

	^self! !

!AssignmentNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:20 am (UTC)'!
isAssignmentOfArgumentToInstanceVariable

	^(self variable isKindOf: InstanceVariableNode)
		and: [ self value isKindOf: TempVariableNode ]! !

!AssignmentNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:00 pm (UTC)'!
valueExpression

	^self value! !

!BlockNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:45 am (UTC)'!
addDeclaredTemporariesTo: aCollection

	(self temporaries ifNil: [ #() ]) do: [ :each |
		each class = TempVariableNode ifTrue: [ aCollection add: each ] ]! !

!LiteralNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:48 pm (UTC)'!
isZeroLiteral

	^self literalValue = 0! !

!VariableNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:42 pm (UTC)'!
isPseudoVariableNamed: aName

	^self name = aName! !

!TempVariableNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:55 am (UTC)'!
isAssignedTemporary

	^(self instVarNamed: 'hasDefs') ifNil: [ false ]! !

!MessageNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:52 am (UTC)'!
isAllowedInInitialize

	^self receiver isSuperPseudoVariable and: [ self selectorSymbol = #initialize ]! !

!MessageNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:09 pm (UTC)'!
isBuiltOnNewInstance

	^self isSendOfNewToSelf or: [ self receiver isBuiltOnNewInstance ]! !

!MessageNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:22 am (UTC)'!
isExceptionExpectationWithBlock

	^(self selectorSymbol beginsWith: 'should:raise:')
		and: [ self arguments first isKindOf: BlockNode ]! !

!MessageNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:18 pm (UTC)'!
isInitializeSentToNewInstance

	^(self selectorSymbol beginsWith: 'initialize') and: [ self receiver isSendOfNewToSelf ]! !

!MessageNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:13 pm (UTC)'!
isSelfAssertSend

	^self receiver isSelfPseudoVariable and: [ self selectorSymbol beginsWith: 'assert' ]! !

!MessageNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:05 pm (UTC)'!
isSendOfNewToSelf

	^self receiver isSelfPseudoVariable and: [ #(new basicNew new: basicNew:) includes: self selectorSymbol ]! !

!ReturnNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:50 am (UTC)'!
isAllowedInInitialize

	^self expr isSelfPseudoVariable! !

!ReturnNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:38:22 pm (UTC)'!
isReturnOfInitializedInstance

	^self expr isInitializeSentToNewInstance! !

!ReturnNode methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:37:57 pm (UTC)'!
valueExpression

	^self expr! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:05 am (UTC)'!
anyMethodReadsInstanceVariable: aName atIndex: anIndex

	^(self whichSelectorsAccess: aName)
		anySatisfy: [ :each | self >> each readsField: anIndex ]! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:14:12 am (UTC)'!
categoryOfSelector: aSelector

	^[ self organization categoryOfElement: aSelector ]
		on: Error do: [ :error | 'as yet unclassified' ]! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:07 am (UTC)'!
emptyMethodCategories

	^self organization categories
		select: [ :each | self isMethodCategoryEmpty: each ]! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:07:13 am (UTC)'!
isMethodCategoryEmpty: aCategoryName

	^(self organization listAtCategoryNamed: aCategoryName) isEmpty! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:14:09 am (UTC)'!
isTestMethodAt: aSelector

	^(self includesSelector: aSelector) and: [ (self >> aSelector) isTestMethod ]! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:10 am (UTC)'!
nonEmptyMethodCategories

	^self organization categories
		reject: [ :each | self isMethodCategoryEmpty: each ]! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:42:13 am (UTC)'!
openClassBrowser

	^BrowserWindow fullOnClass: self selector: nil! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:14 am (UTC)'!
selectorsSendingNewToSelf

	^self selectors asSortedCollection
		select: [ :each | (self >> each) sendsNewToSelf ]! !

!Behavior methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:11 am (UTC)'!
sourcesReferringTo: aBinding

	^(self whichSelectorsReferTo: aBinding) asArray
		collect: [ :each | self sourceCodeAt: each ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:29 am (UTC)'!
assignmentCountToClassVariableNamed: aName

	^(self sourcesReferringToClassVariableNamed: aName)
		inject: 0
		into: [ :total :each | total + (each assignmentCountTo: aName) ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:44:31 pm (UTC)'!
compiledMethodsOnBothSides

	| methods |

	methods := OrderedCollection new.
	{ self. self class } do: [ :eachClassOrMetaclass |
		eachClassOrMetaclass selectors asSortedCollection do: [ :eachSelector |
			methods add: eachClassOrMetaclass >> eachSelector ] ].
	^methods! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:31 am (UTC)'!
isReferencedByOthers

	^(Smalltalk allCallsOn: self binding)
		anySatisfy: [ :each | each actualClass theNonMetaClass ~= self ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:26:31 am (UTC)'!
leafSubclasses

	^self allSubclasses select: [ :each | each subclasses isEmpty ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:33 am (UTC)'!
readsClassVariableNamed: aName

	| occurrences |

	occurrences := (self sourcesReferringToClassVariableNamed: aName)
		inject: 0
		into: [ :total :each | total + (each occurrencesOfSubstring: aName) ].
	^occurrences > (self assignmentCountToClassVariableNamed: aName)! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:23 am (UTC)'!
readsInstanceVariableNamed: aName

	| index |

	index := self allInstVarNames indexOf: aName.
	^self withAllSubclasses anySatisfy: [ :each |
		each anyMethodReadsInstanceVariable: aName atIndex: index ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:38 am (UTC)'!
selectorsIntroducedBelowSelfIn: aLeafSubclass

	| protocolAboveSelf |

	protocolAboveSelf := self superclass
		ifNil: [ Set new ]
		ifNotNil: [ :aSuperclass | aSuperclass allSelectors asSet ].
	^aLeafSubclass allSelectors asSet
		reject: [ :each | protocolAboveSelf includes: each ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:26:33 am (UTC)'!
selectorsSharedByAllLeafSubclasses

	| leaves shared |

	leaves := self leafSubclasses.
	leaves ifEmpty: [ ^Set new ].
	shared := self selectorsIntroducedBelowSelfIn: leaves first.
	leaves allButFirst do: [ :each |
		shared := shared intersection: (self selectorsIntroducedBelowSelfIn: each) ].
	^shared! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:41 am (UTC)'!
sourcesReferringToClassVariableNamed: aName

	| binding |

	binding := self bindingOf: aName.
	^(self sourcesReferringTo: binding), (self class sourcesReferringTo: binding)! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:42:30 am (UTC)'!
subclassImplementing: aSelector

	^self allSubclasses detect: [ :each | each includesSelector: aSelector ]! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:26:24 am (UTC)'!
writesClassVariableNamed: aName

	^(self assignmentCountToClassVariableNamed: aName) > 0! !

!Class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:43 am (UTC)'!
writesInstanceVariableNamed: aName

	^self withAllSubclasses
		anySatisfy: [ :each | (each whichSelectorsStoreInto: aName) notEmpty ]! !

!Collection methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:06:36 am (UTC)'!
includesNonBlankLine

	^self anySatisfy: [ :each | each withBlanksTrimmed notEmpty ]! !

!Collection methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:26 am (UTC)'!
linesJoinedWithNewLine

	^String streamContents: [ :stream |
		self do: [ :each | stream nextPutAll: each; newLine ] ]! !

!SequenceableCollection methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:48 am (UTC)'!
hasSmalltalkBlockAfterSelector: aSelector at: anIndex

	^(self at: anIndex) = aSelector
		and: [ anIndex < self size
		and: [ (self at: anIndex + 1) = #'[' ] ]! !

!SequenceableCollection methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:52 am (UTC)'!
isSmalltalkComparisonAt: anIndex

	| token |

	token := self at: anIndex.
	^token isSymbol and: [ #(= == ~= ~~) includes: token ]! !

!SequenceableCollection methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:29:10 pm (UTC)'!
smalltalkBlockCloseIndexFrom: anOpenIndex

	| depth |

	depth := 0.
	anOpenIndex to: self size do: [ :index |
		(self at: index) = #'[' ifTrue: [ depth := depth + 1 ].
		(self at: index) = #']' ifTrue: [ depth := depth - 1 ].
		depth = 0 ifTrue: [ ^index ] ].
	^self size! !

!Array methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:15:31 pm (UTC)'!
addElementsFlattenedTo: aStream

	self do: [ :each |
		each isArray
			ifTrue: [ each addElementsFlattenedTo: aStream ]
			ifFalse: [ aStream nextPut: each ] ]! !

!Array methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:15:29 pm (UTC)'!
withNestedArraysFlattened

	^Array streamContents: [ :stream | self addElementsFlattenedTo: stream ]! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:30 am (UTC)'!
classSelectorAssociation

	^self methodClass -> self selector! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:01 am (UTC)'!
declaredTemporaryNodes

	| parseTree temporaryNodes |

	parseTree := self methodNode.
	parseTree ensureClosureAnalysisDone.
	temporaryNodes := IdentitySet new.
	parseTree accept: (ParseNodeEnumerator
		ofBlock: [ :each | each addDeclaredTemporariesTo: temporaryNodes ]).
	^temporaryNodes! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:56 am (UTC)'!
doesOnlyAssignments

	^[ self statements allSatisfy: [ :each | each isAllowedInInitialize ] ]
		on: Error
		do: [ :error | true ]! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:24 am (UTC)'!
hasSenders

	^(Smalltalk allCallsOn: self selector) notEmpty! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:37 am (UTC)'!
isOverriddenInSubclasses

	^self methodClass allSubclasses
		anySatisfy: [ :each | each includesSelector: self selector ]! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:28 am (UTC)'!
isUncategorized

	| category |

	category := self methodClass categoryOfSelector: self selector.
	^category isNil or: [ category asString = 'as yet unclassified' ]! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:31:31 am (UTC)'!
locationString

	^self methodClass name, '>>', self selector asString! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:26 am (UTC)'!
overridesInheritedMethod

	^self methodClass superclass canUnderstand: self selector! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:25:35 am (UTC)'!
sendsNewToSelf

	^[ self methodNode allNodes anySatisfy: [ :each | each isSendOfNewToSelf ] ]
		on: Error do: [ :error | false ]! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:58 am (UTC)'!
statements

	^self methodNode block statements! !

!CompiledMethod methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:00 am (UTC)'!
unusedTemporaryNodes

	^(self declaredTemporaryNodes select: [ :each | each isUnusedTemp ])
		asSortedCollection: [ :first :second | first name <= second name ]! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:08:25 am (UTC)'!
assignmentCountTo: aVariableName

	^(self occurrencesOfSubstring: aVariableName, ' :=')
		+ (self occurrencesOfSubstring: aVariableName, ':=')! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 11:12:57 am (UTC)'!
camelCaseWords

	| words wordStream |

	words := OrderedCollection new.
	wordStream := WriteStream on: String new.
	self keysAndValuesDo: [ :characterIndex :eachCharacter |
		(self startsNewCamelCaseWordAt: characterIndex) ifTrue: [
			words add: wordStream contents.
			wordStream := WriteStream on: String new ].
		wordStream nextPut: eachCharacter ].
	^words add: wordStream contents; yourself! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:05 am (UTC)'!
hasSmalltalkKeyword

	^(1 to: self size)
		anySatisfy: [ :index | self isSmalltalkKeywordColonAt: index ]! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:06:32 am (UTC)'!
isMarkdownSectionHeader

	^self withBlanksTrimmed beginsWith: '## '! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:09 am (UTC)'!
isSmalltalkAssignmentAt: anIndex

	^anIndex < self size and: [ (self at: anIndex + 1) = $= ]! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:07 am (UTC)'!
isSmalltalkKeywordColonAt: anIndex

	^(self at: anIndex) = $:
		and: [ anIndex > 1
		and: [ (self at: anIndex - 1) isLetter
		and: [ (self isSmalltalkAssignmentAt: anIndex) not ] ] ]! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:49:12 pm (UTC)'!
isUppercaseAt: anIndex

	^anIndex <= self size and: [ (self at: anIndex) isUppercase ]! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:06:34 am (UTC)'!
markdownSectionTitle

	^(self withBlanksTrimmed allButFirst: 3) withBlanksTrimmed! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:41:44 am (UTC)'!
occurrencesOfSubstring: aSubstring

	| count index |

	count := 0.
	index := self findString: aSubstring.
	[ index > 0 ] whileTrue: [
		count := count + 1.
		index := self findString: aSubstring startingAt: index + aSubstring size ].
	^count! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:28:58 pm (UTC)'!
smalltalkParenthesisCount

	^self withoutSmalltalkLiterals occurrencesOf: $(! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 11:12:57 am (UTC)'!
startsNewCamelCaseWordAt: anIndex

	| characterAtIndex |

	anIndex = 1 ifTrue: [ ^false ].
	characterAtIndex := self at: anIndex.
	characterAtIndex isUppercase ifFalse: [ ^false ].
	^(self at: anIndex - 1) isLowercase
		or: [ anIndex < self size and: [ (self at: anIndex + 1) isLowercase ] ]! !

!CharacterSequence methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:12 am (UTC)'!
withoutSmalltalkLiterals

	| stream |

	stream := self readStream.
	^String streamContents: [ :code |
		[ stream atEnd ] whileFalse: [
			stream skipSmalltalkLiteralOrCopyNextTo: code ] ]! !

!Symbol methodsFor: '*SmalltalkMentor' stamp: 'HAW 8/Sep/2026, 11:56:45 pm (UTC)'!
firstKeywordWithoutColon

	^self asString copyUpTo: $:! !

!ReadStream methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
skipSmalltalkBracketedLiteral

	| depth |

	depth := 0.
	[ | character |
	  character := self next.
	  ('([' includes: character) ifTrue: [ depth := depth + 1 ].
	  (')]' includes: character) ifTrue: [ depth := depth - 1 ].
	  depth > 0 and: [ self atEnd not ] ] whileTrue! !

!ReadStream methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:04:51 am (UTC)'!
skipSmalltalkHashLiteralOrCopy: aHashCharacter to: aWriteStream

	self peek = $' ifTrue: [ self next. ^self skipSmalltalkStringBody ].
	('([' includes: self peek) ifTrue: [ ^self skipSmalltalkBracketedLiteral ].
	aWriteStream nextPut: aHashCharacter! !

!ReadStream methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:04:53 am (UTC)'!
skipSmalltalkLiteralOrCopyNextTo: aWriteStream

	| character |

	character := self next.
	character = $$ ifTrue: [ ^self next ].
	character = $" ifTrue: [ ^self upTo: $" ].
	character = $' ifTrue: [ ^self skipSmalltalkStringBody ].
	character = $# ifTrue: [
		^self skipSmalltalkHashLiteralOrCopy: character to: aWriteStream ].
	aWriteStream nextPut: character! !

!ReadStream methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:01:41 am (UTC)'!
skipSmalltalkStringBody

	[ self upTo: $'.
	  self peek = $' ] whileTrue: [ self next ]! !

!Browser methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:14:16 am (UTC)'!
newCodePaneMorph

	^TextModelMorph
		textProvider: self
		textGetter: #acceptedContents
		textSetter: #contents:notifying:
		selectionGetter: #contentsSelection! !

!Association methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:07:51 am (UTC)'!
methodCategory

	^self key categoryOfSelector: self value! !

!Association methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:42:05 am (UTC)'!
methodLocationString

	^self key name, '>>', self value asString! !

!Association methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:42:08 am (UTC)'!
openMethodBrowser

	^BrowserWindow fullOnClass: self key selector: self value! !

!LayoutMorph class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:06:13 am (UTC)'!
newToastLabeled: aString

	| label toast |

	label := LabelMorph contents: aString.
	toast := self newRow.
	toast separation: 12.
	toast color: self toastColor.
	toast borderColor: Color gray; borderWidth: 1.
	toast addMorph: label.
	toast morphExtent: label morphExtent + (28 @ 18).
	^toast! !

!LayoutMorph class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:06:16 am (UTC)'!
toastColor

	^Color r: 1.0 g: 0.95 b: 0.6! !

!TextModelMorph methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:09:25 am (UTC)'!
selectFirstOccurrenceOf: aString

	| index |

	index := self text asString findString: aString.
	index > 0 ifTrue: [
		[ self editor selectFrom: index to: index + aString size - 1 ]
			on: Error
			do: [ :error | ] ]! !

!PasteUpMorph methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 3:06:09 am (UTC)'!
addToastLabeled: aString

	| toast |

	toast := LayoutMorph newToastLabeled: aString.
	toast morphPosition: self morphExtent x - toast morphExtent x // 2 @ 40.
	self addMorph: toast.
	^toast! !

!UISupervisor class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 6:59:39 am (UTC)'!
showToastLabeled: aString

	^self ui world ifNotNil: [ :world | world addToastLabeled: aString ]! !

!UISupervisor class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 7:04:26 am (UTC)'!
showTransientToastLabeled: aString

	| toast |

	toast := self showToastLabeled: aString.
	[ (Delay forSeconds: 2) wait.
	  self whenUIinSafeState: [ toast ifNotNil: [ toast delete ] ] ] fork.
	^toast! !

!MethodReference methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:42:20 am (UTC)'!
classSelectorAssociation

	^self actualClass -> self selector! !

!MethodReference methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:42:17 am (UTC)'!
locationString

	^self actualClass name, '>>', self selector asString! !

!PopUpMenu class methodsFor: '*SmalltalkMentor' stamp: 'HAW 9/Sep/2026, 2:14:05 am (UTC)'!
withCaption: aCaption chooseFrom: valueArray current: currentValue

	| displayLabels chosenIndex |

	displayLabels := valueArray collect: [ :each |
		each = currentValue ifTrue: [ each, ' (current)' ] ifFalse: [ each ] ].
	chosenIndex := self withCaption: aCaption chooseFrom: displayLabels.
	chosenIndex = 0 ifTrue: [ ^nil ].
	^valueArray at: chosenIndex! !
SmalltalkMentor initialize!
