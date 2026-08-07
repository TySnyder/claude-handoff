# claude-handoff — Handoff Director

Updated: 2026-08-06. Stop-hook confirmed live (fired for real this session). New
`skills/handoff-install/SKILL.md` built and dogfood-tested in a scratch project
(detail in `HANDOFF-COMPLETED.md`). Not yet committed.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Repo pushed to `github.com/TySnyder/claude-handoff` (public). Uncommitted right now:
`HANDOFF.md`, `README.md`, `docs/PROTOCOL.md` (modified), `skills/handoff-install/`
(new, untracked). Everything else — `docs/PROTOCOL.md`'s core spec,
`templates/CLAUDE-md-snippet.md`, `templates/HANDOFF.md` /
`templates/HANDOFF-COMPLETED.md`, `skills/summarize/SKILL.md`, the Stop-hook script +
settings snippet — already committed and dogfood-verified.

`skills/handoff-install/SKILL.md` has only been *simulated by hand* (walked through
its own instructions against a throwaway scratch repo) — it has never actually been
installed as a real Claude Code skill and invoked via `/handoff-install`.

## Open decisions

None currently open.

## Next steps

1. Commit this session's changes (`HANDOFF.md`, `README.md`, `docs/PROTOCOL.md`,
   `skills/handoff-install/`), then push.
2. Before publishing: actually install `skills/handoff-install/SKILL.md` as a real
   skill (`~/.claude/skills/handoff-install/` or project-local) and run
   `/handoff-install` for real against a throwaway project — the hand-simulation was
   thorough but isn't the same as the real skill-invocation path.
3. Finish the adversarial second-pass review: `README.md` (materially changed this
   session) and the `templates/` tree still haven't been re-read specifically hunting
   for their own standalone issues, only checked for consistency so far.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule — don't just trust this
paragraph). No decision is blocking; pick up at "Next steps" above — likely starting
with committing the uncommitted work.
