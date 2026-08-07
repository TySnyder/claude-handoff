---
name: summarize
description: Update the project's HANDOFF.md director (and HANDOFF-COMPLETED.md archive) for a session end or context handoff. Use when the user says /summarize, wants to end a session, hits ~50% context, or needs to hand off to a new chat window.
---

# Summarize Session — HANDOFF Director + Archive Protocol

Implements the [claude-handoff protocol](https://github.com/TySnyder/claude-handoff) —
see that repo's `docs/PROTOCOL.md` for the full rationale. `HANDOFF.md` is a
**director**, not a running log — it stays small and current. Completed work moves
OUT to `HANDOFF-COMPLETED.md`; it never just accumulates at the top of `HANDOFF.md`.

## What to do

### 1. Determine the repo root

- Use the argument path if given, otherwise the current working directory.
- If unclear: `git rev-parse --show-toplevel`.

### 2. Read current state

```bash
cat <repo>/HANDOFF.md 2>/dev/null
cat <repo>/CLAUDE.md 2>/dev/null | head -40   # project-specific overrides to this protocol, if any
git -C <repo> log --oneline -5
git -C <repo> status --short
wc -l <repo>/HANDOFF.md
ls <repo>/HANDOFF-*.md 2>/dev/null            # excluding HANDOFF-COMPLETED.md: phase-index in use?
```

If `HANDOFF.md` is already an index pointing at `HANDOFF-1.md`/`HANDOFF-2.md` etc.
(a multi-phase project past the line budget), update the ACTIVE phase file, not
`HANDOFF.md` itself — see step 6.

### 3. Archive what's already finished

Anything in the current `HANDOFF.md` describing DONE, verified work (not "in
progress," not "next steps") gets cut **verbatim** and moved to the TOP of
`HANDOFF-COMPLETED.md` (newest-first), under a dated heading — `## YYYY-MM-DD — short
title (commit sha)`. Leave at most a one-line pointer behind in `HANDOFF.md`
("detail in `HANDOFF-COMPLETED.md`").

If `HANDOFF-COMPLETED.md` doesn't exist yet, create it with this header:

```markdown
# <Project> — Completed Work Archive

Newest first. Entries move here verbatim from `HANDOFF.md` as each slice or task
finishes. Never read this file wholesale — search it (`rg "<term>" HANDOFF-COMPLETED.md`)
when a specific past diagnosis is needed.
```

### 4. Synthesize what changed THIS session

From the full conversation, capture only what's genuinely new since `HANDOFF.md` was
last updated:

- **What was accomplished** — specific: file paths, commit SHAs, decisions landed.
- **Key decisions and why** — especially anything non-obvious a fresh session would
  otherwise re-litigate.
- **Current state** — working / broken / in progress, verification status (never
  claim a check passed if it was skipped or failed).
- **Exact next action** — concrete enough that a fresh session with zero memory can
  start without asking.
- **Blockers** — anything needing a decision, a red test, a required setup step.

### 5. Rewrite HANDOFF.md as a director, not a log

Target **under 150 lines** (165 hard ceiling, only when the extra lines are
load-bearing). Structure — adapt to what the project already uses:

- One-line "Updated: YYYY-MM-DD" status line with the latest state.
- Current goal / what's blocked.
- Exact next action.
- Relevant file paths, commands, gotchas — only what's load-bearing NOW.
- Decisions that must not be relitigated (keep these; cheap, prevent repeated asks).

If the active work has multiple phases that would push this past 150 lines, split
into `HANDOFF-1.md`, `HANDOFF-2.md`, … and turn `HANDOFF.md` into a short index.

### 6. Close with the mandatory "Start the new window with" block

```markdown
## Start the new window with

<the exact first message to send — verbatim, nothing to fill in>
```

- Never just "read HANDOFF.md." Name the specific phase/plan/slice/file/command to
  resume from, plus any flag that changes behavior.
- Call out anything NOT just reading: a pending decision, an unsettled
  interpretation, a red test, a required setup step.
- Any fact that exists only in this chat must land in `HANDOFF.md`'s body before this
  block — the new window starts with zero memory.
- In chat output, render it as an actual fenced code block — the heading and message
  together, inside the fence — not a rendered markdown heading with prose underneath.
  A heading isn't one clean copy-paste unit; a fence is.

### 7. Write the files, then confirm

Use Write/Edit directly. Tell the user: `HANDOFF.md` updated (and
`HANDOFF-COMPLETED.md` if anything was archived), current line count vs. the
150-line budget, and point at the closing block.

## Rules

- `HANDOFF.md` is a director: small, current, disposable-by-rewrite — not a log.
- Completed work is archived VERBATIM, not summarized further, so the archive stays a
  reliable `rg`-searchable source for past diagnoses.
- Never read `HANDOFF-COMPLETED.md` wholesale to decide what to write.
- Be specific — vague summaries are useless. File paths, exact commands, exact next
  action.
- If the project's own `CLAUDE.md` defines a different convention, it wins — follow
  it and note the deviation to the user.
