# claude-handoff — Handoff Director

Updated: 2026-08-07. Live Reddit post now reflects the sound feature and
token-efficiency framing (edited via Reddit's raw API after UI automation proved
unreliable). README's opening paragraph reworked too. Detail in
`HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Repo is polished (topics added), README leads with the token-efficiency hook, and
the Stop-hook really does play a sound (macOS, `afplay`) when it fires — all
committed and pushed. The live post is fully up to date:
<https://www.reddit.com/r/ClaudeCode/comments/1vhsfym/a_handoff_doc_claimed_no_code_has_changed_this/>.
Everything from prior sessions (protocol, installer skill, security hardening,
dogfood + adversarial testing) is done — see archive for detail. Nothing is
mid-edit; no loose ends from this session.

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

1. Monitor the live r/ClaudeCode post for comments — especially "isn't this like X"
   questions (expected; reuse the README's differentiation framing, don't get
   defensive).
2. When the owner gives the go-ahead: post r/ClaudeAI (draft exists — check prior
   chat/the go-to-market artifact for the exact text) and, separately, Show HN once
   r/ClaudeCode has initial signal.
3. Finish the adversarial second-pass review of `README.md` and the `templates/`
   tree specifically for their own standalone issues (still hasn't happened — only
   cross-file consistency has been checked so far, across multiple prior sessions).
4. If editing the Reddit post again is ever needed: the new-UI edit menu isn't
   reliably automatable, and old.reddit's Save button didn't persist changes either.
   The `/api/editusertext` endpoint (POST with `api_type=json`, `text`, `thing_id`,
   and the page's own `window.r.config.modhash` as `uh`) is what actually worked —
   go straight there.

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
