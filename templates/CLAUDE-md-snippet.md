<!--
  Paste this section into your project's (or global) CLAUDE.md.
  See docs/PROTOCOL.md in claude-handoff for the full rationale behind each rule.
-->

## CONTEXT / HANDOFF PROTOCOL (MANDATORY)

- **Never push work into a lossy compaction to "finish" it.** If a context limit
  approaches mid-task, pause, update `HANDOFF.md` with exact current state (what's
  done, what's in progress, the very next command/edit), commit if the work is green,
  then hand off to a fresh session via `HANDOFF.md`.
- **`HANDOFF.md` is a director, not a log.** Target **under 150 lines** (165 hard
  ceiling only when the extra lines are genuinely load-bearing — don't burn a turn
  shaving one or two lines to hit 150 exactly). It is rewritten to reflect current
  truth, not appended to.
- **Completed work moves out, verbatim, to `HANDOFF-COMPLETED.md`** (newest-first
  archive) the moment it's done — leave at most a one-line pointer behind in the
  director. Never read the archive wholesale; search it (`grep`/`rg`) only when a
  specific past diagnosis is needed.
- **Spot-check stale claims before trusting them.** Any bold, emphatic, or
  load-bearing claim in `HANDOFF.md` older than about a week — a "this is closed,"
  "this is fixed," "this is still owed" statement — gets verified against git log,
  the actual code, or a decisions record before being repeated or acted on, not just
  re-read and passed along. Docs describe intent; git describes reality. When they
  disagree, git wins.
- **Every handoff brief ends with a literal, copy-pasteable block:**

  ```text
  ## Start the new window with

  <the exact first message to send — verbatim, nothing to fill in>
  ```

  - Never just "read `HANDOFF.md`." Name the specific phase, plan, slice, file, or
    command to resume from, and any flag that changes what it does.
  - Call out anything that is NOT just reading: a pending decision, an unsettled
    interpretation, a red test, a required setup/environment step.
  - Assume the new window has **zero memory** of this conversation — if a fact only
    exists in the chat, it belongs in `HANDOFF.md`'s body before the block, not in
    the block alone.
  - In chat output, render it as an actual fenced code block — the heading and
    message together, inside the fence — not a rendered markdown heading with prose
    underneath. A heading isn't one clean copy-paste unit; a fence is.
- **Update `HANDOFF.md` continuously**, not just at a deliberate "end of session" —
  after each verified slice, and whenever a decision is made that a future session
  would otherwise have to re-derive. There is no reliable signal for "the user is
  about to close this for a while," so the discipline has to be continuous.
