USE UniversityHealthSystem;

-- Insert Students 
INSERT INTO Student (first_name, last_name, date_of_birth, gender, email, phone, address) VALUES
('An', 'Nguyễn Văn', '2001-05-15', 'Nam', 'an.nguyen@student.uni.edu.vn', '0901234567', '123 Đường Nguyễn Trãi, Quận 1, TP.HCM'),
('Bình', 'Trần Thị', '2002-08-20', 'Nữ', 'binh.tran@student.uni.edu.vn', '0902345678', '456 Đường Lê Lợi, Quận 1, TP.HCM'),
('Cường', 'Lê Hùng', '2000-12-10', 'Nam', 'cuong.le@student.uni.edu.vn', '0903456789', '789 Đường Điện Biên Phủ, Quận 3, TP.HCM'),
('Dung', 'Phạm Thùy', '2003-03-25', 'Nữ', 'dung.pham@student.uni.edu.vn', '0904567890', '101 Đường Pasteur, Quận 3, TP.HCM'),
('Em', 'Hoàng Đức', '2001-07-01', 'Nam', 'em.hoang@student.uni.edu.vn', '0905678901', '202 Đường Hai Bà Trưng, Quận 1, TP.HCM');

-- Insert Medical Staff 
INSERT INTO Medical_Staff (first_name, last_name, role, department, email, phone) VALUES
('Phúc', 'Nguyễn Tâm', 'Bác sĩ', 'Khoa Nội', 'phuc.nguyen@hospital.uni.edu.vn', '0911223344'),
('Lan', 'Vũ Thị', 'Y tá', 'Cấp cứu', 'lan.vu@hospital.uni.edu.vn', '0912334455'),
('Hưng', 'Đỗ Minh', 'Bác sĩ', 'Khoa Ngoại', 'hung.do@hospital.uni.edu.vn', '0913445566'),
('Mai', 'Lý Thanh', 'Dược sĩ', 'Nhà thuốc', 'mai.ly@hospital.uni.edu.vn', '0914556677'),
('Tuấn', 'Trịnh Quốc', 'Quản trị viên', 'Hành chính', 'tuan.trinh@hospital.uni.edu.vn', '0915667788');

-- Insert Diseases
INSERT INTO Disease (name, description, severity, contagious) VALUES
('Cúm mùa (Seasonal Flu)', 'Nhiễm trùng đường hô hấp do virus cúm gây ra.', 'Nhẹ', TRUE),
('Sốt xuất huyết (Dengue)', 'Bệnh truyền nhiễm do muỗi vằn đốt.', 'Nặng', FALSE),
('Đau dạ dày (Gastritis)', 'Viêm niêm mạc dạ dày gây đau bụng.', 'Trung bình', FALSE),
('Viêm họng (Pharyngitis)', 'Viêm sưng vùng họng.', 'Nhẹ', TRUE),
('Dị ứng phấn hoa (Pollen Allergy)', 'Phản ứng dị ứng với phấn hoa.', 'Nhẹ', FALSE);

-- ==========================================
-- 2. POPULATE DEPENDENT TABLES (Level 1)
-- ==========================================

-- Insert Alerts (Linked to Diseases)
INSERT INTO Alert (disease_id, message, severity, alert_date) VALUES
(1, 'Mùa cúm đang đến, sinh viên nên tiêm phòng.', 'Thấp', '2023-10-01 08:00:00'),
(2, 'Cảnh báo dịch sốt xuất huyết bùng phát tại ký túc xá khu B.', 'Cao', '2023-10-05 09:30:00'),
(4, 'Gia tăng các ca viêm họng do thay đổi thời tiết.', 'Trung bình', '2023-11-01 10:00:00');

-- Insert Appointments (Linked to Student & Staff)
-- Assuming IDs 1-5 exist for both tables based on previous inserts
INSERT INTO Appointment (student_id, staff_id, appt_date, appt_time, status, appt_type, room) VALUES
(1, 1, '2023-10-10', '09:00:00', 'Completed', 'Khám tổng quát', 'P101'),
(2, 1, '2023-10-10', '09:30:00', 'Completed', 'Khám bệnh', 'P101'),
(3, 3, '2023-10-11', '10:00:00', 'Scheduled', 'Tái khám', 'P102'),
(1, 2, '2023-10-12', '14:00:00', 'Cancelled', 'Tiêm phòng', 'P201'),
(4, 1, '2023-10-15', '15:30:00', 'Scheduled', 'Cấp cứu nhẹ', 'P101');

-- ==========================================
-- 3. POPULATE DEEP DEPENDENT TABLES (Level 2)
-- ==========================================

-- Insert Treatments (Linked to Staff & Disease)
INSERT INTO Treatment (staff_id, diagnosis_id, treatment_plan, start_date, end_date) VALUES
(1, 1, 'Nghỉ ngơi, uống nhiều nước, dùng thuốc hạ sốt.', '2023-10-10', '2023-10-15'),
(1, 3, 'Hạn chế đồ chua cay, uống thuốc tráng dạ dày.', '2023-10-10', '2023-10-24'),
(3, 2, 'Theo dõi tiểu cầu, truyền dịch nếu cần thiết.', '2023-10-11', '2023-10-20');

-- Insert Reports (Linked to Appointment & Student)
-- Note: appointment_id 1 corresponds to student_id 1
--       appointment_id 2 corresponds to student_id 2
INSERT INTO Report (appointment_id, student_id, created_at, current_status, notes) VALUES
(1, 1, '2023-10-10 09:20:00', 'Finalized', 'Sinh viên có triệu chứng mệt mỏi nhẹ, không sốt.'),
(2, 2, '2023-10-10 09:50:00', 'Finalized', 'Đau vùng thượng vị, buồn nôn.'),
(3, 3, '2023-10-11 10:20:00', 'Draft', 'Sốt cao ngày thứ 2, nghi ngờ sốt xuất huyết.');

-- Insert Prescriptions (Linked to Report & Treatment)
INSERT INTO Prescription (report_id, treatment_id, medication_name, dosage, frequency, start_date, end_date) VALUES
(1, 1, 'Paracetamol', '500mg', 'Khi cần (tối đa 4 viên/ngày)', '2023-10-10', '2023-10-13'),
(1, 1, 'Vitamin C', '1000mg', '1 viên mỗi sáng', '2023-10-10', '2023-10-20'),
(2, 2, 'Phosphalugel', '20g', '3 lần/ngày trước ăn', '2023-10-10', '2023-10-17'),
(3, 3, 'Oresol', 'Gói bột', 'Pha 1 gói với 1 lít nước, uống thay nước lọc', '2023-10-11', '2023-10-15');

-- ==========================================
-- VERIFICATION QUERIES
-- ==========================================

-- Check full appointment details
SELECT 
    a.appointment_id,
    CONCAT(s.last_name, ' ', s.first_name) AS Student_Name,
    CONCAT(m.last_name, ' ', m.first_name) AS Doctor_Name,
    a.appt_date,
    a.status
FROM Appointment a
JOIN Student s ON a.student_id = s.student_id
JOIN Medical_Staff m ON a.staff_id = m.staff_id;

-- Check prescriptions for specific students
SELECT 
    s.first_name AS Student,
    p.medication_name,
    p.dosage
FROM Prescription p
JOIN Report r ON p.report_id = r.report_id
JOIN Student s ON r.student_id = s.student_id;