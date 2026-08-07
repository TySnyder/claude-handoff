# claude-handoff — Handoff Director

Updated: 2026-08-07 (very late session). Reddit API credential path hit a dead end
(registration wall); pivoted to push-notification reminders + live posting together.
README opener rewritten several times now — owner supplied their own draft, cleaned
up and applied, still pending final approval. Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

`README.md`'s opening paragraph is **approved by the owner** ("i love it") — final
version built from the owner's own draft (they wrote the priority order and key
phrases; cleaned up for grammar/redundancy). Committed this session.

Reddit API automation is a dead end for tonight (Responsible Builder Policy
registration wall, confirmed directly on the account). Local session-only cron can't
span days either. Decided path: a cloud routine that only sends a `PushNotification`
reminder at the target time; actual posting still happens live via ego-browser,
together, like tonight's r/ClaudeCode post. **Not yet created** — paused for the
wording/retitle discussion below.

Reddit does not support editing a post's title after submission (confirmed) — only
body text. Owner decided to delete and repost r/ClaudeCode with the clearer title
("My AI coding agent said nothing had changed — a whole feature was already merged
and live. I built a tool so that doesn't happen again."). **In progress.**

## Open decisions

1. **r/ClaudeAI and Show HN timing.** Renegotiated down from Tue/Wed to sooner —
   landed on r/ClaudeAI Saturday 8/8, Show HN moved off Sunday to "a weekday" per
   engagement concerns, but no exact Show HN date confirmed yet.
2. Whether the "hosted dashboard on top of this" idea (the one plausible profitable
   pivot identified) is worth scoping as a separate project — explicitly deferred,
   not started.

## Next steps

1. Get the owner's explicit approval on the README opener, then commit.
2. Get the owner's decision on delete-and-repost vs. leave the r/ClaudeCode post.
3. Nail down the exact Show HN date, then create the two `PushNotification`-only
   cloud routines (`schedule` skill / `RemoteTrigger`) for r/ClaudeAI and Show HN —
   environment_id `env_01493wyDbAi3zfXPF89TFWUA` (Default), tools needed: just
   `PushNotification`. The routine's job is ONLY to notify — do not give it Reddit
   posting instructions, it has no way to authenticate.
4. Finish the adversarial second-pass review of `README.md` and the `templates/`
   tree specifically for their own standalone issues — still hasn't happened.
5. If editing the Reddit post body is ever needed again: go straight to
   `/api/editusertext` (POST `api_type=json`, `text`, `thing_id`, and the page's own
   `window.r.config.modhash` as `uh`) — the UI paths (new-Reddit's shadow-DOM menu,
   old-Reddit's Save button) both proved unreliable.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule). Three things need the
owner's input before proceeding, all listed under Open decisions above — don't guess
on any of them, especially not deleting/reposting the live Reddit post.
