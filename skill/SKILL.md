---
name: ba-interview
description: "BA interview assistant: generate questions from CV, score transcripts, compare candidates. Auto-detects workflow from input."
user-invocable: true
when_to_use: "Invoke for BA candidate interview preparation, scoring transcripts against rubric, or comparing multiple candidates."
category: ba
keywords: [interview, ba, scoring, questions, candidate, hiring]
argument-hint: "[CV file | transcript file | 'compare' scorecard1 scorecard2]"
metadata:
  author: damtuana
  version: "1.0.0"
---

# /ba-interview

All-in-one BA interview skill: generate tailored questions from CV, score interview transcripts, or compare candidates.

## Auto-Detection Logic

| Input Pattern | Mode | Action |
|---|---|---|
| File path to CV (`.md`/`.pdf` with resume/profile content) | **prep** | Generate ~15 tailored interview questions |
| File path to transcript (`.md`/`.pdf` with interview Q&A content) | **score** | Score using question bank + scoring template |
| `compare` + 2+ scorecard file paths | **compare** | Side-by-side comparison report |
| No args or ambiguous | **interactive** | Show menu via AskUserQuestion |

### Detection Heuristics

**CV detection:** file contains keywords like "kinh nghiệm", "experience", "education", "học vấn", "skills", "IELTS", "GPA", "university", combined with absence of interview Q&A patterns.

**Transcript detection:** file contains patterns like Q&A exchanges, interviewer/candidate dialogue, "hỏi:", "trả lời:", question numbering with answers, or meeting transcript structure.

**Scorecard detection:** file contains "SCORECARD", "DETAILED SCORING", "Average Score", scoring tables.

## Language Detection

- If input content is Vietnamese → output Vietnamese
- If input content is English → output English
- If mixed → output Vietnamese (primary working language)

## PDF Auto-Conversion

When input file is `.pdf`:
1. Run: `$HOME/.claude/skills/.venv/bin/python3 $HOME/.claude/skills/ba-interview/scripts/pdf2md.py "<file.pdf>"`
2. Read the resulting `.md` file (same directory, same base name)
3. Continue with detected mode

**Note:** The script deletes the original PDF after conversion. Warn user before proceeding.

## References (bundled — always available)

- `$HOME/.claude/skills/ba-interview/references/question-bank.md` — Full question bank with scoring criteria (Categories 1-13)
- `$HOME/.claude/skills/ba-interview/references/scoring-template.md` — Scoring scale, level matrix, output format
- `$HOME/.claude/skills/ba-interview/references/stimulation-leadership.md` — Stimulation exercises + Leadership questions (Categories 14-15)

---

## Mode: PREP (CV → Interview Questions)

### Steps

1. **Read CV** (auto-convert PDF if needed)
2. **Extract candidate profile:**
   - Full name (Vietnamese + ASCII)
   - Target level (Fresher/Junior/Middle/Senior/Lead) — infer from years of experience
   - Key skills claimed in CV
   - Domain background (Logistics, Finance, IT, etc.)
   - Education, certifications, language proficiency
   - Notable projects or achievements
3. **Read** `references/question-bank.md` and `references/stimulation-leadership.md`
4. **Select ~15 questions** using the Level-Based Question Selection matrix from `references/scoring-template.md`:

   | Category | Fresher | Junior | Middle | Senior | Lead |
   |----------|---------|--------|--------|--------|------|
   | BA Hard Skills | 2-3 | 3-4 | 4-5 | 4-5 | 3-4 |
   | Domain (Blockchain/BI) | Skip | 1 basic | 2 | 2-3 | 2 |
   | SQL | 1 basic | 1-2 | 2 | 1 | Skip |
   | Wireframe | 1 | 1-2 | 1-2 | 1 | Skip |
   | Project Method | 1-2 basic | 2-3 | 3-4 | 4-5 | 3-4 |
   | Soft Skills (Dev/Customer) | 1 | 1-2 | 2 | 2 | 2 |
   | Task Management | 1 | 1 | 1-2 | 1-2 | 1 |
   | Self-study & Career | 1 | 1 | 1 | 1 | 1 |
   | Risk Identification | Skip | 1 | 1-2 | 2 | 1-2 |
   | **Stimulation (MANDATORY)** | **1** | **1** | **1** | **1** | **1** |
   | BA Lead/Leadership | Skip | Skip | Skip | Optional | 5-7 |

5. **Personalize questions** — reference specific CV claims (projects, tools, domains) in question phrasing
6. **Add 1 mandatory stimulation** — select appropriate exercise from `references/stimulation-leadership.md` based on level
7. **Format output** matching existing style (see Output Format below)

### Output Format (match existing `Interview Question/` files)

```markdown
# BA Interview Questions - {Full Name}

## Thông tin ứng viên
- **Họ tên:** {Full Name}
- **Ngày phỏng vấn:** {dd/mm/yyyy}
- **Level đánh giá:** {Level}
- **Background:** {Education, major, GPA if available}
- **Kinh nghiệm:** {Summary of experience}
- **Ngôn ngữ:** {Language proficiency}
- **Skills từ CV:** {Key skills list}

---

## Suggested Questions (~15 câu)

### CATEGORY N: {CATEGORY NAME} (N câu)

**Q{N}. {Question text in English — personalized to CV}**
- Ref: Q{X.Y}
- Mục đích: {Why asking this — what to verify from CV}
- Follow-up: {Suggested follow-up if answer is shallow}
- **Expected:** {Key points from question bank scoring criteria}

...

### CATEGORY 14: STIMULATION (BẮT BUỘC - 1 câu)

**Q{N}. {Stimulation exercise}**
- Ref: Bài tập {X}
- Level: {Applicable levels}
- **Expected:** {Evaluation criteria from stimulation reference}
```

### Save Location

`Interview Question/{TênỨngViên}_{ddmmyyyy}_interview-question.md`

- Name: PascalCase, no diacritics (e.g., `TrinhVanNam`)
- Date: interview date in ddmmyyyy format

---

## Mode: SCORE (Transcript → Scorecard)

### Steps

1. **Read transcript** (auto-convert PDF if needed)
2. **Read** `references/question-bank.md`, `references/scoring-template.md`, `references/stimulation-leadership.md`
3. **Identify all Q&A pairs** in transcript:
   - Extract each question asked by interviewer
   - Extract candidate's response for each question
4. **Map each question** to closest match in question bank:
   - If direct match → use that question's scoring criteria
   - If no match → mark as "Extra question" and map to most relevant category
5. **Score each Q&A (0-5)** using the rubric from question bank:
   - 5: Excellent — insight, real experience demonstrated
   - 4: Good — clear examples, logical
   - 3: Average — correct basics, lacks depth
   - 2: Below Average — basic understanding, many gaps
   - 1: Poor — wrong or very vague
   - 0: No answer or irrelevant
6. **Write detailed notes** for each score — what was said, what was missing, interviewer corrections
7. **Calculate average score:** `SUM(scores) / COUNT(questions asked)`
8. **Assess level** using Rating theo Level table
9. **Generate summary:** strengths, weaknesses, level assessment, conclusion

### Output Format (match existing `Scoring/` files)

```
=== BA INTERVIEW SCORECARD ===

--- THÔNG TIN PHỎNG VẤN ---
Account người phỏng vấn: [from transcript or "N/A"]
Division: [from transcript or "N/A"]
Họ tên ứng viên: {Full Name}
Vị trí ứng tuyển: Business Analyst
Ngày phỏng vấn: {dd/mm/yyyy}

--- DETAILED SCORING ---

| # | Question (tóm tắt) | Category | Score | Notes |
|---|---------------------|----------|-------|-------|
| 1 | ... | ... | x/5 | ... |

--- EXTRA QUESTIONS (ngoài template) ---
| # | Question | Mapped to Category | Score | Notes |
|---|----------|-------------------|-------|-------|
| E1 | ... | ... | x/5 | ... |

--- SUMMARY ---
Total Questions Asked: xx
Average Score: x.x / 5.0
Expected for Level ({Level}): x.x - x.x

--- KỸ NĂNG CHUYÊN MÔN ---
Điểm mạnh:
- ...
Điểm yếu:
- ...

--- KỸ NĂNG MỀM ---
Điểm mạnh:
- ...
Điểm yếu:
- ...

--- ĐÁNH GIÁ LEVEL ỨNG VIÊN ---
[x] {Selected Level}

--- KẾT LUẬN ---
[x] {Recommendation: Nên tuyển / Không đạt / Khác}
{Rationale}

--- NHẬN XÉT KHÁC ---
{Additional observations about candidate}
```

### Save Location

`Scoring/BA-{Level}-{Name}-{dd-mm-yyyy}.md`

- Level: Intern, Fresher, Junior, Middle, Senior, Lead, PM, Manager, Director, ViceManager, Other
- Name: PascalCase, no diacritics
- Date: dd-mm-yyyy with hyphens

---

## Mode: COMPARE (Multiple Scorecards → Comparison)

### Steps

1. **Read all scorecard files** provided
2. **Extract per candidate:** name, level, average score, category scores, strengths, weaknesses, recommendation
3. **Generate comparison table:**
   - Overall scores side-by-side
   - Category-by-category breakdown
   - Strengths/weaknesses delta
4. **Rank candidates** with rationale
5. **Final recommendation** with hiring priority

### Output Format

```markdown
# BA Candidate Comparison Report

## Candidates
| # | Name | Level | Score | Recommendation |
|---|------|-------|-------|----------------|
| 1 | ... | ... | x.x/5.0 | ... |

## Category Breakdown
| Category | Candidate A | Candidate B | ... |
|----------|-------------|-------------|-----|
| BA Hard Skills | x.x | x.x | ... |
| ... | ... | ... | ... |

## Strengths Comparison
| Candidate A | Candidate B |
|-------------|-------------|
| ... | ... |

## Weaknesses Comparison
| Candidate A | Candidate B |
|-------------|-------------|
| ... | ... |

## Recommendation
{Ranked list with rationale for hiring priority}
```

### Save Location

`Scoring/comparison-{dd-mm-yyyy}.md`

---

## Interactive Mode (No Args)

When invoked without arguments or with ambiguous input, present menu:

```
AskUserQuestion:
  question: "What would you like to do?"
  options:
    - "Prep: Generate interview questions from a CV"
    - "Score: Score an interview transcript"
    - "Compare: Compare multiple candidates"
```

Then ask for the relevant file path(s).

---

## Constraints

- Always read the full reference files before generating output — do not hallucinate scoring criteria
- Personalize questions to CV content — generic questions are low value
- Score strictly against rubric — do not inflate or deflate
- Notes must cite what candidate actually said, not just "good" or "bad"
- Stimulation question is MANDATORY in every prep output
- Output paths are relative to CWD (user runs from ba-interview project root)
- Apply L1 approval gate before writing any file

## Error Handling

- If PDF conversion fails → inform user, suggest manual conversion or provide the `.md` alternative
- If transcript is too short or unclear → ask user to clarify which parts are Q&A
- If CV lacks enough info to determine level → ask user to specify target level
- If file not found → check common paths (`CV/`, `Transcript/`, `Scoring/`) and suggest
