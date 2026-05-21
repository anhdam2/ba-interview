# BA Interview Skill for Claude Code

Skill tự động hỗ trợ quy trình phỏng vấn BA: tạo câu hỏi từ CV, chấm điểm transcript, so sánh ứng viên.

## Cài đặt

```bash
cd skill/
./setup.sh
```

Script sẽ:
1. Copy skill vào `~/.claude/skills/ba-interview/`
2. Tạo Python venv (nếu chưa có) tại `~/.claude/skills/.venv/`
3. Cài `pymupdf4llm` để convert PDF → Markdown
4. Verify toàn bộ files

**Yêu cầu:** Python 3.9+, Claude Code CLI.

---

## Chức năng

| Mode | Input | Output |
|------|-------|--------|
| **Prep** | CV file (`.md` hoặc `.pdf`) | ~15 câu hỏi phỏng vấn tailored theo level + background |
| **Score** | Transcript phỏng vấn | Scorecard chi tiết với điểm 0-5 từng câu, đánh giá level, kết luận |
| **Compare** | 2+ scorecard files | Bảng so sánh ứng viên, ranking, recommendation |

### Auto-detection

Skill tự nhận diện mode từ nội dung file:
- CV → chứa "experience", "education", "skills", "kinh nghiệm"
- Transcript → chứa Q&A, dialogue interviewer/candidate
- Scorecard → chứa "SCORECARD", "Average Score", scoring tables

PDF được tự động convert sang Markdown trước khi xử lý.

---

## Cách sử dụng

Chạy từ thư mục gốc project `ba-interview/`:

### 1. Tạo câu hỏi phỏng vấn từ CV

```
/ba-interview CV/377.md
```

Output: `Interview Question/{TênỨngViên}_{ddmmyyyy}_interview-question.md`

Skill sẽ:
- Phân tích CV → xác định level (Fresher/Junior/Middle/Senior/Lead)
- Chọn ~15 câu từ Question Bank theo level matrix
- Personalize câu hỏi theo skills/projects trong CV
- Thêm 1 bài Stimulation bắt buộc
- Kèm expected answers + scoring criteria cho từng câu

### 2. Chấm điểm transcript

```
/ba-interview Transcript/tom-tat-phong-van-candidate.md
```

Output: `Scoring/BA-{Level}-{Name}-{dd-mm-yyyy}.md`

Skill sẽ:
- Identify từng cặp Q&A trong transcript
- Map vào question bank (hoặc đánh "Extra" nếu ngoài template)
- Chấm điểm 0-5 theo rubric, ghi notes chi tiết
- Tính average score, đánh giá level, đưa kết luận (Nên tuyển / Không đạt / Cân nhắc)

### 3. So sánh ứng viên

```
/ba-interview compare Scoring/BA-Junior-MinhNguyen-15-05-2026.md Scoring/BA-Junior-TrinhVanNam-18-05-2026.md
```

Output: `Scoring/comparison-{dd-mm-yyyy}.md`

### 4. Interactive mode

```
/ba-interview
```

Hiện menu chọn mode nếu không truyền argument.

---

## Cấu trúc thư mục project

```
ba-interview/
├── CV/                        # CV ứng viên (.md hoặc .pdf)
├── Interview Question/        # Output câu hỏi phỏng vấn
├── Transcript/                # Transcript/tóm tắt buổi phỏng vấn
├── Scoring/                   # Output scorecard + comparison
├── BA-interview-question/     # Source question bank + templates
├── tools/                     # pdf2md.py gốc
└── skill/                     # Exportable skill package (thư mục này)
```

---

## Ngôn ngữ output

- Input tiếng Việt → output tiếng Việt
- Input tiếng Anh → output tiếng Anh
- Mixed → mặc định tiếng Việt

---

## Scoring Scale

| Score | Mô tả |
|-------|--------|
| 5 | Xuất sắc — insight, kinh nghiệm thực chiến |
| 4 | Tốt — ví dụ thực tế, logic rõ ràng |
| 3 | Trung bình — đúng cơ bản, thiếu chiều sâu |
| 2 | Dưới trung bình — hiểu biết cơ bản, nhiều lỗ hổng |
| 1 | Yếu — hiểu sai hoặc rất mơ hồ |
| 0 | Không trả lời |

---

## Troubleshooting

| Vấn đề | Giải pháp |
|---------|-----------|
| PDF convert lỗi | Kiểm tra `~/.claude/skills/.venv/bin/python3 -c "import pymupdf4llm"` |
| Skill không nhận diện mode | Truyền rõ file path, đảm bảo file có nội dung đúng format |
| Output path sai | Chạy từ thư mục gốc `ba-interview/`, không phải subfolder |
| Thiếu venv | Chạy lại `./setup.sh` |
