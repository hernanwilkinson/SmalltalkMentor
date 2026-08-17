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
    class variables, methods with no senders, messages with no implementer, and
    uncategorized methods.
  - **Per-method LLM reviews** (lazy — one call when you click a method).
- **Multiple LLM providers** — Claude, ChatGPT, Deepseek, Nvidia NIM, Gemini.
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

## Installation

Load the package `SmalltalkMentor.pck.st` (World ▸ Open ▸ Installed Packages ▸ install,
or file it in). On load it self-installs its menus and the `cmd+0` shortcut.

To (re)install or remove the menus manually:

```smalltalk
SmalltalkMentor current install.
SmalltalkMentor current uninstall.
```

## Configuring the LLM keys

Each provider reads its API key from a file, tried in this order:

1. `<image directory>/<provider>.key`  — per-image key, checked first
2. a per-user key file in your home directory
3. (Claude only) the `ANTHROPIC_API_KEY` environment variable

| Provider   | Default model                     | Image-dir key    | Home key             |
|------------|-----------------------------------|------------------|----------------------|
| Claude     | `claude-opus-4-8`                 | `anthropic.key`  | `~/.anthropic/key`   |
| ChatGPT    | `gpt-4o`                          | `openai.key`     | `~/.openai/key`      |
| Deepseek   | `deepseek-chat`                   | `deepseek.key`   | `~/.deepseek/key`    |
| Nvidia NIM | `meta/llama-3.1-70b-instruct`     | `nvidia.key`     | `~/.nvidia/key`      |
| Gemini     | `gemini-2.0-flash`                | `gemini.key`     | `~/.gemini/key`      |

Create the key file for the provider(s) you use. For example, for Claude:

```bash
# per image (recommended if you keep the image in a project folder)
printf '%s' 'sk-ant-...' > "$(dirname <your.image>)/anthropic.key"

# or per user
mkdir -p ~/.anthropic && printf '%s' 'sk-ant-...' > ~/.anthropic/key && chmod 600 ~/.anthropic/key
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

A **Smalltalk Mentor** submenu is added to the code pane, the message list, and the class
list of the browser (and the method-set / debugger code panes).

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

### The built-in (non-LLM) checks

These run instantly in Smalltalk when you open a class review:

1. Every **instance variable** is both read and written.
2. Every implemented **message has senders** (test methods and overrides are excluded).
3. Every **message sent has an implementer** (catches typos / missing methods).
4. Every **class variable** is both read and written.
5. Every **method is categorized** (not in *as yet unclassified*).

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

`SmalltalkMentorRuleTest` has one live test per rule. Each asks Claude Opus to review a
method that violates the rule and checks the fix is applied (or the rule id is cited),
best-of-3 to absorb the model's non-determinism. Running the suite makes real API calls,
so it needs a valid Anthropic key.

```smalltalk
SmalltalkMentorRuleTest run: #testAndOrTakeBlocks.        "one rule"
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
  reviews, master/detail with a `HierarchicalListMorph` tree.

---

*Smalltalk Mentor uses Large Language Models; its suggestions are advice, not ground
truth — always review them before compiling.*
