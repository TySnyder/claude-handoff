# claude-handoff — Completed Work Archive

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
