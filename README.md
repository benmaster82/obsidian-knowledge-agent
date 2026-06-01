# Obsidian Knowledge Agent

> A self-evolving, agent-driven pipeline that turns raw material — PDFs, slides, syllabi, papers, transcripts, URL lists — into structured, teaching-quality Obsidian notes, complete with navigation and a concept-graph canvas.

Point any agentic coding assistant (Codex, Claude, Cursor, …) at your vault, drop sources in `Inbox/`, and ask it to ingest. The agent classifies the input, scaffolds a folder structure, writes notes that actually *teach*, builds a JSON-Canvas concept graph, wires the wikilinks, and runs a quality pass — all by following the rules in [`AGENTS.md`](AGENTS.md) and [`.agents/`](.agents/).

## The method: ingest → compile → distribute

The pipeline is defined in [`.agents/ingestion-workflow.md`](.agents/ingestion-workflow.md) as six phases:

| Stage | Phases | What happens |
|---|---|---|
| **Ingest** | 0 | Classify the input (course / book / paper collection / single source / topic build), extract a structural map, resolve target paths. |
| **Compile** | 1–3 | Scaffold the folder tree + index files, write teaching-quality content/source/concept notes, build a concept-graph canvas. |
| **Distribute** | 4–5 | Wire prev/next navigation, validate every wikilink, run a parallel teaching-quality review. |
| **Commit** | 6 | Commit the collection; clear `Inbox/` under an explicit approval policy. |

## What makes the notes good

- **Teaching-note style guide** ([`.agents/style-guide.md`](.agents/style-guide.md)) — notes read like something a human would revisit, with the machinery kept off-stage.
- **Three-artifact floor** for ML/Quant notes — every technical note ships at least one runnable code block, one LaTeX equation, and one Mermaid diagram.
- **Concept-graph canvas** — collections with 3+ units get a [JSON-Canvas](https://jsoncanvas.org/) map linking each concept to the units where it appears.
- **Link integrity** — a built-in Python validator flags every broken wikilink before commit.
- **Parallel workers** — note-writing and the quality pass fan out across multiple agents.

## Install

One line, no clone required — the installer downloads itself and copies the right files into place.

**As a Claude Code skill** (installs into `~/.claude/skills/`):

```bash
curl -fsSL https://raw.githubusercontent.com/Michael-OvO/obsidian-knowledge-agent/main/install.sh | bash -s -- --skill
```

**Into an Obsidian vault** (copies `AGENTS.md` + `.agents/`, creates an `Inbox/`):

```bash
curl -fsSL https://raw.githubusercontent.com/Michael-OvO/obsidian-knowledge-agent/main/install.sh | bash -s -- /path/to/your/vault
```

Any agent that reads `AGENTS.md` — Codex, Claude, Cursor — then picks up the pipeline automatically. Use `--both /path/to/your/vault` to install the vault files **and** the skill in one go.

<details>
<summary>From a clone instead</summary>

```bash
git clone https://github.com/Michael-OvO/obsidian-knowledge-agent
cd obsidian-knowledge-agent
./install.sh /path/to/your/vault     # vault files
./install.sh --skill                 # Claude Code skill
./install.sh --both /path/to/vault   # both
```

The skill is self-contained — its reference docs live in `skills/obsidian-knowledge/references/` (kept in sync with `.agents/` via `scripts/sync-skill.sh`).
</details>

## Quickstart

1. Install (above).
2. Drop a syllabus, paper set, book TOC, or topic brief into `Inbox/`.
3. Ask your agent: *"Ingest the material in Inbox into the vault."*
4. Review the generated collection, then approve clearing `Inbox/`.

See [`examples/`](examples/) for a worked input → output run.

## Customize

- **Branches:** edit the branch table in `AGENTS.md` and `.agents/vault-architecture.md` to match your domains.
- **Style:** tune `.agents/style-guide.md` (e.g., relax the three-artifact floor) for your subjects.
- **Conventions:** frontmatter, naming, math, and canvas rules live in `.agents/obsidian-conventions.md`.

## License

MIT — see [LICENSE](LICENSE).
