# BA Interview - Stimulation & Leadership Questions

---

## CATEGORY 14: STIMULATION - BẮT BUỘC TRONG MỌI INTERVIEW

### Bài tập 1: Elicit requirements - Shopee buying a dress with ShopeePay
**Level:** Fresher, Junior, Middle

**Evaluation Criteria:**

**A. Elicitation Approach (khả năng hỏi đúng câu hỏi)**
- Clarify scope, identify stakeholders/actors
- Business context và constraints
- Edge cases và exceptions

**B. Functional Breakdown (expected functions):**
1. Browse/Search products (dress category)
2. View product details (size, color, price, reviews)
3. Add to cart
4. Select payment method (ShopeePay)
5. Check ShopeePay balance
6. Apply voucher/discount
7. Confirm order
8. Payment processing
9. Order confirmation/notification
10. Order tracking

**C. Non-functional Considerations:**
- Performance, Security, UX, Error handling

**Scoring:**
- 5: 8+ functions, edge cases, structured, non-functional
- 4: 6-7 functions, structure, some edge cases
- 3: 4-5 functions, basic flow only
- 2: 2-3 functions, miss critical steps
- 1: Cannot break down

---

### Bài tập 2: BA Reporting System with AI (BẮT BUỘC - MỌI LEVEL)
**Level:** Fresher, Junior, Middle, Senior, Lead

**Đề bài:**
Một BA Lead muốn build hệ thống để:
- Các BA có thể vào report công việc
- Division Manager có thể view reports
- AI có thể summarize reports và đưa ra issues
- Giúp leadership nắm rõ tình hình và phân bổ hợp lý

**Yêu cầu:** Break ra 4-5 Use Cases cơ bản.

**Expected Answer (Mức tốt - 4-5 điểm):**

**Use Case 1: Đăng nhập và Phân quyền (Authentication & RBAC)**
- Hệ thống có các vai trò: BA, BA Leader, Manager, Division Manager
- Mỗi role có quyền truy cập khác nhau
- BA: chỉ report và xem report của mình
- BA Leader: xem tất cả reports của team, review, feedback
- Manager/Division Manager: xem dashboard, AI summary

**Use Case 2: Quản lý Project (BA Leader)**
- BA Leader tạo và quản lý projects
- Có thể theo dạng task/project
- Gán BA members vào projects (BA không tự chọn project)
- Quản lý resource, cấp quyền truy cập
- Chuyển đổi vai trò khi BA member lên BA Lead

**Use Case 3: BA Report Task (Weekly Report)**
- BA báo cáo task hàng tuần vào hệ thống
- Mỗi dòng báo cáo = một dự án đã được gán
- Các trường: đã làm gì, đang làm gì, trở ngại gì, kế hoạch tiếp theo
- Có thể đính kèm bằng chứng (files, screenshots)
- BA chỉ report vào projects đã được gán (không tự chọn)

**Use Case 4: Dashboard & Báo cáo tổng hợp**
- Trang báo cáo dạng dashboard
- Bộ lọc: theo team, project, thời gian, BA member
- Visualize: progress, blockers, workload distribution
- Dành cho Manager/Division Manager

**Use Case 5: Xem Chi tiết & Review**
- BA Leader xem chi tiết report của từng BA
- Chức năng review, approve/reject
- Feedback trực tiếp trên report
- History tracking

**Use Case 6: AI Chatbot & Summarize**
- AI tự động summarize reports theo tuần/tháng
- Highlight issues, blockers, risks
- Đưa ra suggestions cho resource allocation
- Chatbot để query thông tin nhanh

**Góp ý thêm (Bonus points nếu candidate nêu được):**
- Quản lý project: Nên thêm quản lý resource để cấp quyền hoặc chuyển đổi vai trò
- Report task: Không nên để BA tự chọn project → gán project trước, BA report vào project đã gán
- Notification system khi có report mới hoặc feedback
- Export reports (PDF, Excel)
- Audit trail / version history

**Scoring theo Level:**

| Level | Kỳ vọng | Điểm 3 | Điểm 4 | Điểm 5 |
|-------|---------|---------|---------|---------|
| Fresher | 3-4 UC cơ bản | Nêu 3 UC, thiếu detail | 4 UC, có detail cơ bản | 4-5 UC, có edge cases |
| Junior | 4-5 UC có detail | Nêu 3-4 UC, basic | 4-5 UC, có fields rõ | 5+ UC, có góp ý |
| Middle | 5-6 UC + góp ý | 4 UC, thiếu depth | 5 UC, có detail + roles | 6 UC + góp ý + NFR |
| Senior | 5-6 UC + góp ý + NFR | 4-5 UC, basic | 5-6 UC + góp ý | 6 UC + NFR + architecture |
| Lead | 6 UC + system thinking | 5 UC, có detail | 6 UC + góp ý + roadmap | Full + strategy + phasing |

**Chi tiết Scoring:**
- 5: Nêu đủ 5-6 UC, detail fields, roles rõ ràng, có góp ý cải tiến (gán project, resource management), consider NFR
- 4: Nêu 4-5 UC, có detail, hiểu roles, logic flow hợp lý
- 3: Nêu 3-4 UC cơ bản, thiếu detail hoặc thiếu roles
- 2: Nêu 2-3 UC, mơ hồ, thiếu logic
- 1: Không break down được hoặc chỉ 1 UC

---

## CATEGORY 15: BA LEAD / LEADERSHIP (Chỉ cho Senior & Lead)

### Q15.1: What is the team size?
**Level:** Senior, Lead

**Expected Answer:**
- Team size, composition (junior/mid/senior)
- How team grew over time

**Skills:** Leadership experience

**Scoring:**
- 5: Clear structure, growth story, diverse composition
- 4: Nêu rõ size và composition
- 3: Chỉ nêu số lượng
- 2: Mơ hồ
- 1: Chưa lead team

---

### Q15.2: How do you assign tasks? Criteria?
**Level:** Senior, Lead

**Expected Answer:**
- Criteria: skill level, domain knowledge, workload, growth opportunity
- Methods: capacity planning, skill matrix, rotation
- Balance efficiency vs development

**Skills:** Resource management, Strategic thinking

**Scoring:**
- 5: Framework rõ ràng, balance efficiency + growth, ví dụ
- 4: Criteria cụ thể, logical
- 3: Assign nhưng chưa có criteria rõ
- 2: Random
- 1: Không biết

---

### Q15.3: How do you manage members' output?
**Level:** Senior, Lead

**Expected Answer:**
- Review deliverables: quality checklist, peer review
- Regular 1-on-1, feedback sessions
- Metrics: on-time delivery, rework rate
- Templates, guidelines, standards
- Coaching khi quality chưa đạt

**Skills:** Quality management, Mentoring

**Scoring:**
- 5: System review + metrics + coaching, continuous improvement
- 4: Process review rõ ràng
- 3: Review ad-hoc
- 2: Chỉ check cuối
- 1: Không manage

---

### Q15.4: Solve conflict between BA members?
**Level:** Senior, Lead

**Expected Answer:**
- Listen both sides separately
- Identify root cause
- Facilitate discussion, common ground
- Set expectations, follow up
- Prevent: clear roles, team agreements

**Skills:** Conflict resolution, Emotional intelligence

**Scoring:**
- 5: Structured approach, empathy, prevention, real example
- 4: Approach rõ ràng, fair
- 3: Biết cần resolve nhưng thiếu method
- 2: Avoid hoặc authoritarian
- 1: Không biết

---

### Q15.5: How do you define KPI for team?
**Level:** Lead

**Expected Answer:**
- Factors: delivery quality, timeliness, stakeholder feedback, growth
- SMART criteria
- Balance quantitative + qualitative
- Align với company goals
- Regular review

**Skills:** Performance management, Strategic alignment

**Scoring:**
- 5: SMART KPIs, balanced scorecard, aligned business goals
- 4: KPI framework rõ ràng
- 3: Có KPI nhưng chưa comprehensive
- 2: Chỉ 1 factor
- 1: Không define

---

### Q15.6: Career path for team members?
**Level:** Lead

**Expected Answer:**
- Individual development plans (IDP)
- Regular career conversations
- Identify strengths, gaps, interests
- Map to growth paths (specialist vs management)
- Track progress

**Skills:** People development, Mentoring

**Scoring:**
- 5: IDP process, regular conversations, success stories
- 4: Active career development, framework
- 3: Discuss nhưng không systematic
- 2: Chỉ khi member hỏi
- 1: Không support

---

### Q15.7: Training for team? Topics? Documents?
**Level:** Lead

**Expected Answer:**
- Topics: BA fundamentals, tools, domain, soft skills
- Methods: workshops, pair work, shadowing
- Materials: playbooks, templates, knowledge base
- Measure effectiveness

**Skills:** Knowledge transfer, Teaching ability

**Scoring:**
- 5: Training program, multiple methods, measure effectiveness
- 4: Regular training, materials
- 3: Occasional, basic materials
- 2: Chỉ share documents
- 1: Không training

---
