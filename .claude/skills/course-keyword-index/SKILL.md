---
name: course-keyword-index
description: Builds and maintains a per-course keyword index (Course Reference/exam-keyword-index.md), a navigation map of where every term, symbol, and method is taught, summarized, and already worked in that course's own materials. Used before answering practice exams so answers come from the course, not general knowledge. Triggers on /course-keyword-index, "build the keyword index for [course]," "index this course for the exam," "update the keyword index," or automatically from school-coursework-assistant when a practice exam arrives and no index exists.
---

# Course Keyword Index

A **map, not a summary.** It records *where* things are taught so answers can go read the real source. It deliberately holds no derivations or explanations, so it can never go stale into a wrong answer.

## Location

`<course>/Course Reference/exam-keyword-index.md`. The course folder comes from the **Coursework settings** block in CLAUDE.md. Create `Course Reference/` if missing, following `school-file-organizer`'s conventions.

## Build

1. Walk the course's materials in order: lecture transcripts/notes, slides, readings, study guides, and completed homework (including `My Work/` and `OFFICIAL` solutions). Read in full. Don't sample.
2. Write the index with these sections:

```markdown
# <Course> — exam keyword index
Last built: <YYYY-MM-DD> · Covers: <units covered, e.g. Weeks 1–7>

## Search vocabulary
<!-- The course's notation and names vs. the usual ones, so a question's wording can be matched. -->
| Course says | Also known as | Notes |

## Keyword table
| Keyword / symbol | Taught in (file + rough location) | Summarized in | Already worked in (HW/quiz + problem) |

## Errata
<!-- Places a lecture or slide got something wrong, and the correct version's location. -->
| Where | What's wrong | Correct version at |

## Coverage gaps
<!-- Topics on the syllabus/exam scope with no real teaching material yet. -->
```

3. Locations must be specific enough to open directly: file name plus a timestamp, slide number, page, or section heading.

## Update

When new units arrive, append rows and update `Last built` and `Covers`. Never delete rows. If a location moved, update it in place and note it in the row.

## Use (how answers read it)

For each exam question: pull its terms, look them up in Search vocabulary and the Keyword table, then **open the named sources and read them**. The transcript or lecture is the authority on what was taught. Check Errata before reusing anything. If a question lands in a Coverage gap or maps to nothing, say so rather than reaching for outside material.

## Don't

| Don't | Why |
|---|---|
| Put derivations, definitions, or answers in the index | A condensed second-hand version is exactly what shouldn't end up in an answer |
| Answer from the index alone | It only says where to look |
| Build it from keyword search | Definitions land away from the term; read continuously |
