# EX 101 - Example Course

An example of the folder layout `/school-file-organizer` builds for a weekly lecture course. Your real courses may use modules or flat topics instead. The organizer asks, and follows whatever the syllabus suggests.

| Folder | What goes in it |
|---|---|
| `Course Reference/` | Syllabus, textbook, anything not tied to one week, plus `exam-keyword-index.md` (built by `/course-keyword-index`) |
| `Week NN - Topic/Slides/` | That week's slide decks |
| `Week NN - Topic/Readings/` | Assigned papers and chapters |
| `Week NN - Topic/Captions/` | Lecture transcripts (`/lecture-transcriber` output, or downloaded captions) |
| `Week NN - Topic/Study Guide/` | `index.html` + `README.md` from `/school-study-guide` |
| `Week NN - Topic/HW N/` | The handout and instructions as given |
| `Week NN - Topic/HW N/My Work/` | Anything you wrote, including drafts (`*_DRAFT_<date>`) |
| `Practice Exams/` | Practice exams you drop in |
| `Practice Answers/` | `<exam>_PRACTICE-ANSWER_<date>` files from the coursework assistant |

Naming: school-posted solutions get `OFFICIAL` in the filename (e.g. `hw1_OFFICIAL_solution.pdf`) so they never collide with your own work.

If this course had strict rules, they'd live in `.claude/skills/ex101-coursework/SKILL.md` (made with `/new-course-skill`), and every kit skill would follow them for this course.
