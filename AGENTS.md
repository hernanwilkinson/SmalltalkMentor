# AGENTS.md — context for AI coding agents

This file exists so a new agent session has enough context to pick up work on
SmalltalkMentor without re-deriving it from scratch. It's a living document —
keep it updated as the project evolves; don't let it go stale.

## What this project is

An AI-assisted code reviewer for **Cuis Smalltalk**. It reviews a method or a
whole class against a Markdown rules file, suggests fixes via an LLM, and lets
the student discuss/apply them from inside the image. See `README.md` for the
user-facing description, features, and usage — read that first.

## How the code actually lives and gets edited

There is **no local checkout of the source as plain `.st` files** that you
edit with a text editor. The real, live code lives inside a running Cuis
image, reached through the **Cuis MCP server** (tools prefixed
`mcp__Cuis__smalltalk_*`):

- `smalltalk_evaluate` — run arbitrary Smalltalk (inspect classes, run
  queries, save the package, etc).
- `smalltalk_define_method` / `smalltalk_define_class` — the way to actually
  change code. Always pass the **full method/class source**, not a diff.
- `smalltalk_method_source` — read one method's source.

Workflow for any code change: inspect the relevant classes/methods via
`smalltalk_evaluate` (e.g. `ClassName selectors`, `ClassName
sourceCodeAt: #foo`), make the change with `smalltalk_define_method`, then
**verify by evaluating** (build small instances, call the new method, check
output) before considering it done — there's no compiler/test run outside the
image to catch mistakes.

This repo holds the **exported** `.pck.st` files — the
on-disk snapshot of the in-image package. The image and this repo can drift:
always check both when starting work (`CodePackage installedPackages` for the
in-image state vs. `git log` here for the last exported/committed state).

## Cuis packaging: `CodePackage` / `Feature`, not Monticello

This image uses Cuis's native package system, not Monticello. Key API:

```smalltalk
"Find the package object for this project:"
CodePackage installedPackages detect: [:p | p packageName = 'SmalltalkMentor'].

"Where it saves to on disk, and whether it has unsaved changes:"
p fullFileName.          "-> full path to the .pck.st file"
p hasUnsavedChanges.

"Write it out (this is the 'export a new version' step):"
p save.
```

**Version/revision pitfall (bit us once — read this before bumping a
version):** `CodePackage>>hasUnsavedChanges:` auto-increments the package's
`Feature` **revision** every time the dirty flag flips `false → true`. That
means:

- Editing methods after a fresh `save` bumps the revision *automatically*,
  even if you never call anything version-related yourself.
- Calling `p description: '...'` after a `save` **also** re-dirties the
  package and triggers another silent bump — don't call it right before
  `save` expecting a specific version number.
- `save` itself does **not** bump anything — it just writes the current
  state.

So: **don't try to increment the version by calling `Feature>>newRevision`
yourself** — it's already happening implicitly, often more than once. If you
need an exact version number (e.g. "keep it at 1.22", matching a specific
increment over the last git-committed version), set it explicitly right
before the final `save`:

```smalltalk
| p feature |
p := CodePackage installedPackages detect: [:x | x packageName = 'SmalltalkMentor'].
feature := p featureSpec provides.
feature instVarNamed: #version put: 1.
feature instVarNamed: #revision put: 22.
p save.
```

Convention observed in this project so far: bump exactly **+1 revision**
over the version in the last git commit of the `.pck.st` file, regardless of
how many intermediate edits/saves happened in the image session — i.e. one
new package version per logical change being exported, not one per `save`
call. Check `git show HEAD:SmalltalkMentor.pck.st | head -3` (or the
equivalent for the tests package) to see the last committed version before
deciding the new one.

**Cleanup after every `save`:** Cuis's `autoNumberPackages` preference backs
up the previous file as `SmalltalkMentor-.pck.NNN.st` on every save. These
are pure local clutter, not meant for git (there's no `.gitignore` in this
repo yet) — delete them after saving, before committing:

```bash
rm SmalltalkMentor-.pck.*.st SmalltalkMentorTests-.pck.*.st 2>/dev/null
```

## Two packages, one dependency direction

- **`SmalltalkMentor.pck.st`** — the tool itself. This is what you edit for
  almost every feature request.
- **`SmalltalkMentorTests.pck.st`** — `SmalltalkMentorRuleTest`, one live
  test per rule, makes real Anthropic API calls. Declares `SmalltalkMentor`
  as a prerequisite; never the other way around. Keep it that way — the
  model itself should have no dependency on test code.

## External dependency: OSProcess

`SmalltalkMentor` shells out to `curl` (the image has no TLS) via
`OSProcess`, which is **not bundled in this repo** and must be loaded
manually from <https://github.com/Cuis-Smalltalk/OSProcess> before
`SmalltalkMentor`. This is documented in the README's *Requirements* and
*Installation* sections — keep both in sync if this ever changes (e.g. if
OSProcess gets vendored in, or a pure-Smalltalk HTTP path is added).

## Architecture (see README's own "Architecture (brief)" section too)

- `SmalltalkMentor` — façade/singleton: entry points (`reviewFromMorph:`,
  `reviewClassFromMorph:`), prompt building, current provider/language state,
  menu install/uninstall.
- `LLMProvider` (abstract) + `AnthropicProvider`, `OpenAICompatibleProvider`,
  `GeminiProvider` — one polymorphic hierarchy. Each subclass owns its
  endpoint, auth header, request-body shape and response parsing
  (`bodyForMessages:`, `authCurlArgs`, `endpoint`, `extractTextFrom:`).
  Conversations are provider-neutral (`{role, content}` messages), so
  switching providers mid-conversation just re-sends the same history.
  - **Per-provider hook pattern**: when a feature doesn't map the same way
    across providers (e.g. `effort`), add a `subclassResponsibility` hook on
    `LLMProvider` and let each subclass implement or no-op it — don't force
    one shared implementation. `addEffortTo:` / `supportsEffort` are the
    existing example; follow that shape for the next provider-specific
    knob instead of inventing a different pattern.
- `SmalltalkMentorReview` — single-method review window/panel.
- `SmalltalkMentorClassReview` — class-review window: static (non-LLM)
  checks + lazy per-method LLM reviews, tree + detail pane.

## Git conventions observed in this project

- One branch per logical change, branched from `main`
  (`feature/...` for features, `chore/...` for docs/deps housekeeping) —
  don't stack unrelated work on top of an existing feature branch.
- Ask before committing and before pushing — they're separate steps the user
  confirms individually, don't assume one implies the other.
- Commit messages: short imperative summary line, blank line, a short body
  explaining the *why*/shape of the change when it's not obvious from the
  diff. This repo's commits are `Co-Authored-By: Claude <...>`-tagged; keep
  doing that.
