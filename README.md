# Smalltalk Mentor

**Idioma / Language: [Español](#español) · [English](#english)**

Smalltalk Mentor reviews your code inside a **Cuis Smalltalk** image. It checks a method,
a class, a method category or a class category against a set of design heuristics, shows
you exactly where the code fails each one, and can ask a Large Language Model for a better
version that you discuss and accept from the same window.

## Español

### Instalación

1. Abrí una imagen de **Cuis Smalltalk**.
2. Cargá los paquetes de los que depende:
   - **JSON** (viene con Cuis, en `Packages/Features/JSON.pck.st`).
   - **OSProcess**: cloná o descargá <https://github.com/Cuis-Smalltalk/OSProcess> y cargá
     `OSProcess.pck.st`. El Mentor lo usa para llamar a `curl`, porque la imagen no tiene TLS.
3. Cargá **`SmalltalkMentor.pck.st`** (World ▸ Open ▸ Installed Packages ▸ *install*, o
   *File In*). Al cargarse instala sus menús y el atajo `cmd+0`.
4. Para conversar con un modelo de lenguaje, guardá tu clave de API en un archivo con solo
   la clave, por ejemplo `<carpeta de la imagen>/anthropic.key` para Claude (ver
   [LLM providers and keys](#llm-providers-and-keys) para los demás proveedores). Las
   heurísticas fijas funcionan sin clave.
5. Para correr los tests, cargá también **`SmalltalkMentorTests.pck.st`**.

### Uso

En el browser, seleccioná lo que querés revisar y apretá **`cmd+0`** (o elegí la opción del
submenú **Smalltalk Mentor** del botón derecho):

- un **método**: se abre una ventana con la lista de heurísticas que el método no cumple;
  al seleccionar una ves su descripción arriba y el código abajo, con las partes que fallan
  resaltadas. La última opción, *Ask the LLM for a better version*, le pide al modelo una
  versión mejor y abre la conversación.
- una **clase**: a la izquierda ves las heurísticas de clase que fallan y, debajo de
  *Instance methods* y *Class methods*, cada categoría y cada método con sus heurísticas
  fallidas.
- una **categoría de métodos** o una **categoría de clases**: lo mismo, para cada método o
  cada clase de la categoría.

Con el botón derecho sobre un nodo del árbol podés volver a correr la revisión (*Run
again*) o abrir un browser (*Browse*). Los botones de abajo cambian el proveedor de LLM,
el esfuerzo del modelo y el idioma de las respuestas (por defecto, español).

## English

### Installation

1. Open a **Cuis Smalltalk** image.
2. Load the packages it depends on:
   - **JSON** (it ships with Cuis, as `Packages/Features/JSON.pck.st`).
   - **OSProcess**: clone or download <https://github.com/Cuis-Smalltalk/OSProcess> and
     load `OSProcess.pck.st`. The Mentor uses it to call `curl`, since the image has no TLS.
3. Load **`SmalltalkMentor.pck.st`** (World ▸ Open ▸ Installed Packages ▸ *install*, or
   *File In*). On load it installs its menus and the `cmd+0` shortcut.
4. To talk to a language model, save your API key in a file containing only the key, for
   example `<image folder>/anthropic.key` for Claude (see
   [LLM providers and keys](#llm-providers-and-keys) for the other providers). The fixed
   heuristics work without any key.
5. To run the tests, load **`SmalltalkMentorTests.pck.st`** as well.

### Use

In the browser, select what you want to review and press **`cmd+0`** (or pick the option
from the right-click **Smalltalk Mentor** submenu):

- a **method**: a window opens listing the heuristics the method fails; selecting one shows
  its description on top and the source below, with the failing parts highlighted. The last
  entry, *Ask the LLM for a better version*, asks the model for a better version and opens
  the conversation.
- a **class**: on the left you get the class heuristics that fail and, under *Instance
  methods* and *Class methods*, every category and every method with its failed heuristics.
- a **method category** or a **class category**: the same, for every method or every class
  in the category.

Right-click a tree node to re-run its review (*Run again*) or open a browser on it
(*Browse*). The buttons below the tree change the LLM provider, the model effort and the
language of the answers (Spanish by default).

## The review windows

Every review is a tree on the left and a detail pane on the right.

| You select                          | The detail pane shows                                                                 |
|-------------------------------------|---------------------------------------------------------------------------------------|
| a failed heuristic of a method      | its description over the method source, the failing code highlighted, editable in place |
| *All heuristics passed*             | the list of heuristics that were checked                                              |
| *Ask the LLM for a better version*  | the conversation: transcript, original and suggested source, an input to reply         |
| a method                            | its source                                                                            |
| a method category                   | the methods of the category that fail a heuristic, with the heuristics each one fails  |
| *Instance methods* / *Class methods* | the same, grouped by category                                                        |
| a failed class heuristic            | the elements that fail it; each opens the method or the class definition to fix it     |

The LLM conversation shows the original method next to the suggested one; you can push back,
ask follow-ups (`cmd+Enter` sends), switch the language for that conversation and accept the
suggestion, which compiles it. The suggested source cannot be copied on purpose: type the fix.

## The heuristics

All of these are checked by Smalltalk code in the image, instantly and without any key.

### Class heuristics

| Heuristic | What it checks |
|-----------|----------------|
| Instance variables read & written | Every instance variable is both read and written, in the class or a subclass. |
| Class variables read & written | Every class variable is both read and written, on the instance or the class side. |
| Methods have senders | Every method has a sender; overrides and test methods are excluded. |
| Messages have implementers | Every message a method sends has an implementer in the image. |
| Methods are categorized | No method lives in *as yet unclassified*. |
| No empty method categories | A method category with no methods is removed. |
| No class-name prefix in names | Instance variables and messages do not repeat a word of the class name, except a class-side selector that would otherwise shadow the `Class` protocol. |
| Instance creation funnelled through one message | Only one class-side message sends `new` to `self`; the others delegate to it. |
| One initialize message doing only assignments | A class defines a single `initialize…` message, and it only assigns instance variables. |
| Class is referenced | The class is referenced by another class or has subclasses. |
| Shared leaf-subclass protocol in root | A message every leaf subclass answers is declared in the root, concretely or as `subclassResponsibility`. |

### Method heuristics

| Heuristic | What it checks |
|-----------|----------------|
| Prefer assert:equals: over assert: with = | A test compares with `assert: actual equals: expected`. |
| Prefer deny: over assert: not | A test expecting `false` sends `deny:`. |
| Exception block with a single send | The block given to `should:raise:` holds only the send expected to fail. |
| No assignment of a failing send | The result of a send expected to fail is neither assigned nor asserted to be `nil`. |
| Message keywords start lowercase | Every keyword of a selector starts with a lowercase letter. |
| No get/set accessors | No selector starts with `get` or `set`. |
| No nil precondition | An instance creation precondition does not test whether a parameter is `nil`. |
| No type precondition | An instance creation precondition does not test the type of a parameter. |
| Avoid setters | A method that only assigns its argument to an instance variable is a setter. |
| Method complexity | A method sends no more than 10 messages or so. |
| No unused or write-only temporaries | Every temporary variable is read. |
| Move helper method to the right class | A method referencing no `self`, `super` nor instance variable belongs on the class of one of its parameters. |
| Prefer self / self class over explicit class reference | A class does not name itself in its own methods. |
| Instance creation format | A class-side creation method runs its `self assert…` preconditions and answers `^self new initialize…`. |
| Keyword message send format | A keyword send longer than 80 characters puts the receiver on one line and each keyword on its own tabbed line. |
| and:/or: take blocks | The argument of `and:` and `or:` is a block. |
| ifTrue:ifFalse: over ifFalse:ifTrue: | Conditionals are written in the `ifTrue:ifFalse:` order. |
| and:/or: over & and \| | `and:` and `or:` short-circuit; `&` and `\|` do not. |
| No comparison with true or false | `object ifTrue:`, not `object = true ifTrue:`. |
| Prefer = over == | `==` only when it must be the same object. |
| ifEmpty: over isEmpty ifTrue: | `ifEmpty:` and `ifNotEmpty:` instead of testing `isEmpty` in a conditional. |
| isNil over = nil | `isNil` and `notNil` instead of comparing with `nil`. |
| ifNil: over isNil ifTrue: | `ifNil:` and `ifNotNil:` instead of testing `isNil` in a conditional. |
| isEmpty over size = 0 | `isEmpty` and `notEmpty` instead of comparing `size` with `0`. |
| No extra parenthesis | No parentheses that message precedence makes unnecessary. |

The method heuristics that find their failure in the parse tree highlight it in the code pane.

## The LLM review

*Ask the LLM for a better version* sends the method and a Markdown file of heuristics to the
model and shows its suggested version and rationale. The file is looked up in this order:

1. `<image folder>/smalltalk-mentor-heuristics.md`
2. `~/.smalltalk-mentor/heuristics.md`
3. a small built-in default

This repository's [`smalltalk-mentor-heuristics.md`](smalltalk-mentor-heuristics.md) is the
file the fixed heuristics come from; copy it next to your image to give the model the same
list. Edits take effect on the next review. Heuristics are grouped under `## Category`
headings and each one starts with an `[id]` the model cites in its rationale; the ones under
`## Testing` are only sent when the reviewed method is a test.

## LLM providers and keys

| Provider   | Default model                 | Key file        |
|------------|-------------------------------|-----------------|
| Claude     | `claude-opus-4-8`             | `anthropic.key` |
| ChatGPT    | `gpt-4o`                      | `openai.key`    |
| Deepseek   | `deepseek-chat`               | `deepseek.key`  |
| Nvidia NIM | `meta/llama-3.1-8b-instruct`  | `nvidia.key`    |
| Gemini     | `gemini-2.0-flash`            | `gemini.key`    |

The key file is read at request time from `<image folder>/<key file>` first, then from
`~/.smalltalk-mentor/<key file>`; Claude also accepts the `ANTHROPIC_API_KEY` environment
variable. The key is never stored in the image.

```bash
mkdir -p ~/.smalltalk-mentor
printf '%s' 'sk-ant-...' > ~/.smalltalk-mentor/anthropic.key
chmod 600 ~/.smalltalk-mentor/anthropic.key
```

*Choose LLM provider and model…* and *Choose model effort…* in the Smalltalk Mentor submenu
change the provider, its model id and the reasoning effort (`low` to `max`; Gemini has no
effort setting). Each review window keeps its own provider, so two windows can compare models.

## Tests

`SmalltalkMentorTests.pck.st` has three test classes:

- `SmalltalkMentorFixedHeuristicTest` — the class heuristics and the review trees. No key needed.
- `SmalltalkMentorMethodHeuristicTest` — the method heuristics and what they highlight. No key needed.
- `SmalltalkMentorHeuristicTest` — one test per heuristic of the Markdown file, asking Claude to
  review a method that breaks it (best of three runs). It makes real API calls and needs an
  Anthropic key.

```smalltalk
SmalltalkMentorFixedHeuristicTest suite run.
SmalltalkMentorMethodHeuristicTest suite run.
```

## Design and implementation

- **Heuristics are method objects.** `SmalltalkHeuristic` has two subclasses:
  `SmalltalkClassHeuristic`, created with `for: aClass`, and `SmalltalkMethodHeuristic`,
  created with `for: aCompiledMethod`. Both answer their findings with `value`. A method
  heuristic answers `fails`, and most implement only `findFailingNodes`, the parse-tree nodes
  that break it; `failureRanges` turns those nodes into the source ranges the code pane
  highlights. The parse tree is the non-optimized one, so `ifTrue:`, `ifNil:` and `and:` are
  ordinary message sends.
- **Reviews.** `SmalltalkMentorReview` holds the tree window, the detail pane and the lists of
  heuristics to run; its subclasses `SmalltalkMentorClassReview`, `SmalltalkMentorMethodReview`,
  `SmalltalkMentorMethodCategoryReview` and `SmalltalkMentorClassCategoryReview` build the
  tree roots. Children of a method node are computed when the node is expanded.
- **Conversation.** `SmalltalkMentorConversation` is the LLM panel: the transcript, the original
  and suggested sources and the follow-up input.
- **Providers.** `LLMProvider` and its subclasses (`AnthropicProvider`, `GeminiProvider`,
  `OpenAICompatibleProvider` for ChatGPT, Deepseek and Nvidia NIM) build the request, call
  `curl` through OSProcess and parse the reply. The conversation is provider-neutral.
- **Highlighting.** `SmalltalkMentorHighlightingBrowser` is a `Browser` that carries the
  failure ranges of the selected heuristic, and `SmalltalkMentorFailureTextStyler` paints them
  over the normal syntax highlighting.
- **Entry points.** `SmalltalkMentor` installs the menus and the `cmd+0` shortcut, keeps the
  current provider and language, and builds the LLM prompt from the heuristics file.

---

*Smalltalk Mentor uses Large Language Models; their suggestions are advice, not ground
truth. Read them before accepting.*
