# claude-handoff — Handoff Director

Updated: 2026-08-07. Launched, and just added a real (tested) sound-notification
feature to the Stop-hook plus a token-efficiency callout in the README. Mid-edit of
the live Reddit post to reflect both, truthfully. Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Repo is polished (topics added) and the first public post is live:
<https://www.reddit.com/r/ClaudeCode/comments/1vhsfym/a_handoff_doc_claimed_no_code_has_changed_this/>.
The Stop-hook now really does play a sound (macOS, `afplay`, fails silent elsewhere)
at the moment it fires — code committed and tested. **Not yet done:** the live Reddit
post itself still needs its body edited to add the token-efficiency point (reframed
as a question per owner feedback) and the now-true sound-notification mention — was
mid-edit via ego-browser when this session paused. Everything else from prior
sessions (protocol, installer skill, security hardening, dogfood + adversarial
testing) is done and committed — see archive for detail.

## Open decisions

1. **r/ClaudeAI timing.** Owner wants this staggered "a few days" after the
   r/ClaudeCode post, not same-day — no date fixed yet. Don't post it without the
   owner's explicit go-ahead.
2. **Show HN timing.** Plan says wait for r/ClaudeCode to show initial signal first.
   Not posted yet, no date set.
3. Whether the "hosted dashboard on top of this" idea (the one plausible profitable
   pivot identified) is worth scoping as a separate project — explicitly deferred,
   not started.

## Next steps

1. Finish editing the live r/ClaudeCode post body to add the token-efficiency
   question and the sound-notification mention (ego-browser task space was open
   mid-edit; may need to be reopened — `useOrCreateTaskSpace(7)` or check
   `listTaskSpaces()` if that id is gone).
2. Monitor the live r/ClaudeCode post for comments — especially "isn't this like X"
   questions (expected; reuse the README's differentiation framing, don't get
   defensive).
3. When the owner gives the go-ahead: post r/ClaudeAI (draft already exists — ask
   the owner or check prior chat/the go-to-market artifact for the exact text) and,
   separately, Show HN once r/ClaudeCode has initial signal.
4. Finish the adversarial second-pass review of `README.md` and the `templates/`
   tree specifically for their own standalone issues (still hasn't happened — only
   cross-file consistency has been checked so far, across multiple prior sessions).

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule). Check the live Reddit
post for new comments first — that's the most likely thing to need a response. Open
decisions #1 and #2 need the owner's explicit go-ahead before posting anything
else — don't post on their behalf.
