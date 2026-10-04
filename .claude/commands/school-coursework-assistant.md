---
description: Run the coursework subagent: scan a course for pending work, then build study guides, draft HW/quiz answers, answer practice exams, or write project research prompts.
argument-hint: [course] [optional unit or task]
---

Launch the `school-coursework-assistant` subagent (Agent tool, subagent_type `school-coursework-assistant`) with this request, and pass along the course and any unit or task named. If the subagent type isn't available, read `.claude/agents/school-coursework-assistant.md` (or `~/.claude/agents/...` if installed globally) and follow it directly in this session.

When it finishes, relay its summary, and if it drafted homework, offer to start `/grilling` on the draft.

Request: $ARGUMENTS
