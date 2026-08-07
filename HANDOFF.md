# claude-handoff — Handoff Director

Updated: 2026-08-07. Live Reddit post now reflects the sound feature and
token-efficiency framing (edited via Reddit's raw API after UI automation proved
unreliable). README's opening paragraph reworked twice (once for the hook, once
because the first version read as jargon-stuffed) — currently uncommitted. Mid-setup
on Reddit API credentials for scheduled autonomous posting. Detail in
`HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Repo is polished (topics added), and the Stop-hook really does play a sound (macOS,
`afplay`) when it fires — committed and pushed. The live post is up to date:
<https://www.reddit.com/r/ClaudeCode/comments/1vhsfym/a_handoff_doc_claimed_no_code_has_changed_this/>.
`README.md`'s opening paragraph is reworded again (uncommitted right now — plain two
sentences instead of one jargon-dense one, per owner feedback that "opinionated
protocol" / "cheap enough to read cold" read badly) but not yet confirmed as good by
the owner.

Owner asked to schedule the r/ClaudeAI and Show HN posts autonomously. Discovered
scheduled cloud agents can't do this as-is — they run sandboxed with no access to
the local ego-browser session Reddit posting relies on, and there's no Reddit API
credential or MCP connector configured. Owner chose to set up real Reddit API
(OAuth "script" app) credentials instead. **In progress:** walked the owner through
creating the app at reddit.com/prefs/apps; waiting on them to paste back the client
ID and secret before generating an OAuth authorization link (to get a refresh token
without ever handling their password).

Everything else from prior sessions (protocol, installer skill, security hardening,
dogfood + adversarial testing) is done — see archive for detail.

## Open decisions

1. **r/ClaudeAI and Show HN timing — recommended, not yet confirmed by owner.**
   r/ClaudeAI: Tue 2026-08-11 ~9am ET. Show HN: Wed 2026-08-12 ~8am PT (a day apart
   on purpose). Owner wants these posted autonomously via a scheduled cloud agent,
   pending the Reddit API credential setup below.
2. Whether the "hosted dashboard on top of this" idea (the one plausible profitable
   pivot identified) is worth scoping as a separate project — explicitly deferred,
   not started.

## Next steps

1. **Resume Reddit API credential setup** (see Current state) — once the owner
   pastes the client ID/secret from their new `claude-handoff-poster` script app,
   generate a Reddit OAuth authorization URL (scopes: `submit`, `edit`, `identity`;
   `duration=permanent`), have the owner click it and paste back the `code` param
   from the (broken, that's fine) `localhost:8080` redirect, then exchange it for a
   refresh token. Only after that: create the two scheduled cloud routines
   (`schedule` skill / `RemoteTrigger`) for the dates above, with self-contained
   prompts (repo URL, the exact post text, the credentials) since cloud agents start
   with zero context.
2. Get the owner's sign-off on the reworded README opening paragraph (currently
   uncommitted) before committing.
3. Monitor the live r/ClaudeCode post for comments — especially "isn't this like X"
   questions (expected; reuse the README's differentiation framing, don't get
   defensive).
4. Finish the adversarial second-pass review of `README.md` and the `templates/`
   tree specifically for their own standalone issues (still hasn't happened — only
   cross-file consistency has been checked so far, across multiple prior sessions).
5. If editing the Reddit post again is ever needed: the new-UI edit menu isn't
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
post for new comments first. If the owner has pasted Reddit app credentials since
this was written, resume the OAuth setup at Next steps #1 — don't create any
scheduled routine or post anything without that flow actually completing first.
