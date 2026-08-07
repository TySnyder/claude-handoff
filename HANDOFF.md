# claude-handoff — Handoff Director

Updated: 2026-08-06. Dogfood-tested and the Stop-hook staleness-nudge is built and
verified (detail in `HANDOFF-COMPLETED.md`). Package still not reviewed by a second
pass.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Repo initialized and pushed to `github.com/TySnyder/claude-handoff` (public). Content
written and dogfood-verified, including the new Stop-hook feature (detail in
`HANDOFF-COMPLETED.md`):

- `README.md`, `docs/PROTOCOL.md`, `templates/CLAUDE-md-snippet.md`,
  `templates/HANDOFF.md` / `templates/HANDOFF-COMPLETED.md`,
  `skills/summarize/SKILL.md`, `templates/hooks/check-handoff-staleness.sh`,
  `templates/settings.json-snippet.json`.

**Not done yet:** the Stop-hook is installed into this repo's own
`.claude/settings.json` but not yet confirmed *live* here (settings watcher may not
be watching `.claude/` yet — needs a `/hooks` open or restart, see
`HANDOFF-COMPLETED.md`). No example/worked walkthrough beyond the README's three bug
examples. Package has never had a second-pass review.

## Open decisions

None currently open.

## Next steps

1. Open `/hooks` (or restart) in this repo to confirm the settings watcher picks up
   the newly-created `.claude/settings.json`, then trigger a real Stop with
   uncommitted changes to confirm the hook fires live, not just in the throwaway-repo
   test.
2. Consider a second-pass review of the whole package (README, docs/PROTOCOL.md,
   templates) now that both the core protocol and the hook have been dogfood-tested.

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
