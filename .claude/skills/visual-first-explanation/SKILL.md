---
name: visual-first-explanation
description: Use when the student types /visual-first-explanation or asks you to explain, teach, or break down a concept — "explain X," "how does X work," "walk me through X," tutoring/study help, or any request where understanding (not just an answer) is the goal. Leads with a concrete example, picks the right visual type (analogy, static diagram, animation, or interactive) via a decision tree matched to concept type, and flags every simplification explicitly rather than passing it off as complete.
---

# Visual-First Explanation

## Framing note (read before applying)
"Visual learner" as a fixed trait isn't supported by the research — there's no evidence matching instruction to a self-identified learning style improves outcomes. What *is* well-supported: everyone learns better from well-integrated words + visuals than words alone (separate cognitive channels reinforce each other). So this skill isn't a special accommodation — it's just good instructional design. Still verify understanding through both visual and verbal channels; never treat visual-only as sufficient.

## Decision tree — pick the visual type
1. **Does understanding require seeing something change over time or move?**
   - No → go to 3.
   - Yes → go to 2.
2. **Does the learner need to control/vary an input to build the intuition, not just watch it once?**
   - Yes → build a small interactive/animated visualization (an "explorable" per Bret Victor — guide attention to the 1-2 most important things to try, never an unguided sandbox).
   - No → a short animation or a specific named existing video reference is enough. Prefer a real, precisely-matching existing explainer (e.g. a specific 3Blue1Brown video) over reconstructing a worse version from scratch — but name it specifically, never a vague "there are videos about this."
3. **Is this a direct comparison between two or more things?**
   - Yes → static side-by-side diagram (spatial contiguity beats sequential video for comparisons — the learner needs both in view at once).
   - No → go to 4.
4. **Is the concept abstract/relational with no moving parts (a definition, a relationship, a category structure)?**
   - Yes → plain analogy first, paired with a simple static diagram only if the relationship has real spatial structure worth drawing (a hierarchy, a cause-and-effect flow).
   - No further match → fall back to analogy + text as the lightest option; escalate only if the learner signals confusion.

**Coherence principle governs all branches**: never add a visual for decorative effect. Motion/interactivity for a concept with no temporal or manipulable dimension actively hurts comprehension by consuming working memory that should go to the content.

## Response structure
1. **Concrete anchor first** — a specific, relatable example before any formal definition. Definitions are an ending point of understanding, not a starting point.
2. **Visual element** (from the decision tree), placed immediately adjacent to the anchor — not after paragraphs of text.
3. **Plain-language mechanism** — explain until a "but why" would have an answer (the Feynman standard), not a surface description that just relocates the jargon.
4. **Explicit simplification flag** — one sentence naming what was simplified or omitted, so the boundary of the simple version is clear, not mistaken for complete.
5. **Precise/technical layer** (optional, offered not forced) — the rigorous version, clearly separated so it can be skipped without losing the core understanding already delivered.
6. **Gap check** — a brief question inviting the learner to test the model ("does that match what you'd expect if X changed?").

Keep layers 1-4 in a self-contained chunk; don't interleave simple and technical language in the same paragraph — that breaks the simple version's clarity for no benefit.

## Before using any analogy
Ask one question: is there an edge case a listener would reasonably extrapolate from this analogy that turns out false? If yes, fix the analogy or add a one-line caveat immediately — don't let it surface later. (3Blue1Brown's own "How to lie using visual proofs" is the canonical warning: a visually compelling diagram can imply a false convergence/limit.)

## Do
- Lead with a concrete, specific example before any general statement.
- Match visual type to concept type via the decision tree above.
- Keep visual and text physically adjacent.
- Flag every simplification explicitly.
- Reference specific, named existing videos when one genuinely fits.
- Offer the precise/technical layer as a next step, not by default.

## Don't
- Add animation/motion/interactivity to a concept with no temporal or manipulable dimension.
- Build an unguided interactive sandbox.
- Treat "visual learner" as license to skip verbal explanation.
- Let an analogy imply something false about an edge case for the sake of landing faster.
- Open with a formal definition.
- Interleave simple and technical language in one paragraph.
