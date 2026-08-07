# claude-handoff

My AI coding agent once told me nothing had changed — while a whole feature sat
merged and already live. It wasn't lying; it was reading an old handoff doc and
trusting it, the same way I would have. So I built claude-handoff: a tool that
catches that before it happens again, and saves you tokens along the way.

Here's how it catches it: every project gets a `HANDOFF.md`, a short running note on
where things stand. Any claim in it that's bold, load-bearing, or more than about a
week old — a "this is fixed," "this is still broken," "nothing's changed" — gets
checked against git and the actual code before a new session repeats it, instead of
just being read and passed along as fact. Docs describe intent; git describes
reality. When they disagree, git wins.

## The problem this solves

An agent's context doesn't persist between sessions, and compaction is lossy and
unpredictable. The common workarounds all fail the same way eventually:

- **Re-explain everything each session** — expensive, inconsistent, and error-prone.
- **Trust auto-compaction** — lossy, and you don't control what gets dropped.
- **Keep an ad-hoc notes file** — grows without bound until it's too long to be worth
  reading, which defeats the point of having it.

`claude-handoff` is a director-plus-archive pattern that avoids all three — the
verification rule above is the part most versions of this idea skip entirely.

**Not a one-shot handoff snapshot.** Several tools compact *the current conversation*
into a summary for the next agent at the moment you end a session. This is a
different, longer-lived thing: two files checked into the repo, rewritten
continuously across weeks of sessions, with an explicit rule for catching stale
claims before they get repeated — not a snapshot taken once and left to rot.

**Cheap by design.** Reading a 150-line `HANDOFF.md` on a cold start costs a fraction
of what re-explaining context — or riding one session out into auto-compaction —
costs. That's the whole point of keeping the director small instead of letting it
grow into a log.

## What it actually catches

This isn't a linter or a test suite — it doesn't catch code bugs. It catches
*documentation-drift* bugs: a stale or wrong claim about project state, trusted
without verification, that costs real time. Three real examples from the project this
protocol was extracted from:

- A predecessor session asserted, in bold, "no code has changed this milestone" —
  while an entire feature sat merged and deployed in `main`.
- A handoff doc claimed a UI had two dead buttons; true on the day it was written,
  silently stale after a same-day fix nobody caught up the doc on.
- A handoff doc listed a security credential rotation as "still owed" for two weeks
  after it had actually been closed.

Each of these, trusted uncritically, would have cost real time — re-investigating a
non-bug, or repeating a false claim to someone relying on it. The rule that catches
this: **git and code are the ground truth; docs describe intent and can be wrong. Spot-
check anything bold and more than about a week old before repeating or acting on it.**
Without that rule stated explicitly, doc-drift compounds silently across sessions,
because each session trusts the last one's narrative by default.

## The pattern

Two files at the project root, plus a rule for how they're maintained:

- **`HANDOFF.md`** — the *director*. Small on purpose (under 150 lines, 165 hard
  ceiling). Current goal, exact next action, open decisions, load-bearing gotchas.
  Nothing else. Rewritten continuously, not appended to.
- **`HANDOFF-COMPLETED.md`** — the *archive*. Newest-first. Finished work moves here
  **verbatim** from `HANDOFF.md` the moment it's done, leaving at most a one-line
  pointer behind. Never read wholesale — grep it for a specific past fact.
- **The stale-claim rule** — anything bold, emphatic, or load-bearing in `HANDOFF.md`
  that's more than about a week old gets checked against git/code before it's trusted
  again, not just re-read and repeated.
- **The closing block** — every session-ending or handoff-writing response ends with a
  literal, copy-pasteable `## Start the new window with` block naming the *exact* next
  action, not "read HANDOFF.md." If a decision is still pending, a test is red, or an
  environment gate is required, that goes in the block too — a fresh session has zero
  memory of the conversation that produced it.

See [`docs/PROTOCOL.md`](docs/PROTOCOL.md) for the full rule set.

## Installing this in a project

**One step:** install [`skills/handoff-install/SKILL.md`](skills/handoff-install/SKILL.md)
as a Claude Code skill, then run it in your project:

```sh
mkdir -p ~/.claude/skills/handoff-install
cp skills/handoff-install/SKILL.md ~/.claude/skills/handoff-install/SKILL.md
```

(use `.claude/skills/handoff-install/` instead of `~/.claude/skills/` for a
project-local install)

Then say `/handoff-install` (or just ask for it in plain language) in the target
project. It's self-contained — the skill carries every template it writes, so the
target project doesn't need this repo cloned. It writes `HANDOFF.md` and
`HANDOFF-COMPLETED.md` with real values (project name, date, an inferred current-state
summary — not placeholders), appends the `CLAUDE.md` protocol block, and asks before
also installing the optional staleness-nudge `Stop` hook. It won't overwrite anything
that's already installed.

**Manual install**, if you'd rather do it by hand or just see exactly what gets
written:

1. Copy [`templates/HANDOFF.md`](templates/HANDOFF.md) and
   [`templates/HANDOFF-COMPLETED.md`](templates/HANDOFF-COMPLETED.md) into your
   project root and fill in the first real entries.
2. Paste [`templates/CLAUDE-md-snippet.md`](templates/CLAUDE-md-snippet.md) into your
   project's (or global) `CLAUDE.md`.
3. Optionally install [`skills/summarize/SKILL.md`](skills/summarize/SKILL.md) as a
   Claude Code skill — it mechanizes the director/archive rotation and the closing
   block so you don't have to re-derive the rules from prose every session:

   ```sh
   mkdir -p ~/.claude/skills/summarize
   cp skills/summarize/SKILL.md ~/.claude/skills/summarize/SKILL.md
   ```

   (use `.claude/skills/summarize/` instead of `~/.claude/skills/` for a project-local
   install)
4. Optionally install the staleness-nudge hook — a `Stop` hook that flags when
   `HANDOFF.md` looks older than real, uncommitted work in the repo. See
   ["The staleness-nudge hook"](docs/PROTOCOL.md#the-staleness-nudge-hook-optional) in
   `docs/PROTOCOL.md` for what it does and the install steps.

## Stack

None — this is a documentation and prompt-engineering package, not an application.
Plain markdown templates and one Claude Code skill file.

## Working on this project

Claude sessions start by reading `CLAUDE.md` and then `HANDOFF.md`.
`HANDOFF.md` is the live director for current work; finished work moves to
`HANDOFF-COMPLETED.md` — the project dogfoods its own protocol.
