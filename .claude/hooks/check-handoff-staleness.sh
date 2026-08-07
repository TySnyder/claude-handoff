#!/usr/bin/env bash
# Stop hook: nudge to update HANDOFF.md when it looks stale relative to real,
# uncommitted work in the repo. Part of https://github.com/TySnyder/claude-handoff
# — see docs/PROTOCOL.md for the protocol this mechanizes.
#
# Fires once per Stop (guarded by stop_hook_active) so it can't loop forever.
# Fails open on anything unexpected (no jq, not a git repo, no HANDOFF.md).
# Plays a sound on macOS when it fires, so the nudge doesn't rely on watching the
# terminal; silently skipped on any other platform or if afplay is unavailable.

command -v jq >/dev/null 2>&1 || exit 0

input=$(cat)
[ "$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)" = "true" ] && exit 0

repo=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
handoff="$repo/HANDOFF.md"
[ -f "$handoff" ] || exit 0
cd "$repo" || exit 0

# Tracked files with real uncommitted changes, excluding the handoff pair/phase files.
changed=$(git status --porcelain -- . ':!HANDOFF.md' ':!HANDOFF-COMPLETED.md' ':!HANDOFF-*.md' 2>/dev/null | awk '{print $2}')
[ -z "$changed" ] && exit 0

mtime() { stat -f %m "$1" 2>/dev/null || stat -c %Y "$1" 2>/dev/null; }

handoff_mtime=$(mtime "$handoff")
newest=0
while IFS= read -r f; do
  [ -f "$f" ] || continue
  m=$(mtime "$f")
  [ -n "$m" ] && [ "$m" -gt "$newest" ] && newest=$m
done <<< "$changed"

if [ "${newest:-0}" -gt "${handoff_mtime:-0}" ]; then
  command -v afplay >/dev/null 2>&1 && afplay /System/Library/Sounds/Glass.aiff >/dev/null 2>&1 &
  reason="HANDOFF.md looks stale: other tracked files changed more recently than it was last updated. If real progress happened this session, update HANDOFF.md's Current state / Next steps before stopping. If there's nothing worth recording yet, this is a false positive — go ahead and stop."
  jq -n --arg reason "$reason" '{decision: "block", reason: $reason}'
fi
exit 0
