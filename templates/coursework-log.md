# Coursework run log

Append-only log for the `school-coursework-assistant` subagent. It reads this in full at the start of every run so it doesn't redo finished work, and appends one dated entry per item produced or decided at the end of every run. Never edit or reorder existing entries. Corrections get a new entry.

Every entry uses this field set. Fields are always present, even when the value is "n/a" or "none", so entries stay searchable:

```markdown
## <YYYY-MM-DD> — <Course> — <Unit>

- Scanned: <source files that triggered this entry>
- Type: <Study Guide | Homework | Quiz | Practice Exam | Project | Keyword Index>
- Action: <built | drafted | generated research prompt | asked a question, awaiting answer>
- Output: <absolute path(s), or "none yet — awaiting student">
- Status: <Done | Awaiting student | Blocked>
- Notes: <anything worth carrying forward, or "none">
```

---
