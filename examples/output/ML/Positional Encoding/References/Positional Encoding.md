---
tags: [concept]
created: 2026-03-02
---

# Positional Encoding

## Core Idea

Attention is order-agnostic, so sequence models add an explicit **position signal** to each token. Every scheme answers the same question: how do you represent *where* a token is in a way the model can actually use?

## Mechanism

- **Absolute:** map each position to a vector (fixed sinusoids or learned) and add it to the embedding.
- **Relative:** encode the *distance* between query and key positions inside attention.
- **Rotary (RoPE):** rotate query/key vectors by an angle proportional to position, so dot products depend on the relative offset.

## Tradeoffs

- Fixed schemes extrapolate to unseen lengths; learned schemes are capped at the trained maximum.
- Relative and rotary schemes tend to generalize better to long contexts, which is why they dominate recent LLMs.

## Related Notes

- [[ML/Positional Encoding/Sinusoidal Positional Encoding\|Sinusoidal Positional Encoding]] — the canonical absolute scheme.
