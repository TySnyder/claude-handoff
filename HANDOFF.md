# claude-handoff — Handoff Director

Updated: 2026-08-06. `handoff-install` is security-hardened, adversarially tested, and
verified via a real `Skill`-tool invocation. Go-to-market plan delivered (published
Artifact). Detail in `HANDOFF-COMPLETED.md`.

## Start here

Read `CLAUDE.md`, then this file, then run `git log --oneline -8` and
`git status --short`.

## Current state

Everything is built, dogfood-tested, security-tested, and (as of this session)
`skills/handoff-install/SKILL.md` is installed for real at
`~/.claude/skills/handoff-install/` — confirmed live via an actual `/handoff-install`
invocation, not just simulation. Nothing is publicly announced yet; that's a pending
owner decision, not a build task.

## Open decisions

1. **Publish timing/channel.** The go-to-market plan (Artifact from this session —
   ask the user for the link if it's not visible in this chat) drafts a Reddit post
   and a Show HN post and recommends not posting both same-day. Owner needs to decide
   when to actually post, not Claude.
2. Whether the "hosted dashboard on top of this" idea (the one plausible profitable
   pivot identified) is worth scoping as a separate project — explicitly deferred,
   not started.

## Next steps

1. Owner reviews the go-to-market plan artifact and decides go/no-go + timing on
   posting.
2. Finish the adversarial second-pass review of `README.md` and the `templates/`
   tree specifically for their own standalone issues (still hasn't happened — only
   cross-file consistency has been checked so far, across two prior sessions).
3. Commit `skills/handoff-install/SKILL.md`'s security-hardening edit (currently
   uncommitted — see `git status`).

---

Completed work moves to `HANDOFF-COMPLETED.md` (newest first) as each slice finishes.
Keep this file under 150 lines.

## Start the new window with

Read `CLAUDE.md` and `HANDOFF.md` in `/Users/ts/github-sites/claude-handoff` in full,
then run `git log --oneline -8` and `git status --short` to confirm the repo matches
this file's claims (per this project's own stale-claim rule). No decision is
blocking Claude specifically, but open decision #1 above needs the owner's input
before any public post goes out — don't post on their behalf. Pick up at "Next steps."
