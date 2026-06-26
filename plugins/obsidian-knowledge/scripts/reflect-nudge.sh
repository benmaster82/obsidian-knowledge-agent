#!/usr/bin/env bash
# Stop hook: gently remind the agent to reflect when notes changed this session but
# the learning journal is untouched. Emitted as Stop `additionalContext` — non-blocking
# model-visible feedback (NOT decision:block, so it never forces continuation). The
# model can act on it (e.g. offer /obsidian-knowledge:reflect). Self-limiting: once
# the journal is updated (tracked + changed), the reminder goes quiet.
set -euo pipefail

PROJECT="${CLAUDE_PROJECT_DIR:-$PWD}"
cd "$PROJECT" 2>/dev/null || exit 0

# Only act inside a git repo that has been set up as an OKA vault.
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
[ -d ".agents/learned" ] || exit 0

# One status scan, reused for both checks. --untracked-files=all expands brand-new
# untracked folders into individual files (else git collapses them to "?? dir/" and
# the .md match below would miss every note in a new folder — the common first run).
STATUS="$(git status --porcelain --untracked-files=all 2>/dev/null || true)"
[ -n "$STATUS" ] || exit 0

# A changed markdown note outside .agents/learned/?  The learned/ exclusion is anchored
# to the path field (2 status chars + a space, then an optional quote) so a note that
# merely mentions that string in its name isn't excluded. git quotes paths containing
# spaces, so tolerate a closing quote / rename arrow after the .md.
if ! printf '%s\n' "$STATUS" \
     | grep -Ev '^.. "?\.agents/learned/' \
     | grep -Eq '\.md("| ->|$)'; then
  exit 0
fi

# Only nudge in an ESTABLISHED vault — one whose journal has been committed at least once.
# A never-committed journal (the state straight after /setup, before the scaffold is
# committed) means the vault isn't set up yet and there is nothing to reflect on; nagging
# then is just noise on every Stop. This also stays quiet right after an uncommitted
# /reflect that seeded the journal — the user already reflected.
git ls-files --error-unmatch .agents/learned/journal.md >/dev/null 2>&1 || exit 0

# Reflection already recorded this session? The journal is tracked (guaranteed above), so it
# appears in STATUS only when modified this session -> reflection recorded -> stay quiet. A
# tracked-but-unchanged journal is absent from STATUS (JLINE empty) -> not yet reflected.
JLINE="$(printf '%s\n' "$STATUS" | grep -E '^.. "?\.agents/learned/journal\.md("| ->|$)' | head -1 || true)"
case "$JLINE" in
  "") : ;;       # tracked + unchanged -> not yet reflected; allow the nudge
  *) exit 0 ;;   # tracked + changed -> reflection recorded; stay quiet
esac

MSG="obsidian-knowledge: notes changed this session but the learning journal is untouched. If anything here is worth remembering for next time, consider offering to run /obsidian-knowledge:reflect — optional."
printf '{"hookSpecificOutput": {"hookEventName": "Stop", "additionalContext": "%s"}}\n' "$MSG"
