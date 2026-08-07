# claude-handoff — Handoff Director

Updated: 2026-08-07 (end of a very long session). README opener finalized and
committed (`6de48de`). r/ClaudeCode post is live and final. Reddit API credential
path abandoned twice. Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Everything from tonight is committed and pushed — working tree is clean. Nothing is
mid-edit.

**r/ClaudeCode post: final, do not touch.** Live with the story-opener body edit
applied. It has 2 substantive comments — don't delete/repost; a reply is the only
reasonable future action, not an edit.

**README.md: final, committed.** Opens with a concrete story (mirrors the Reddit
post), then the owner's own content on token-savings/auto-compaction/staying-in-sync
(paraphrased version, owner-confirmed as final — don't re-litigate wording), then a
plain-language explanation of the stale-claim detection mechanism. The earlier
paragraph-2/"problem this solves" redundancy is fixed.

**Reddit API credentials: dropped, don't revisit unprompted.** Hit a Responsible
Builder Policy registration wall twice, even after the owner completed additional
Reddit signup steps. If scheduling comes up again, the fallback design is a cloud
routine that only fires a `PushNotification` reminder (no browser/API access needed
for that) — actual posting still happens live together via ego-browser, same as
tonight's post.

## Open decisions

1. **Show HN date.** r/ClaudeAI is set for Saturday 8/8. Show HN was moved off
   Sunday for engagement reasons but never got a firm date — needs the owner's input.
2. Whether the "hosted dashboard on top of claude-handoff" idea (the one plausible
   profitable pivot from the go-to-market session) is worth scoping separately —
   explicitly deferred, not started.

## Next steps

1. Get the owner's Show HN date, then set up two `PushNotification`-only cloud
   routines (`schedule` skill / `RemoteTrigger`, environment_id
   `env_01493wyDbAi3zfXPF89TFWUA`) for r/ClaudeAI (Sat 8/8) and Show HN — notify-only,
   the routine cannot post itself.
2. Finish the adversarial second-pass review of `README.md` and `templates/` for
   their own standalone issues — flagged across multiple sessions now, still hasn't
   happened.
3. Monitor the r/ClaudeCode post's 2 comments for replies worth engaging with.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule). Nothing is broken or
mid-edit — the only real thread is open decision #1 (Show HN date): ask the owner for
it, then set up the two notification-only routines per Next steps #1. Don't attempt
Reddit API posting automation again unless the owner explicitly raises it fresh.
