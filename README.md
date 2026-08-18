# Smalltalk Mentor

An AI-assisted code reviewer for **Cuis Smalltalk**. It reviews a method (or a whole
class) against a set of opinionated, project-specific design rules that *you* control,
suggests improvements, and lets you discuss them with a Large Language Model — all from
inside the image, right where you write code.

It is designed for teaching good Smalltalk/OO design: the mentor points out where code
breaks your rules and proposes a fix, and the student applies the refactoring themselves.

## Features

- **Review a method** — press `cmd+0` on a method (in the code pane *or* the message
  list) and the mentor reviews it against your rules, showing the original next to a
  suggested version, with a conversation you can continue.
- **Review a whole class** — press `cmd+0` on a class and get a window that combines:
  - **Static checks** (pure Smalltalk, no LLM, instant): unread/unwritten instance and
    class variables, methods with no senders, messages with no implementer, uncategorized
    methods, unused/write-only temporaries, whether the class is referenced, and shared
    leaf-subclass protocol that should be lifted to the root class.
  - **Per-method LLM reviews** (lazy — one call when you click a method).
- **Review a method category** — press `cmd+0` on a protocol (the method-category list)
  to review every method in it, lazily, one at a time.
- **Review a class category** — press `cmd+0` on a system category (the class-category
  list) to get every class in it, sorted alphabetically; each expands into a full class
  review.
- **Multiple LLM providers** — Claude, ChatGPT, Deepseek, Nvidia NIM, Gemini.
- **Looks like the browser** — the review windows use the system-browser theme, so the
  lists, buttons and code panes match the tools you already use.
- **Your own rules** — a plain Markdown file; edits take effect on the next review, no
  recompile.
- **Answers in Spanish or English**, per conversation.
- **Real browser code panes** — the code you edit inside the mentor behaves like the
  system browser (syntax highlighting, Senders/Implementors, Refactorings…).

## Requirements

- Cuis Smalltalk.
- `curl` on the `PATH` and the `OSProcess` support the mentor uses to reach the APIs
  (the image has no TLS of its own, so requests are made by shelling out to `curl`).
- An API key for at least one provider (see below).

## Packages

The project is split into two Cuis packages (both `.pck.st` files live in this repo):

- **`SmalltalkMentor`** — the tool itself: the model, the LLM providers and the UI. This is
  all you need to *use* the mentor.
- **`SmalltalkMentorTests`** — the test suite (`SmalltalkMentorRuleTest`, one live test per
  rule). It **requires** `SmalltalkMentor` (declared as a prerequisite in the package), so
  `SmalltalkMentor` must be loaded first. It is optional — load it only to run the tests.

Keeping the tests in a separate package means the model has no dependency on the test code.

## Installation

Load **`SmalltalkMentor.pck.st`** (World ▸ Open ▸ Installed Packages ▸ install, or file it
in). On load it self-installs its menus and the `cmd+0` shortcut — that's all you need.

To run the tests as well, load **`SmalltalkMentorTests.pck.st`** *after* `SmalltalkMentor`
(it declares `SmalltalkMentor` as a prerequisite).

To (re)install or remove the menus manually:

```smalltalk
SmalltalkMentor initializeMenues.   "register the menus and cmd+0 shortcuts"
SmalltalkMentor unloadMenues.       "remove them"
```

## Configuring the LLM keys

Each provider reads its API key from a file named `<provider>.key`, tried in this order:

1. `<image directory>/<provider>.key`   — per-image key, checked first
2. `~/.smalltalk-mentor/<provider>.key`  — per-user key, **same file name**
3. (Claude only) the `ANTHROPIC_API_KEY` environment variable

| Provider   | Default model                     | Key file name   |
|------------|-----------------------------------|-----------------|
| Claude     | `claude-opus-4-8`                 | `anthropic.key` |
| ChatGPT    | `gpt-4o`                          | `openai.key`    |
| Deepseek   | `deepseek-chat`                   | `deepseek.key`  |
| Nvidia NIM | `meta/llama-3.1-70b-instruct`     | `nvidia.key`    |
| Gemini     | `gemini-2.0-flash`                | `gemini.key`    |

The same file name is used in both locations (no per-provider directories). Create the key
file for the provider(s) you use. For example, for Claude:

```bash
# per image (recommended if you keep the image in a project folder)
printf '%s' 'sk-ant-...' > "$(dirname <your.image>)/anthropic.key"

# or per user (shared by every image)
mkdir -p ~/.smalltalk-mentor && printf '%s' 'sk-ant-...' > ~/.smalltalk-mentor/anthropic.key && chmod 600 ~/.smalltalk-mentor/anthropic.key
```

> The key file must contain only the key. It is only read at request time and is never
> stored in the image.

You get keys from each vendor's console (e.g. Anthropic Console, OpenAI Platform,
Google AI Studio, Deepseek, Nvidia NIM). Billing must be enabled on the account.

## The rules file

The rules the mentor enforces live in a Markdown file, looked up in this order:

1. `<image directory>/smalltalk-mentor-rules.md`  — per-image rules, checked first
2. `~/.smalltalk-mentor/rules.md`                  — per-user rules
3. a small built-in default

Edit the file and the change takes effect on the **next** review — no recompile, no image
save.

### Format

Rules are grouped under `## Category` headings, and each rule starts with a short
`[id]` name:

```markdown
## Testing
- [testing-for-equality] Prefer `assert: expected equals: actual` over
  `assert: expected = actual` so a failing test shows both values.

## Object design
- [avoid-nil] The use of `nil` should be avoided.
- [replace-if-with-polymorphism] When possible, replace if with polymorphism.
```

When the mentor flags a violation it cites the rule's `[id]` in its explanation. You can
add, remove, or reword rules freely, and add new categories (e.g. `## Collection`,
`## Numbers`). The `[id]`s are also what the test suite targets (see *Tests*).

## Using it from the Smalltalk UI

A **Smalltalk Mentor** submenu is added to all four browser panes — the code pane, the
message list, the method-category (protocol) list and the class-category (system category)
list — as well as the class list (and the method-set / debugger code panes). Each carries
its own `cmd+0` action (*Review this method / method category / class / class category*)
plus *Toggle response language* and *Choose LLM provider and model…*.

### Reviewing one method

Select a method — in the **code pane** or in the browser's **message list** — and press
`cmd+0` (or pick *Ask for a better version* from the Smalltalk Mentor submenu). A review
window opens with:

- a **transcript** of the conversation (starts with the mentor's rationale),
- the **original** method (left, a real browser code pane) and the mentor's **suggested**
  version (right, syntax-highlighted but not copyable — so you type the fix yourself),
- an **input field** to reply / ask follow-ups (press Enter to send),
- an **Idioma** button to switch the answer language for that conversation.

### Reviewing a class

Select a class in the class list and press `cmd+0` (or *Review this class*). A window
opens with a tree on the left and a detail pane on the right:

- **Static rule roots** — one per built-in check, each expanding to the elements that
  fail it. Selecting a failing element opens the relevant code in an editable browser
  pane (the method, or the class definition with the offending variable selected) so you
  can fix it in place.
- **Instance methods / Class methods** — grouped by protocol, then method. Selecting a
  method runs the LLM review for it (lazily, one API call, with an "analyzing…" toast).
- **Right-click** any tree item for *Run again* (re-run that check / re-review) and
  *Browse* (open a system browser on it).
- A **provider button** below the tree switches the LLM for that window's reviews.

### Reviewing a method category

Select a protocol in the **method-category list** (the third browser column) and press
`cmd+0` (or *Review this method category*). You get the same tree/detail window, its list
being the methods of that category — each reviewed lazily by the LLM when you select it.
The virtual `-- all --` category reviews every method of the class.

### Reviewing a class category

Select a system category in the **class-category list** (the first browser column) and
press `cmd+0` (or *Review this class category*). The tree's top level is the classes of
that category, **sorted alphabetically**; expanding a class shows exactly the same subtree
as a class review (its static rule roots and its methods), so each class behaves as a full
class review in place.

### The built-in (non-LLM) checks

These run instantly in Smalltalk when you open a class (or class-category) review:

1. Every **instance variable** is both read and written.
2. Every implemented **message has senders** (test methods and overrides are excluded).
3. Every **message sent has an implementer** (catches typos / missing methods).
4. Every **class variable** is both read and written.
5. Every **method is categorized** (not in *as yet unclassified*).
6. No method declares an **unused or write-only temporary** variable.
7. The **class is referenced** somewhere (flags dead classes with no references and no
   subclasses).
8. When a class has more than one **leaf subclass**, every message that instances of *all*
   those leaf subclasses answer is implemented in the **root** class — concretely or as
   `subclassResponsibility` — so shared protocol is declared in one place.

## Choosing the provider, model and language

From any Smalltalk Mentor submenu:

- **Choose LLM provider and model…** — pick the provider, then its model id.
- **Toggle response language (Spanish/English)**.

Or programmatically:

```smalltalk
SmalltalkMentor current provider: (SmalltalkMentor providers detect: [:p | p name = 'Gemini']).
SmalltalkMentor current model: 'gemini-2.5-pro'.   "sets the current provider's model"
SmalltalkMentor current language: 'English'.
```

Each open review keeps its own snapshot of the provider/model and language, so you can
review the same method with two different providers side by side.

## Tests

The **`SmalltalkMentorTests`** package (load it after `SmalltalkMentor`) has two test
classes:

- **`SmalltalkMentorRuleTest`** — one live test per *LLM* rule. Each asks Claude Opus to
  review a method that violates the rule and checks the fix is applied (or the rule id is
  cited), best-of-3 to absorb the model's non-determinism. Running it makes real API calls,
  so it needs a valid Anthropic key.
- **`SmalltalkMentorFixedRuleTest`** — one test per *built-in (non-LLM)* check. These are
  deterministic and need no API key: each builds a throwaway fixture class that violates a
  rule and asserts the corresponding static check flags it.

```smalltalk
SmalltalkMentorFixedRuleTest run: #testClassMustBeReferenced.   "one static rule, no key"
SmalltalkMentorRuleTest run: #testAndOrTakeBlocks.              "one LLM rule, needs a key"
[ Transcript showln: (SmalltalkMentorRuleTest suite run) printString ] fork.  "all — off the UI process"
```

## Architecture (brief)

- `SmalltalkMentor` — the façade / singleton: entry points (`reviewFromMorph:`,
  `reviewClassFromMorph:`), prompt building, provider and language state, menu install.
- `LLMProvider` and subclasses (`AnthropicProvider`, `OpenAICompatibleProvider`,
  `GeminiProvider`) — one polymorphic hierarchy; each knows its endpoint, auth header,
  request body and response parsing. The conversation is provider-neutral, so switching
  providers just re-sends it.
- `SmalltalkMentorReview` — a single-method review (window or embedded panel).
- `SmalltalkMentorClassReview` — the class-review window: static checks + lazy per-method
  reviews, master/detail with a `HierarchicalListMorph` tree. Its node-builders are
  parameterised by class so the category reviews can reuse them.
  - `SmalltalkMentorMethodCategoryReview` — subclass reviewing one protocol's methods.
  - `SmalltalkMentorClassCategoryReview` — subclass reviewing a system category, each class
    expanding (lazily) into a class-review subtree.
- `SmalltalkMentorReviewWindow` — a `SystemWindow` themed like the browser (`windowColor`
  ↦ `Theme current browser`), used by every review window so the lists, buttons and code
  panes match the system tools.

---

*Smalltalk Mentor uses Large Language Models; its suggestions are advice, not ground
truth — always review them before compiling.*
