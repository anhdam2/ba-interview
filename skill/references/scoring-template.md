# BA Interview Scoring Template

## Scoring Scale
| Score | Level | Description |
|-------|-------|-------------|
| 0 | No Answer | Không trả lời hoặc trả lời không liên quan |
| 1 | Poor | Hiểu sai hoặc rất mơ hồ |
| 2 | Below Average | Có hiểu biết cơ bản nhưng thiếu chi tiết, nhiều lỗ hổng |
| 3 | Average | Trả lời đúng ở mức cơ bản, thiếu chiều sâu |
| 4 | Good | Trả lời tốt, có ví dụ thực tế, logic rõ ràng |
| 5 | Excellent | Trả lời xuất sắc, có insight, thể hiện kinh nghiệm thực chiến |

---

## FLEXIBLE SCORING MECHANISM

### Nguyên tắc:
1. Khi nhận CV, AI sẽ tự generate ~15 câu hỏi phù hợp với level và background của candidate
2. Chỉ tính điểm những câu BA Lead thực sự hỏi trong buổi interview
3. Câu hỏi ngoài lề được map vào category phù hợp nhất và tính điểm thay cho câu không hỏi
4. Câu hỏi tình huống (Stimulation) là BẮT BUỘC trong mọi buổi interview

### Công thức tính điểm:
```
Final Score = SUM(điểm từng câu đã hỏi) / COUNT(tổng số câu đã hỏi)
```
Kết quả trên thang 5.0

### Xử lý câu hỏi ngoài lề:
Khi BA Lead hỏi câu không có trong template:
1. Xác định câu hỏi thuộc skill/category nào
2. Đánh giá câu trả lời theo tiêu chí của category đó
3. Ghi chú: "Extra question → mapped to [Category Name]"

---

## LEVEL-BASED QUESTION SELECTION

### Khi nhận CV, AI sẽ chọn ~15 câu theo level:

| Category | Fresher | Junior | Middle | Senior | Lead |
|----------|---------|--------|--------|--------|------|
| BA Hard Skills | 2-3 câu cơ bản | 3-4 câu | 4-5 câu | 4-5 câu | 3-4 câu |
| Domain (Blockchain/BI) | Skip | 1 câu basic | 2 câu | 2-3 câu | 2 câu |
| SQL | 1 câu basic | 1-2 câu | 2 câu | 1 câu | Skip |
| Wireframe | 1 câu | 1-2 câu | 1-2 câu | 1 câu | Skip |
| Project Method | 1-2 câu basic | 2-3 câu | 3-4 câu | 4-5 câu | 3-4 câu |
| Soft Skills (Dev/Customer) | 1 câu | 1-2 câu | 2 câu | 2 câu | 2 câu |
| Task Management | 1 câu | 1 câu | 1-2 câu | 1-2 câu | 1 câu |
| Self-study & Career | 1 câu | 1 câu | 1 câu | 1 câu | 1 câu |
| Risk Identification | Skip | 1 câu | 1-2 câu | 2 câu | 1-2 câu |
| **Stimulation (BẮT BUỘC)** | **1 câu** | **1 câu** | **1 câu** | **1 câu** | **1 câu** |
| BA Lead/Leadership | Skip | Skip | Skip | Optional | **5-7 câu** |

### Kỳ vọng điểm theo Level:
| Level | Expected Score | Ghi chú |
|-------|---------------|---------|
| Fresher | 2.0 - 3.0 | Hiểu concept, có nền tảng lý thuyết |
| Junior | 2.5 - 3.5 | Có kinh nghiệm cơ bản, áp dụng được |
| Middle | 3.0 - 4.0 | Kinh nghiệm thực chiến, tự chủ được |
| Senior | 3.5 - 4.5 | Expert, mentor được người khác |
| Lead | 4.0 - 5.0 | Leadership + strategic thinking |

---

## SCORING OUTPUT FORMAT

Khi chấm điểm, AI sẽ output theo format sau:

```
=== BA INTERVIEW SCORECARD ===

--- THÔNG TIN PHỎNG VẤN ---
Account người phỏng vấn: [tram.nguyen2 / có thể thay đổi]
Division: [Gex 1 / Gex 2 / Gex 3 / Gex 4]
Họ tên ứng viên: [Họ tên đầy đủ]
Vị trí ứng tuyển: Business Analyst
Ngày phỏng vấn: [dd/mm/yyyy]

--- DETAILED SCORING ---

| # | Question (tóm tắt) | Category | Score | Notes |
|---|---------------------|----------|-------|-------|
| 1 | ... | ... | x/5 | ... |
| 2 | ... | ... | x/5 | ... |
| ... | ... | ... | ... | ... |

--- EXTRA QUESTIONS (ngoài template) ---
| # | Question | Mapped to Category | Score | Notes |
|---|----------|-------------------|-------|-------|

--- SUMMARY ---
Total Questions Asked: xx
Average Score: x.x / 5.0
Expected for Level: x.x - x.x

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
[ ] Intern
[ ] Fresher
[ ] Junior
[ ] Middle
[ ] Senior
[ ] Lead
[ ] PM
[ ] Manager
[ ] Director
[ ] Vice Manager
[ ] Khác: [Mô tả rõ, VD: "Junior(-) vì bạn có ngoại ngữ tốt, có thể đào tạo được"]

--- KẾT LUẬN ---
[ ] Nên tuyển
[ ] Không đạt
[ ] Khác (cân nhắc): [Mô tả chi tiết]

--- NHẬN XÉT KHÁC ---
...
```

## Final Rating Scale
| Total Score | Rating | Recommendation |
|-------------|--------|----------------|
| 4.5 - 5.0 | Outstanding | Strong Hire |
| 3.5 - 4.4 | Good | Hire |
| 2.5 - 3.4 | Average | Consider with conditions |
| 1.5 - 2.4 | Below Average | Not recommended |
| 0 - 1.4 | Poor | Reject |

## Rating theo Level (điều chỉnh kỳ vọng):
| Level | Strong Hire | Hire | Consider | Not Recommended |
|-------|-------------|------|----------|-----------------|
| Fresher | ≥3.5 | 2.5-3.4 | 2.0-2.4 | <2.0 |
| Junior | ≥4.0 | 3.0-3.9 | 2.5-2.9 | <2.5 |
| Middle | ≥4.2 | 3.5-4.1 | 3.0-3.4 | <3.0 |
| Senior | ≥4.5 | 3.8-4.4 | 3.3-3.7 | <3.3 |
| Lead | ≥4.7 | 4.0-4.6 | 3.5-3.9 | <3.5 |

---

## FILES REFERENCE
- **Question Bank:** BA_Question_Bank.md (Categories 1-13)
- **Stimulation & Leadership:** BA_Stimulation_Leadership.md (Categories 14-15)

---

## WORKFLOW

### Bước 1: Nhận CV
1. **Convert PDF → MD:** Chạy script `tools/pdf2md.py` để convert CV từ PDF sang Markdown
   - Single file: `python tools/pdf2md.py "CV/<filename>.pdf"`
   - Batch: `python tools/pdf2md.py --batch "CV/"`
   - Script tự động xóa file PDF sau khi convert thành công
   - File MD được lưu cùng folder với tên gốc (VD: `CV/377.md`)
2. **AI phân tích CV (file .md)** → xác định Level dựa trên kinh nghiệm, skills, background
3. **Generate ~15 câu hỏi suggested** (từ Question Bank) phù hợp với level và background
4. **Câu Stimulation** (Bài tập 2 - BA Reporting System) luôn có trong mọi buổi interview
5. **Lưu file câu hỏi vào folder:** `Interview Question/`
   - **Template tên file:** `[TênỨngViên]_[ddmmyyyy]_interview-question.md`
   - Tên: viết liền không dấu, PascalCase
   - Ngày: ngày phỏng vấn
   - Ví dụ: `TrinhVanNam_18052026_interview-question.md`
   - Ví dụ: `NguyenThiLan_20052026_interview-question.md`

### Bước 2: Nhận transcript interview
- Identify tất cả câu hỏi BA Lead đã hỏi
- Map câu hỏi vào categories (bao gồm câu ngoài lề)
- Chấm điểm từng câu

### Bước 3: Output scorecard & Lưu file
- Output theo format SCORING OUTPUT FORMAT ở trên
- Đưa ra recommendation dựa trên level-adjusted rating
- **Lưu file vào folder:** `Scoring/`
- **Template tên file:** `BA-[Level]-[HọTênỨngViên]-[dd-mm-yyyy].md`
  - Level: Intern, Fresher, Junior, Middle, Senior, Lead, PM, Manager, Director, ViceManager, Other
  - Tên: viết liền không dấu, PascalCase
  - Ngày: ngày phỏng vấn
  - Ví dụ: `BA-Junior-MinhNguyen-15-05-2026.md`
  - Ví dụ: `BA-Middle-ThanhLe-20-05-2026.md`
