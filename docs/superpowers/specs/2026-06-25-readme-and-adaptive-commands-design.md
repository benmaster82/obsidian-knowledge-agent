# README rewrite + adaptive commands — design

**Date:** 2026-06-25
**Status:** approved, ready to implement

## Goal

Adopt the README *style* of `DietrichGebert/ponytail` — clean, bold, confident,
nicely designed — for Obsidian Knowledge Agent, and make the command surface
**quick, smooth, and adaptive**. Flagship behavior change: `setup` detects what's
already in the folder and adapts (an existing vault is adopted, not re-scaffolded).

## Decisions (locked with user)

- **Voice:** bold product voice, *no invented persona*. Confident and clean; lead
  with the self-evolving differentiator. (Not the ponytail-style character.)
- **Scope:** README rewrite **and** adaptive command behavior.
- **Excluded** (explicit): benchmark/numbers tables, sponsors, star-history, ad copy.
- **Kept:** Codex Lab branding + hero logo + badges, self-evolution section,
  works-with-any-agent install, repo layout, customize, contributing, license.

## Part 1 — README (full rewrite of `README.md`)

Borrow ponytail's skeleton, drop its ad/numbers sections. New order:

1. **Hero** (centered): existing logo + title.
   Tagline: **"Talk to your vault. It does the rest."**
   Sub-line: *"You drop it in. It files, it teaches, and it remembers how you like your notes."*
   Keep existing badges.
2. **Intro** — one confident paragraph: organizes + teaches + learns you. The
   self-evolution hook stated plainly.
3. **Before / after** — the centerpiece. A lesser agent dumps `notes.md` at repo
   root; this one files a teaching-grade note in your conventions and turns your
   next correction into a kept rule. Include a small fenced artifact (filed path +
   matched frontmatter + wired-in wikilinks) as the ponytail `<input type="date">` analog.
4. **The altitude ladder** — the "how it works", a numbered code block parallel to
   ponytail's rung ladder:
   ```
   1. A link or a thought       → one clean note, filed in the right place
   2. A handful of sources      → a few notes + a light index
   3. A whole syllabus or book  → the full scaffold: indexes, navigation,
                                  quality pass, concept-graph canvas
   ```
5. **Install** — kept, tightened. Framed "the most effort it'll ever ask of you."
   Claude Code + Codex two-command flow; Codex-install details in `<details>`;
   one-line vault installer. Add: "`:setup` works in an empty folder *or* an
   existing vault — it adapts."
6. **Commands** — one tight, scannable table of all 12, led by "you rarely need
   these — just talk to it." Keep the grouping as thin subheaders or a single table.
7. **Why it self-evolves** — kept, tightened. Keep the mermaid diagram, the
   two-tier-autonomy note, the `examples/EVOLUTION.md` pointer.
8. **Works with any agent** — kept (markdown-only, runs anywhere that reads AGENTS.md).
9. **FAQ** — new, punchy: touches existing notes? (only with approval); already
   have a big vault? (`:setup` adapts); config file? (no); without the plugin?
   (works, it's markdown); gets my taste wrong? (`reflect` → approve diff → `evolve`).
10. **Repo layout / Customize / Contributing / Part of Codex Lab / License** — kept, trimmed.

Tone rules: short declarative sentences, no hedging, no em-dash overuse, no
marketing superlatives without substance. Every claim must map to a real behavior.

## Part 2 — Adaptive commands

### `setup` (rewrite `commands/setup.md`) — detection-first, three modes

```
:setup → inspect the folder, then do the least surprising thing
  • EMPTY (no notes, no .obsidian/)            → SCAFFOLD
        propose a small starter (References/ + 1–2 domains from $ARGUMENTS or a
        sensible default), confirm, build branches+_index, learning state,
        Inbox/, Dashboard.md, commit.
  • EXISTING Obsidian vault, no .agents/learned/ → ADOPT  (the adaptive win)
        read existing folders / naming / frontmatter. Impose NOTHING — map what's
        there. Seed only what's missing: .agents/learned/, Inbox/, Dashboard that
        links the existing branches. Record detected conventions into
        .agents/learned/conventions.md as a proposed starting point (you approve).
        Commit.
  • ALREADY an OKA vault (.agents/learned/ exists) → RESUME
        do not re-scaffold. Report status (branches, Inbox count, last journal
        entry) and route to work: "Inbox has N items — ingest? or what to capture?"
Always idempotent; never clobber; commit the scaffold.
```

### Bootstrap-aware everyday commands

- `ingest` and `capture`: if the folder is not a vault yet (no `.agents/` and no
  vault structure), offer `:setup` instead of failing. Otherwise unchanged.
- Other commands keep their current smart no-arg defaults (no behavior change).

### `help` (touch `commands/help.md`)

Update the `setup` line to say it adapts (empty folder vs. existing vault). No
structural change to the guide.

## Files touched

- `README.md` — full rewrite.
- `plugins/obsidian-knowledge/commands/setup.md` — adaptive, three modes.
- `plugins/obsidian-knowledge/commands/ingest.md` — bootstrap-aware preamble.
- `plugins/obsidian-knowledge/commands/capture.md` — bootstrap-aware preamble.
- `plugins/obsidian-knowledge/commands/help.md` — adaptive `setup` line.

## Verification

- Markdown renders cleanly (no broken fences, valid mermaid).
- `marketplace.json` / `plugin.json` untouched, so manifest CI stays green.
- Run the repo's existing checks (`scripts/test_hooks.sh`, link validator) to
  confirm nothing regressed.
- Manual read-through against the tone rules above.

## Out of scope

- No new commands. No renaming existing commands (preserves muscle memory + docs).
- No changes to the ingestion pipeline, hooks, or the link validator.
- No benchmarks, sponsors, or star-history sections.
