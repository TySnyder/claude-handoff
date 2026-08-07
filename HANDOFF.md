# claude-handoff — Handoff Director

Updated: 2026-08-07 (end of session). Adversarial second-pass review of README.md and
templates/ done (was flagged repeatedly, never done before now) — found and fixed 4
real drift/consistency bugs, committed and pushed as `3f88e20`. Two notify-only
reminder routines still live. r/ClaudeCode post is live and final. Reddit API
credential path abandoned twice. Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

**Two PushNotification-only cloud routines are live** (created via the `schedule`
skill / `RemoteTrigger`, environment_id `env_01DpjECY7qjLQ3kLSJT23LyH` — the earlier
`env_01493wyDbAi3zfXPF89TFWUA` no longer exists, don't reuse it):

- `trig_01UtAbe1SLzZRB5MJk6K1hnj` — fires Sat 2026-08-08 15:00 UTC (9am MDT), reminds to
  post claude-handoff to r/ClaudeAI.
- `trig_017XajQLw2awbrPmvMYrfmNJ` — fires Mon 2026-08-10 15:00 UTC (9am MDT), reminds to
  post claude-handoff to Show HN (date confirmed by owner this session).

Both are notify-only by design — cannot post themselves; actual posting happens live
with the owner via browser automation, same as the r/ClaudeCode post.

**README.md and templates/ adversarial review: done, fixes committed/pushed
(`3f88e20`).** 4 bugs found and fixed; one low-severity issue flagged but left as-is
(the hook's `awk` filename parsing). Detail in `HANDOFF-COMPLETED.md`.

**r/ClaudeCode post: final, do not touch.** Live with the story-opener body edit
applied. 2 substantive comments — reply only, don't delete/repost.

**Reddit API credentials: dropped, don't revisit unprompted.** Hit a Responsible
Builder Policy registration wall twice. Don't attempt this path again unless the owner
raises it fresh.

## Open decisions

Whether the "hosted dashboard on top of claude-handoff" idea (the one plausible
profitable pivot from the go-to-market session) is worth scoping separately —
explicitly deferred, not started.

## Next steps

1. Monitor the r/ClaudeCode post's 2 comments for replies worth engaging with.
2. When the reminder routines fire (8/8, 8/10), actually post — the routines only
   notify.
3. Optional, not scheduled: fix `CLAUDE.md`'s stale "one skill file" count (line 8,
   same bug as the README one just fixed) if it comes up — out of this session's
   file scope so left alone.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule). Nothing is broken or
mid-edit, working tree should be clean at `3f88e20`. No open decisions remain to act
on — the two reminder routines are live (`trig_01UtAbe1SLzZRB5MJk6K1hnj`,
`trig_017XajQLw2awbrPmvMYrfmNJ`) and don't need touching until they fire (8/8, 8/10).
The README/templates adversarial review is done. Nothing urgent is queued — check
Next steps for the small optional items, otherwise ask the owner what's next. Don't
attempt Reddit API posting automation again unless the owner explicitly raises it
fresh.
