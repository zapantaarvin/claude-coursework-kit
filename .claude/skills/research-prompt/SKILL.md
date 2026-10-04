---
name: research-prompt
description: Writes a copy-paste-ready deep-research prompt (for Perplexity, ChatGPT Deep Research, Gemini Deep Research, or similar) for a course project, paper, or anything the student needs real sources on, then files the results back into the course folder when they return. Use when the student types /research-prompt, says "help me research this project," "I need sources for X," "write me a research prompt," or says they've pasted or dropped research results to process. Also used by school-coursework-assistant's project branch.
---

# Research Prompt

Claude doesn't guess at facts a project depends on. It writes a strong research prompt, the student runs it in a deep-research tool, and Claude files what comes back.

## Step 1 — Write the prompt

Read the project's own prompt/rubric first (and the **Coursework settings** block in CLAUDE.md to find the course). Then produce **one** prompt in a single fenced code block, containing:

1. **What the project actually is**: one tight paragraph from its own prompt/rubric, including the deliverable and deadline if known.
2. **The core research ask**: proven approaches, current facts, known pitfalls, with citations. Tied to this project's domain, not generic.
3. **At least 5 concrete angles or sub-questions** specific to this project.
4. **Current context**: the course, what's been covered in lecture so far, and the tools/language/data/length constraints the project requires.
5. **A stress-test ask**: if the student's planned approach or setup is wrong or not enough, say so rather than assuming it's fine.
6. **Always end with:** "Deliver the full answer as a downloadable Markdown (.md) file: a descriptive title, clear headings, tables where they help, and a numbered source list with links at the end."

Skip backstory and pleasantries in the prompt. Go straight to the ask.

## Step 2 — Hand off and wait

Tell the student:
1. Paste the prompt into their deep-research tool.
2. Save the result into the project's folder (suggest `<project folder>/Research/`, created via `school-file-organizer`'s conventions).
3. Say "research is ready" (or "skip research").

Don't draft the project while waiting.

## Step 3 — File the results

When results come back: read them in full, then write a short `Research/research-notes.md` in Claude's own words with citations kept. It should cover the key findings, the recommended approach, and open questions for the student. Keep the original file next to it. Don't delete it. If something in the results contradicts the course materials, flag it. For anything the course is graded on, the course wins.

## Academic integrity

Research supports the student's own project. Don't write the project itself from the research. Many classes also require disclosing AI or research-tool use, so remind the student to check their class's policy.
