# claude-handoff — Handoff Director

Updated: 2026-08-07 (end of session). Two notify-only reminder routines created and
live. README's closing-block bullet strengthened; the closing-block spec now
explicitly requires fencing (was example-only, drifted in practice). All committed
and pushed through `ff34af4`. r/ClaudeCode post is live and final. Reddit API
credential path abandoned twice. Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

**Two PushNotification-only cloud routines are live** (created this session via the
`schedule` skill / `RemoteTrigger`, environment_id `env_01DpjECY7qjLQ3kLSJT23LyH` — the
earlier `env_01493wyDbAi3zfXPF89TFWUA` no longer exists, don't reuse it):

- `trig_01UtAbe1SLzZRB5MJk6K1hnj` — fires Sat 2026-08-08 15:00 UTC (9am MDT), reminds to
  post claude-handoff to r/ClaudeAI.
- `trig_017XajQLw2awbrPmvMYrfmNJ` — fires Mon 2026-08-10 15:00 UTC (9am MDT), reminds to
  post claude-handoff to Show HN (date confirmed by owner this session).

Both are notify-only by design — cannot post themselves; actual posting happens live
with the owner via browser automation, same as the r/ClaudeCode post.

**README.md: final, committed and pushed (`eb124f0`).** The "closing block" bullet
under "The pattern" was strengthened per owner feedback (it already existed in
`docs/PROTOCOL.md` and `templates/CLAUDE-md-snippet.md` too — owner wanted it framed
as more of a differentiator, not added from scratch). 143 lines, within budget.

**Closing-block fencing rule made explicit (`ff34af4`), also applied to global
`~/.claude/CLAUDE.md`.** The rule that the "Start the new window with" block must be
a literal fenced code block in chat output was previously conveyed only by example
formatting; it drifted (chat output started mirroring `HANDOFF.md`'s own heading
style instead of fencing). Now stated explicitly in `docs/PROTOCOL.md`, in
`templates/CLAUDE-md-snippet.md`, and in the owner's global CLAUDE.md (outside this
repo, governs actual behavior across all projects).

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

1. Finish the adversarial second-pass review of `README.md` and `templates/` for
   their own standalone issues — flagged across multiple sessions now, still hasn't
   happened.
2. Monitor the r/ClaudeCode post's 2 comments for replies worth engaging with.
3. When the reminder routines fire (8/8, 8/10), actually post — the routines only
   notify.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule). Nothing is broken or
mid-edit, working tree should be clean at `eb124f0`. No open decisions remain — the
two reminder routines are live (trig_01UtAbe1SLzZRB5MJk6K1hnj, trig_017XajQLw2awbrPmvMYrfmNJ)
and don't need touching until they fire. The next real thread is Next steps #1: the
adversarial second-pass review of `README.md` and `templates/`, flagged repeatedly but
never done. Don't attempt Reddit API posting automation again unless the owner
explicitly raises it fresh.
