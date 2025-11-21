-- Create the database
CREATE DATABASE IF NOT EXISTS UniversityHealthSystem;

USE UniversityHealthSystem;

-- ==========================================
-- 1. INDEPENDENT TABLES (No Foreign Keys)
-- ==========================================

-- Table: Student
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- Table: Medical_Staff
CREATE TABLE Medical_Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL, -- e.g., Doctor, Nurse, Admin
    department VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Table: Disease
CREATE TABLE Disease (
    disease_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    severity VARCHAR(20), -- e.g., Mild, Moderate, Severe
    contagious BOOLEAN
);

-- ==========================================
-- 2. DEPENDENT TABLES (Level 1)
-- ==========================================

-- Table: Alert
-- Relationship: Disease triggers Alert
CREATE TABLE Alert (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    disease_id INT,
    message TEXT,
    severity VARCHAR(20),
    alert_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (disease_id) REFERENCES Disease(disease_id) ON DELETE CASCADE
);

-- Table: Appointment
-- Relationship: Student schedules Appointment, Staff attends Appointment
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    staff_id INT NOT NULL,
    appt_date DATE NOT NULL,
    appt_time TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled', -- Scheduled, Completed, Cancelled
    appt_type VARCHAR(50), -- Checkup, Emergency, Follow-up
    room VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES Medical_Staff(staff_id) ON DELETE CASCADE
);

-- ==========================================
-- 3. DEEP DEPENDENT TABLES (Level 2)
-- ==========================================

-- Table: Report
-- Relationship: Appointment has Report (1:1 or 1:Many)
-- Also links to Student directly based on ERD attributes, though redundant via Appointment
CREATE TABLE Report (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    student_id INT NOT NULL, -- Included based on ERD diagram
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    current_status VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE
);

-- Table: Treatment
-- Relationship: Linked to Staff and a specific Diagnosis (Disease)
CREATE TABLE Treatment (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT,
    diagnosis_id INT, -- References Disease based on naming convention in ERD
    treatment_plan TEXT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (staff_id) REFERENCES Medical_Staff(staff_id) ON DELETE SET NULL,
    FOREIGN KEY (diagnosis_id) REFERENCES Disease(disease_id) ON DELETE SET NULL
);

-- Table: Prescription
-- Relationship: Report includes Prescription, Refers to Treatment
CREATE TABLE Prescription (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT NOT NULL,
    treatment_id INT,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50), -- e.g., "500mg"
    frequency VARCHAR(50), -- e.g., "Twice daily"
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (report_id) REFERENCES Report(report_id) ON DELETE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES Treatment(treatment_id) ON DELETE SET NULL
);