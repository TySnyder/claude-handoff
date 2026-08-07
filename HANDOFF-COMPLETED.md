# claude-handoff — Completed Work Archive

## 2026-08-06 — Stop-hook confirmed live, second-pass fixes, new `handoff-install` skill

- Stop-hook script logic re-verified in an isolated scratch repo (clean-tree no-op,
  stale-vs-`HANDOFF.md` block with correct reason, `stop_hook_active` loop guard) —
  all behave as coded.
- **Live end-to-end proof landed for real, unplanned:** mid-session, with real
  uncommitted changes to this repo, Claude Code's own Stop event fired the hook and
  blocked with the exact reason text — confirms the previously-open "does Claude Code
  actually invoke this live here" question. Not manufactured; happened naturally.
- Second-pass review found and fixed 2 real gaps:
  - `docs/PROTOCOL.md`'s hook-install step pointed at
    `templates/settings.json-snippet.json` for merge guidance that bare JSON can't
    hold (no comments) — rewrote the guidance inline in `PROTOCOL.md`.
  - `HANDOFF.md`'s own closing block referenced a "Stop-hook idea" open decision the
    `Open decisions` section already (correctly) listed as none — stale
    self-contradiction, removed.
- Built `skills/handoff-install/SKILL.md` — one-step, self-contained installer skill
  (no need to clone this repo). Embeds all templates + hook script + settings block
  directly; gathers real values (project name, date, commit sha, an inferred
  current-state sentence) instead of leaving placeholders; checks for and skips
  already-installed pieces (idempotent); asks before installing the optional
  Stop-hook. Dogfood-tested in a throwaway scratch project (`widget-tracker`):
  confirmed real-value substitution, valid JSON output, the hook firing correctly
  end-to-end (including the expected first-Stop false positive right after install,
  before anything's committed — matches the hook's own "false positive, fine to
  dismiss" design), and all 3 re-run/idempotency checks.
- `README.md` rewritten to lead installs with `/handoff-install`; the old 4-step
  manual process kept below as a fallback for people who want to see exactly what
  gets written.
- Researched a naming/functionality question the owner raised ahead of a planned
  Reddit/skills-repo post: `github.com/mattpocock/skills` has skills named `handoff`
  and `claude-handoff` (exact string match on this project's name). Read both
  `SKILL.md`s directly via `gh api` (no code executed). Confirmed no runtime
  slash-command collision (his are `/handoff` / `/claude-handoff`; ours are
  `/summarize` / `/handoff-install`), but flagged real conceptual overlap: his tools
  compact *the current conversation* into a one-shot snapshot (saved to temp dir, or
  spawn a `claude --bg` agent) at the moment a session ends; this project is a
  persistent, continuously-rewritten director+archive pair checked into the repo with
  an explicit stale-claim verification rule. Added a "Not a one-shot handoff
  snapshot" paragraph to `README.md` right after the intro to make the distinction
  explicit for readers.

## 2026-08-06 — Built and verified the Stop-hook staleness-nudge

Owner decision: yes, build it (had been an open decision blocking work). Built:

- `templates/hooks/check-handoff-staleness.sh` — Stop hook script. On session stop,
  checks whether any git-tracked file (excluding the handoff files) has uncommitted
  changes newer than `HANDOFF.md`'s own mtime; if so, emits
  `{"decision": "block", "reason": ...}` to make Claude reconsider before stopping.
  Fails open (no `jq`, not a git repo, no `HANDOFF.md` → silent exit 0). Respects
  `stop_hook_active` so it fires once per turn, not in a loop.
- `templates/settings.json-snippet.json` — the `hooks.Stop` block to merge into a
  project's `.claude/settings.json`.
- `docs/PROTOCOL.md` — new "The staleness-nudge hook (optional)" section explaining
  what it does, why it's shaped that way (fail-open, fires-once, signal-not-verdict),
  and the install steps.
- `README.md` — added as install step 4, linking to the doc section.

Verified by hand (not just read) in a throwaway git repo, using the schema/I-O
contract pulled from the `update-config` skill rather than assumed from memory:
confirmed all 4 cases work — no-drift silent exit 0, drift-detected emits valid
`decision:block` JSON, `stop_hook_active:true` suppresses re-blocking (loop guard),
and the nudge clears once `HANDOFF.md` is actually touched.

Also installed into this repo's own `.claude/settings.json` + `.claude/hooks/` to
dogfood it here going forward (validated with `jq -e`). Caveat: since this repo had
no `.claude/settings.json` before this session, Claude Code's settings watcher likely
isn't watching `.claude/` yet — needs one `/hooks` open (or a restart) before it's
actually live in this repo.

## 2026-08-06 — Dogfood-tested the install path, fixed 3 real gaps it found

Built a throwaway project (`wordcount.py`, a stdlib-only word-frequency CLI) in
`/private/tmp/.../scratchpad/dogfood-test`, installed the templates + `CLAUDE-md-snippet.md`
per the README's literal steps, then ran the packaged `skills/summarize/SKILL.md`
content by hand against real session state (a completed slice, an open decision, a
next step) to verify the director/archive rotation and closing block actually work
when followed literally rather than just read.

Mechanics confirmed working: two-file install was unambiguous, a real first
`HANDOFF.md` stayed at 36 lines (well under the 150 budget), and the archive rotation
+ closing block produced exactly what the docs claim.

Found and fixed 3 real gaps, surfaced by diffing the packaged skill against the
original it was generalized from (still installed globally from the source project):

- `skills/summarize/SKILL.md` step 2 had dropped the `cat CLAUDE.md` override-check and
  the concrete `ls HANDOFF-*.md` phase-index-detection command during generalization —
  restored both (they're generic, not owner-specific).
- Same file's step 3 had dropped the literal header text to use when creating a new
  `HANDOFF-COMPLETED.md` — restored it.
- `templates/HANDOFF-COMPLETED.md`'s placeholder heading didn't match the skill's
  actual heading convention (`... (commit sha)`) — added the `{{COMMIT_SHA}}` token so
  a literal fill-in matches what the skill later expects.
- `README.md` step 3 ("optionally install the skill") never gave the literal
  install command — added a `mkdir`/`cp` snippet for both global and project-local
  install.

Confirmed correct as-is (not a gap): the packaged skill's dropped `afplay`
notification step — that's owner-specific macOS config, rightly generalized away.

Newest first. Entries move here verbatim from `HANDOFF.md` as each slice or task
finishes. Never read this file wholesale — search it (`rg "<term>" HANDOFF-COMPLETED.md`)
when a specific past diagnosis is needed.

---

## 2026-08-06 — Project skeleton + initial package content created

Initialized the repository with `.gitignore`, `README.md`, `CLAUDE.md`, `HANDOFF.md`,
and this archive, then wrote the actual package content in the same session:
`docs/PROTOCOL.md` (the full spec), `templates/CLAUDE-md-snippet.md`,
`templates/HANDOFF.md`, `templates/HANDOFF-COMPLETED.md`, and
`skills/summarize/SKILL.md` (the mechanized version of the director/archive
rotation). Content was ported from a real, working system (not invented) — the
global `CONTEXT / COMPACTION PROTOCOL` section of the source project owner's
`~/.claude/CLAUDE.md`, and the fixed `summarize` skill, both of which had already
caught real documentation-drift bugs in production use. See `HANDOFF.md` for what's
still open.
