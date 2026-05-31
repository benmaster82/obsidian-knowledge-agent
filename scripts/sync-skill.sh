#!/usr/bin/env bash
set -euo pipefail

# Keep the Claude Code skill's bundled reference docs in sync with the
# canonical instruction modules in .agents/. Run this after editing .agents/.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cp "$ROOT/.agents/"*.md "$ROOT/skills/obsidian-knowledge/references/"
echo "Synced .agents/ -> skills/obsidian-knowledge/references/"
