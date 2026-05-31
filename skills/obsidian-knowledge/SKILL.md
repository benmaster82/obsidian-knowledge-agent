---
name: obsidian-knowledge-ingest
description: Use when transforming raw material (PDFs, docx, slides, syllabi, papers, transcripts, URL lists) into structured, teaching-quality Obsidian notes. Drives an ingest → compile → distribute pipeline that classifies the input, scaffolds a folder tree, writes notes that teach, builds a concept-graph canvas, wires wikilinks, and runs a quality pass. Trigger when the user asks to "ingest", "build notes from", or "add to the vault".
---

# Obsidian Knowledge Ingest

This skill packages a six-phase pipeline for turning raw material in an Obsidian vault's `Inbox/` into structured, navigable, teaching-quality notes.

## How to use it

1. **Read the rules first.** Read these bundled references in order:
   - `references/style-guide.md` — the teaching-note voice and quality bar
   - `references/obsidian-conventions.md` — frontmatter, wikilinks, naming, LaTeX, Mermaid, canvas
   - `references/vault-architecture.md` — folder roles and branch boundaries
   - `references/ingestion-workflow.md` — the full six-phase workflow you will execute

   If the target vault already has these files at `.agents/` in its root, prefer those — they may be customized for that vault.

2. **Execute the workflow** in `references/ingestion-workflow.md`:
   - **Phase 0 — Ingest:** classify the input profile and extract a structural map.
   - **Phases 1–3 — Compile:** scaffold the tree, write content/source/concept notes (ML/Quant notes must hit the three-artifact floor — runnable code + LaTeX + Mermaid), build the concept-graph canvas.
   - **Phases 4–5 — Distribute:** wire prev/next navigation, validate all wikilinks, run the teaching-quality pass.
   - **Phase 6 — Commit:** commit the collection; clear `Inbox/` only with explicit user approval.

3. **Respect the boundaries:** never delete files without approval, never touch `.obsidian/`, and keep machine metadata in frontmatter rather than visible note scaffolding.
