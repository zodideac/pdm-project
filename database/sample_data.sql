INSERT INTO Student VALUES
(1, 'Nguyen', 'Van', 'An', 'M', '2003-05-10', 'Hanoi'),
(2, 'Tran', 'Thi', 'Binh', 'F', '2004-07-21', 'Da Nang'),
(3, 'Le', 'Thanh', 'Hung', 'M', '2003-11-12', 'HCM'),
(4, 'Pham', 'Ngoc', 'Lan', 'F', '2004-03-03', 'Hue'),
(5, 'Hoang', 'Gia', 'Khanh', 'M', '2005-01-15', 'Hanoi'),
(6, 'Do', 'Thi', 'Thu', 'F', '2003-02-20', 'Quang Ninh'),
(7, 'Bui', 'Minh', 'Hoang', 'M', '2004-04-18', 'Hai Phong'),
(8, 'Phan', 'Kim', 'Ngan', 'F', '2005-08-22', 'HCM'),
(9, 'Dao', 'Tuan', 'Kiet', 'M', '2003-09-05', 'Da Lat'),
(10, 'Vo', 'Dieu', 'Anh', 'F', '2004-12-30', 'Can Tho');

INSERT INTO Staff VALUES
(100, 'Dr. Nguyen Hung', 'Doctor', 'HCM'),
(101, 'Pham Trung Truc', 'Nurse', 'HCM'),
(102, 'Dr. Le Thi Hoa', 'Doctor', 'Hanoi'),
(103, 'Nguyen Van Phuc', 'Specialist', 'Da Nang'),
(104, 'Tran Thi Ngoc Minh', 'Nurse', 'Hue');

INSERT INTO Illness VALUES
('Flu', 'Cough, fever', 'Paracetamol', '3-5 days'),
('Covid-19', 'Fever, cough, tiredness', 'Molnupiravir', '7-14 days'),
('Dengue Fever', 'High fever, bleeding', 'ORS + Paracetamol', '7 days'),
('Chickenpox', 'Itchy rash, blisters', 'Acyclovir', '10-14 days'),
('Food Poisoning', 'Vomiting, diarrhea', 'ORS, probiotics', '1-3 days');

INSERT INTO Appointment VALUES
(1, 1, 100, '2025-10-25 09:00:00'),
(2, 2, 101, '2025-10-25 10:30:00'),
(3, 3, 102, '2025-10-26 08:00:00'),
(4, 4, 103, '2025-10-26 14:00:00'),
(5, 5, 100, '2025-10-27 09:45:00'),
(6, 6, 104, '2025-10-27 11:15:00'),
(7, 7, 101, '2025-10-28 13:00:00'),
(8, 8, 102, '2025-10-28 15:30:00'),
(9, 9, 103, '2025-10-29 10:00:00'),
(10, 10, 104, '2025-10-29 16:00:00');

INSERT INTO Report VALUES
('Recovered well', 1, 'Flu', 'Mild flu symptoms', 'Paracetamol'),
('Still under treatment', 2, 'Covid-19', 'Cough and fever', 'Molnupiravir'),
('Recovered', 3, 'Food Poisoning', 'Stomach pain reduced', 'ORS'),
('Needs follow-up', 4, 'Dengue Fever', 'Low platelet count', 'Paracetamol'),
('Under observation', 5, 'Flu', 'Sore throat and fever', 'Paracetamol'),
('Recovered slowly', 6, 'Chickenpox', 'Skin blisters healing', 'Acyclovir'),
('Stable condition', 7, 'Covid-19', 'Fatigue improving', 'Molnupiravir'),
('Recovered', 8, 'Flu', 'Light cough', 'Paracetamol'),
('Follow-up required', 9, 'Dengue Fever', 'Weakness persists', 'ORS'),
('Recovered fully', 10, 'Food Poisoning', 'Digestive system normal', 'ORS');
