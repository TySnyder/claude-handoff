# claude-handoff — Claude Project Rules

A packaged, installable version of the director/archive handoff protocol — templates,
docs, and a Claude Code skill, extracted from a system that's run in production on a
real project for weeks. The goal is a clean, well-explained package other people can
install and actually benefit from, not just a copy-paste of internal files.

**Stack:** none. Plain markdown + one skill file. No build, no test suite, no deploy.

## Start and context discipline

- At the start of every fresh context, read `HANDOFF.md` first.
- Then run `git status --short --branch` and read only the files `HANDOFF.md` names
  for the active task. Load the smallest relevant context; do not reread every
  specification each window.
- Keep this file and `HANDOFF.md` under 150 lines each (165 hard ceiling when the
  extra lines are load-bearing). Do not spend turns shaving lines to hit 150 exactly.
- Never rely on chat memory for a decision, diagnosis, blocker, or unfinished edit.
  If it matters, it is written down.
- **This project dogfoods its own protocol.** If `HANDOFF.md` or the archive
  discipline ever feels wrong to follow here, that's a signal the protocol itself
  needs a fix — not a reason to quietly skip it.

## File roles and authority

- `HANDOFF.md` is the fast current-work director only. Do not duplicate the full
  protocol spec into it — that belongs in `docs/PROTOCOL.md`.
- `HANDOFF-COMPLETED.md` is the newest-first archive. Completed work moves there
  verbatim, leaving at most a one-line summary in the director.
- `templates/` holds what an installer actually copies into their own project —
  keep it generic. Never let project-specific content (this repo's own history,
  the source project's real names) leak into a template.
- `docs/PROTOCOL.md` is the canonical spec. `README.md` summarizes it for a first-time
  reader; if they conflict, `docs/PROTOCOL.md` wins and `README.md` gets fixed.

## Git discipline

- Inspect the working tree before editing; preserve unrelated user changes.
- Commit with explicit per-file pathspecs. Never `git add -A`.
- Commit each completed, verified slice with a focused message.
- Push freely once pushed the first time — this repo is meant to be public and
  installable, unlike most projects' "don't push without asking" default.

## Content rules specific to this package

- Every concrete example (the "what it catches" bug list, any worked sample) must be
  real, sourced from the project this was extracted from — not invented for
  illustration. Fabricated examples undermine the one thing that makes this
  differentiated from a generic template.
- Templates must be genuinely generic — no leftover references to the source
  project's name, decisions, or file paths.
- Prefer showing the mechanism over asserting its value. A reader should be able to
  see the exact rule text, not just a claim that it works.

## Verification and completion

- There's no build/test to run. "Verification" here means: does the template, when
  followed literally in a fresh project, actually produce what the docs claim?
- Never report a section "done" if it still contains a `TODO` or placeholder.
- Update `HANDOFF.md` after meaningful verified work.

## Audible notifications

- Play `afplay /System/Library/Sounds/Glass.aiff` whenever the user's attention is
  needed: a blocking question, an approval checkpoint, a context handoff, or the end
  of a long autonomous run.
