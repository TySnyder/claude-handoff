# claude-handoff — Handoff Director

Updated: 2026-08-06 (first session). Package scaffolded and populated with a first
real draft — not yet reviewed by a second pass or tried on a genuinely fresh project.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Repo initialized and pushed to `github.com/TySnyder/claude-handoff` (public). Content
written this session, all real (ported from the source project, not invented):

- `README.md` — pitch, the three real bug examples, install instructions.
- `docs/PROTOCOL.md` — the canonical spec (director/archive, the stale-claim rule,
  the closing block, when to update).
- `templates/CLAUDE-md-snippet.md` — the pasteable protocol block, generalized (no
  references to the source project or its owner).
- `templates/HANDOFF.md` / `templates/HANDOFF-COMPLETED.md` — blank starters with
  `{{TOKEN}}` placeholders, matching `fresh-project`'s own templating convention.
- `skills/summarize/SKILL.md` — the mechanized version of the rotation, generalized
  from the fixed skill in the source project.

**Not done yet:** no `.claude/settings.json` hook template (the "staleness nudge"
idea — a Stop hook that flags when `HANDOFF.md` is older than the newest changed
file — was floated as a real differentiator but never built, here or in the source
project). No example/worked walkthrough beyond the README's three bug examples. Never
installed into a genuinely fresh project to confirm the templates actually work when
followed literally, rather than just read.

## Open decisions

- Whether to build the Stop-hook staleness-nudge as a real feature of this package
  (it would be a genuine differentiator vs. the passive "memory bank" pattern this
  competes with) — floated, not decided.

## Next steps

1. Decide on and possibly build the Stop-hook staleness-nudge (`.claude/settings.json`
   template + short doc in `docs/PROTOCOL.md`).
2. Dogfood-test: install `templates/` + `skills/summarize/` into one genuinely new,
   unrelated project and confirm the instructions are followable without this
   session's context filling in gaps.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule — don't just trust this
paragraph). No decision is blocking; pick up at "Next steps" above. The Stop-hook idea
(open decision above) needs a yes/no from the owner before building — ask if it comes
up naturally, don't assume.
