# claude-handoff — Handoff Director

Updated: 2026-08-07 (very late session, still going). r/ClaudeCode post stays as-is —
delete-and-repost was reversed after finding real comments already on it. README
rebuilt around a concrete story opener (uncommitted). Reddit API credentials
abandoned a second time. Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

**r/ClaudeCode post: final, not being touched.** It has 2 substantive comments now —
do not delete or repost it. If anything, it's a candidate for replying to those
comments, not editing.

**README.md — approved and committed this session.** Opening two paragraphs lead
with the concrete story (mirrors the Reddit post's opening line) and then explain the
stale-claim detection mechanism plainly. The paragraph-2/"problem this solves"
redundancy is fixed — the latter no longer restates the rule, just names the
director-plus-archive pattern and points back to it.

**Reddit post body edit — done.** Prepended the "My AI coding agent said nothing had
changed..." line as the body's opening paragraph, smoothed the one transition
sentence it made redundant, verified twice via fresh reloads. Live and correct.

**Reddit API credentials — dropped, don't revisit unprompted.** Tried twice tonight
(once hit a Responsible Builder Policy registration wall, owner then did some
additional signup and tried again with the same redirect URI — still didn't work).
Owner explicitly deprioritized this both times. If it comes up again, the
push-notification-only cloud routine plan (see prior archive entry) is still the
right fallback design — don't re-attempt real API posting automation without the
owner raising it fresh.

## Open decisions

1. **r/ClaudeAI and Show HN timing.** Landed on r/ClaudeAI Saturday 8/8, Show HN
   moved off Sunday to "a weekday" — no exact Show HN date confirmed yet. Not
   actioned tonight; got sidetracked by the Reddit post/README wordsmithing.
2. Whether the "hosted dashboard on top of this" idea (the one plausible profitable
   pivot identified) is worth scoping as a separate project — explicitly deferred,
   not started.

## Next steps

1. Nail down the exact Show HN date, then set up the two `PushNotification`-only
   cloud routines for r/ClaudeAI and Show HN (environment_id
   `env_01493wyDbAi3zfXPF89TFWUA`) — notify-only, no posting automation.
2. Finish the adversarial second-pass review of `README.md` and `templates/` for
   their own standalone issues — still hasn't happened across multiple sessions now.

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule — this file has drifted
fast tonight, verify before trusting it). The Reddit post is done; the README rewrite
is the open thread — get the owner's read on it before touching anything else.
