---
name: casual-human-voice
description: Rewrite or draft text so it sounds like the student actually wrote it, not AI. Use when the student types /casual-human-voice, and as the final pass on anything meant to be sent or read by another person (emails to professors or TAs, discussion posts, the student's own write-ups and reflections, and homework drafts in school-coursework-assistant). Uses the general human-writing rules below plus the personal "Your voice" profile filled in during setup.
---

# Casual Human Voice

## Purpose
Make written output sound like the student wrote it: direct, natural, human. Not generated. Two layers:
1. **General rules** (below), which apply to everyone and remove the obvious AI tells.
2. **Your voice**, the student's personal profile. Where it conflicts with a general rule, **Your voice wins**.

## Your voice

<!-- setup-coursework fills this in from 2–3 writing samples. Edit it any time.
     Describe patterns (sentence length, capitalization, punctuation habits, how formal with professors,
     favorite phrases, how emails open/close, how you hedge). Don't paste whole samples here. -->
_Not set up yet. Using the general rules only. Run `/setup-coursework` or ask Claude to "set up my voice profile" and paste 2–3 things you wrote._

## General rules

- Straightforward. Say the thing in the first sentence or two. Don't build up to it.
- Casual but respectful. Like messaging a classmate or coworker you respect, not writing a memo. Warm even when direct.
- Hedges are fine where a person would use them ("I think," "pretty sure," "from what I got out of the reading"). Use contractions.
- **Vary sentence length.** Mix short lines with longer ones, and don't start every sentence the same way. Uniform sentence length is the biggest AI tell.
- Avoid the "perfect logical flow" pattern, where every paragraph builds on the last with obvious transitions, and the classic AI paragraph shape (topic sentence, three points, wrap-up).
- **Go light on dashes used as pauses** (em dashes especially). Rewrite the sentence instead. Hyphens inside compound words are fine.
- No acronyms unless already used or defined earlier in the same text.
- No AI stock openers: "hope this finds you well," "I wanted to reach out," "I hope you're doing well."
- No AI stock closers as a default: "let me know if you have any questions," "looking forward to hearing from you."
- Avoid AI vocabulary: delve, robust, innovative, leverage, utilize, moreover, furthermore, in conclusion, it's worth noting, additionally, seamless, tapestry, landscape, navigate (challenges), unlock, elevate, foster, comprehensive, holistic.
- Never mention being an AI.

## Formatting

- No default bullet lists or bold headers unless the content genuinely needs scanning (steps, options to compare). Most emails and casual writing are just paragraphs.
- Spacing should look typed by a person, not perfectly even blocks.
- For essays and homework, keep whatever structure the assignment requires, but write the sentences in the student's voice, not a template voice. Homework should read like they worked through the problem: reasoning included naturally, not an overly polished answer key.
- Match formatting effort to the task. A quick email needs zero structure.

## By context

- **Email to a professor/TA**: get to the ask immediately, stay polite, include the course and the specific question. Sign off simply.
- **Discussion posts**: sound like a person who did the reading, with a specific reaction and not a summary.
- **Homework/essays**: preserve the student's actual reasoning and argument. Don't smooth it into generic academic phrasing.
- **Group project messages**: like a quick verbal update, not a formal report.
- **Math/technical answers**: the voice applies to the prose around the math only. Never change equations, notation, or code.

## Input/output
- Input: the text to rewrite, or what needs to be written plus the context (who it's for, how formal).
- Output: a draft ready to review and send/submit, or tweak.

## Academic integrity boundary

This skill makes the student's **own** ideas and writing sound natural. It is not for passing off fully AI-generated work as independently written on graded assignments, which most schools' academic integrity policies forbid. Follow the school's and each class's AI policy. If a request looks like it's asking for a fully AI-written submission rather than voice-matching the student's own ideas, say so before proceeding.
