# The claude-handoff protocol

The canonical spec. `README.md` is a summary for a first-time reader; if the two ever
disagree, this file wins.

## The problem

An AI coding agent's context does not persist between sessions, and automatic
compaction is lossy and unpredictable. Most workarounds fail predictably:
re-explaining everything is expensive and inconsistent; trusting compaction loses
detail you don't control; an unstructured notes file grows until it's too long to be
worth reading, which defeats its own purpose.

## The core mechanism: director + archive

Two files at the project root:

### `HANDOFF.md` — the director

- **Small on purpose.** Target under 150 lines; an accepted tolerance of up to 15
  lines over (165 hard ceiling) when the extra lines are genuinely load-bearing. Do
  not spend a turn shaving one or two lines to hit 150 exactly — that's not the point.
- **Rewritten, not appended to.** Every update should leave it reflecting current
  truth, not stack another paragraph on top of stale ones.
- **Contents:** current goal, exact next action, relevant file paths and commands,
  open decisions, and load-bearing gotchas. Nothing else — no planning detail, no
  full history.
- **When a longer effort has multiple phases** that would push it past the budget,
  split into `HANDOFF-1.md`, `HANDOFF-2.md`, … and turn `HANDOFF.md` into a short
  index pointing at the active phase file.

### `HANDOFF-COMPLETED.md` — the archive

- **Newest-first.** Finished work moves here **verbatim** from `HANDOFF.md` the
  moment it's done, leaving at most a one-line pointer behind in the director.
- **Never read wholesale.** A fresh session doesn't load this file to orient itself —
  it searches it (`grep`/`rg`) only when a specific past diagnosis is genuinely
  needed. This is what keeps the director cheap to read: the history isn't gone, it's
  just not in the hot path.

## The rule that actually catches bugs: verify before repeating

A written claim about project state is only as good as the last time it was checked
against reality. Without an explicit rule forcing verification, doc-drift compounds
silently: session 2 trusts session 1's summary, writes session 3's handoff on that
premise, and a wrong claim propagates indefinitely, each repetition making it look
more authoritative.

**The rule:** git and code are the ground truth. Docs describe intent and can be
wrong. When they disagree, git wins. Any claim in `HANDOFF.md` that is bold, emphatic,
or load-bearing — a "this is closed," "this is fixed," "this is still owed" statement
— and more than roughly a week old gets spot-checked against `git log`, the actual
code, or a decisions record before it's repeated or acted on, not just re-read and
passed along.

This is the part most versions of this pattern skip, and it's the part with real,
retrospectively documented payoff: it has caught a predecessor session's false "no
code has changed" claim while a feature sat merged and deployed; a stale "dead UI
buttons" claim after a same-day fix nobody caught the doc up on; and a stale "security
credential still needs rotating" claim two weeks after it was actually closed. Each of
those, trusted uncritically, would have cost real time.

## The closing block

Every session-ending or handoff-writing response ends with a literal, copy-pasteable
block:

```text
## Start the new window with

<the exact first message to send — verbatim, nothing to fill in>
```

Rules for what goes in it:

- **Never just "read `HANDOFF.md`."** Name the specific phase, plan, slice, file, or
  command to resume from, and any flag or argument that changes what it does.
- **Call out anything that is not just reading** — a pending decision, an unsettled
  interpretation, a red test, a required setup step. A fresh session cannot infer
  these; if they're not in the block, they get silently skipped or guessed at.
- **Assume zero memory of the conversation that produced this.** If a fact only
  exists in the chat that just ended, it belongs in `HANDOFF.md`'s body before the
  block is written — not in the block alone, and not left implied.

## When to update `HANDOFF.md`

Continuously, not just at the end. Specifically:

- After completing a verified slice of work.
- Before a context/session limit is reached — don't push into a lossy compaction to
  "finish" something; pause, write the state, hand off cleanly.
- Whenever a decision gets made that a future session would otherwise have to
  re-derive or re-ask about.

The goal is that `HANDOFF.md` is never more than one meaningful step behind reality —
because there is no reliable signal for "the user is about to close this for a week,"
the discipline has to be continuous, not triggered by an explicit goodbye.

## What this protocol does not do

It is not a linter, a test suite, or a substitute for git history. It does not catch
logic bugs in code. It catches a narrower, real, and otherwise-invisible class of
failure: an agent (or a person) confidently acting on a stale or wrong narrative about
where a project stands.
