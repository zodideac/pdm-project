-- MySQL dump 10.13  Distrib 8.0.x, for Win64 (x86_64)
--
-- Host: localhost    Database: university_health_db
-- ------------------------------------------------------
-- Server version    8.0.x

CREATE DATABASE IF NOT EXISTS `university_health_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `university_health_db`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- ------------------------------------------------------
-- Table structure for table `Student`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
  `student_id` VARCHAR(20) NOT NULL,
  `student_name` VARCHAR(200) NOT NULL,
  `date_of_birth` DATE DEFAULT NULL,
  `gender` ENUM('M','F','Other') DEFAULT 'Other',
  `phone` VARCHAR(30) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `address` TEXT,
  `diagnosis` TEXT,
  `treatment_status` VARCHAR(100) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Medical_Staff`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Medical_Staff`;
CREATE TABLE `Medical_Staff` (
  `staff_id` VARCHAR(20) NOT NULL,
  `staff_name` VARCHAR(200) NOT NULL,
  `specialty` VARCHAR(120) DEFAULT NULL,
  `department` VARCHAR(120) DEFAULT NULL,
  `gender` ENUM('M','F','Other') DEFAULT 'Other',
  `phone` VARCHAR(30) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `years_of_experience` INT DEFAULT NULL,
  `status` ENUM('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Disease`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Disease`;
CREATE TABLE `Disease` (
  `disease_id` VARCHAR(20) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `description` TEXT,
  `contagious` TINYINT(1) DEFAULT 0,
  `severity` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Medical_Record`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Medical_Record`;
CREATE TABLE `Medical_Record` (
  `record_id` CHAR(36) NOT NULL,
  `student_id` VARCHAR(20) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `current_status` VARCHAR(100) DEFAULT NULL,
  `notes` TEXT,
  PRIMARY KEY (`record_id`),
  KEY `fk_record_student_idx` (`student_id`),
  CONSTRAINT `fk_record_student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Diagnosis`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Diagnosis`;
CREATE TABLE `Diagnosis` (
  `diagnosis_id` CHAR(36) NOT NULL,
  `record_id` CHAR(36) NOT NULL,
  `disease_id` VARCHAR(20) NOT NULL,
  `diagnosis_date` DATE NOT NULL,
  `status` VARCHAR(30) DEFAULT 'active',
  `details` TEXT,
  PRIMARY KEY (`diagnosis_id`),
  KEY `fk_diag_record_idx` (`record_id`),
  KEY `fk_diag_disease_idx` (`disease_id`),
  CONSTRAINT `fk_diag_record` FOREIGN KEY (`record_id`) REFERENCES `Medical_Record` (`record_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diag_disease` FOREIGN KEY (`disease_id`) REFERENCES `Disease` (`disease_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Treatment`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Treatment`;
CREATE TABLE `Treatment` (
  `treatment_id` CHAR(36) NOT NULL,
  `diagnosis_id` CHAR(36) NOT NULL,
  `staff_id` VARCHAR(20) DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `end_date` DATE DEFAULT NULL,
  `treatment_plan` TEXT,
  PRIMARY KEY (`treatment_id`),
  KEY `fk_treat_diag_idx` (`diagnosis_id`),
  KEY `fk_treat_staff_idx` (`staff_id`),
  CONSTRAINT `fk_treat_diag` FOREIGN KEY (`diagnosis_id`) REFERENCES `Diagnosis` (`diagnosis_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_treat_staff` FOREIGN KEY (`staff_id`) REFERENCES `Medical_Staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Prescription`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Prescription`;
CREATE TABLE `Prescription` (
  `prescription_id` CHAR(36) NOT NULL,
  `treatment_id` CHAR(36) NOT NULL,
  `medication_name` VARCHAR(200) NOT NULL,
  `dosage` VARCHAR(100) DEFAULT NULL,
  `frequency` VARCHAR(100) DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `end_date` DATE DEFAULT NULL,
  `notes` TEXT,
  PRIMARY KEY (`prescription_id`),
  KEY `fk_presc_treat_idx` (`treatment_id`),
  CONSTRAINT `fk_presc_treat` FOREIGN KEY (`treatment_id`) REFERENCES `Treatment` (`treatment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Appointment`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Appointment`;
CREATE TABLE `Appointment` (
  `appointment_id` CHAR(36) NOT NULL,
  `student_id` VARCHAR(20) NOT NULL,
  `staff_id` VARCHAR(20) DEFAULT NULL,
  `appointment_date` DATE DEFAULT NULL,
  `appointment_time` TIME DEFAULT NULL,
  `appt_time` DATETIME GENERATED ALWAYS AS (TIMESTAMP(CONCAT(COALESCE(`appointment_date`,'1970-01-01'), ' ', COALESCE(`appointment_time`,'00:00:00')))) VIRTUAL,
  `appt_type` VARCHAR(50) DEFAULT NULL,
  `reason` TEXT,
  `room` VARCHAR(50) DEFAULT NULL,
  `status` ENUM('scheduled','completed','cancelled','missed') DEFAULT 'scheduled',
  `notes` TEXT,
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appt_student_idx` (`student_id`),
  KEY `fk_appt_staff_idx` (`staff_id`),
  CONSTRAINT `fk_appt_student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_appt_staff` FOREIGN KEY (`staff_id`) REFERENCES `Medical_Staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Report`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Report`;
CREATE TABLE `Report` (
  `report_id` CHAR(36) NOT NULL,
  `appointment_id` CHAR(36) DEFAULT NULL,
  `student_id` VARCHAR(20) DEFAULT NULL,
  `staff_id` VARCHAR(20) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `current_status` VARCHAR(100) DEFAULT NULL,
  `diagnosis` TEXT,
  `prescription` TEXT,
  `alert_status` VARCHAR(50) DEFAULT NULL,
  `recovery_status` VARCHAR(100) DEFAULT NULL,
  `notes` TEXT,
  PRIMARY KEY (`report_id`),
  KEY `fk_report_appointment_idx` (`appointment_id`),
  KEY `fk_report_student_idx` (`student_id`),
  KEY `fk_report_staff_idx` (`staff_id`),
  CONSTRAINT `fk_report_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `Appointment` (`appointment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_report_student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_report_staff` FOREIGN KEY (`staff_id`) REFERENCES `Medical_Staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Alert`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Alert`;
CREATE TABLE `Alert` (
  `alert_id` CHAR(36) NOT NULL,
  `disease_id` VARCHAR(20) DEFAULT NULL,
  `alert_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `severity` VARCHAR(30) DEFAULT NULL,
  `message` TEXT,
  PRIMARY KEY (`alert_id`),
  KEY `fk_alert_disease_idx` (`disease_id`),
  CONSTRAINT `fk_alert_disease` FOREIGN KEY (`disease_id`) REFERENCES `Disease` (`disease_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Alert_Affected_Student`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Alert_Affected_Student`;
CREATE TABLE `Alert_Affected_Student` (
  `alert_id` CHAR(36) NOT NULL,
  `student_id` VARCHAR(20) NOT NULL,
  `noted_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`,`student_id`),
  KEY `fk_aas_alert_idx` (`alert_id`),
  KEY `fk_aas_student_idx` (`student_id`),
  CONSTRAINT `fk_aas_alert` FOREIGN KEY (`alert_id`) REFERENCES `Alert` (`alert_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aas_student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Vaccination`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Vaccination`;
CREATE TABLE `Vaccination` (
  `vaccination_id` CHAR(36) NOT NULL,
  `student_id` VARCHAR(20) NOT NULL,
  `vaccine_name` VARCHAR(200) NOT NULL,
  `vaccination_date` DATE DEFAULT NULL,
  `dose` VARCHAR(50) DEFAULT NULL,
  `provider` VARCHAR(200) DEFAULT NULL,
  `notes` TEXT,
  PRIMARY KEY (`vaccination_id`),
  KEY `fk_vax_student_idx` (`student_id`),
  CONSTRAINT `fk_vax_student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------
-- Table structure for table `Vital_Sign`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `Vital_Sign`;
CREATE TABLE `Vital_Sign` (
  `vital_id` CHAR(36) NOT NULL,
  `record_id` CHAR(36) NOT NULL,
  `taken_at` DATETIME NOT NULL,
  `vital_type` VARCHAR(50) DEFAULT NULL,
  `value` VARCHAR(100) DEFAULT NULL,
  `notes` TEXT,
  PRIMARY KEY (`vital_id`),
  KEY `fk_vital_record_idx` (`record_id`),
  CONSTRAINT `fk_vital_record` FOREIGN KEY (`record_id`) REFERENCES `Medical_Record` (`record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- ------------------------------------------------------
-- Example (seed) data - small set to validate relationships
-- ------------------------------------------------------

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` (`student_id`,`student_name`,`date_of_birth`,`gender`,`phone`,`email`,`address`,`diagnosis`,`treatment_status`,`created_at`) VALUES
('S001','Nguyen Linh','2002-05-14','F','+84901234567','linh.nguyen@example.edu','Dorm A, Room 101','Influenza','under observation','2025-01-10 09:00:00'),
('S002','Tran An','2001-11-02','M','+84909876543','an.tran@example.edu','Dorm B, Room 210','Sprained Ankle','recovered','2024-09-11 10:30:00'),
('S003','Le Minh','2003-02-20','M','+84907654321','minh.le@example.edu','Off-campus','COVID-19','active','2025-03-05 11:00:00');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Medical_Staff` WRITE;
/*!40000 ALTER TABLE `Medical_Staff` DISABLE KEYS */;
INSERT INTO `Medical_Staff` (`staff_id`,`staff_name`,`specialty`,`department`,`gender`,`phone`,`email`,`years_of_experience`,`status`) VALUES
('STF01','Pham Trang','General Practitioner','Student Health Center','F','+84901112233','trang.pham@uni.edu',8,'Active'),
('STF02','Vu Hieu','Nurse','Student Health Center','M','+84904445566','hieu.vu@uni.edu',4,'Active'),
('STF03','Hoang Mai','Infectious Disease','Infectious Diseases','F','+84907778899','mai.hoang@uni.edu',12,'Active');
/*!40000 ALTER TABLE `Medical_Staff` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Disease` WRITE;
/*!40000 ALTER TABLE `Disease` DISABLE KEYS */;
INSERT INTO `Disease` (`disease_id`,`name`,`description`,`contagious`,`severity`) VALUES
('D001','Influenza','Seasonal influenza virus',1,'moderate'),
('D002','COVID-19','SARS-CoV-2 infection',1,'high'),
('D003','Sprained Ankle','Orthopedic injury',0,'low');
/*!40000 ALTER TABLE `Disease` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Medical_Record` WRITE;
/*!40000 ALTER TABLE `Medical_Record` DISABLE KEYS */;
INSERT INTO `Medical_Record` (`record_id`,`student_id`,`created_at`,`current_status`,`notes`) VALUES
('MR001','S001','2025-11-01 09:00:00','under observation','Presented with fever and sore throat'),
('MR002','S002','2025-10-10 10:30:00','recovered','Routine check after injury'),
('MR003','S003','2025-11-05 11:00:00','active','Respiratory symptoms');
/*!40000 ALTER TABLE `Medical_Record` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Diagnosis` WRITE;
/*!40000 ALTER TABLE `Diagnosis` DISABLE KEYS */;
INSERT INTO `Diagnosis` (`diagnosis_id`,`record_id`,`disease_id`,`diagnosis_date`,`status`,`details`) VALUES
('DIAG001','MR001','D001','2025-11-01','active','Rapid influenza test positive'),
('DIAG002','MR003','D002','2025-11-05','active','PCR positive'),
('DIAG003','MR002','D003','2025-10-10','recovered','Ankle sprain, recovered');
/*!40000 ALTER TABLE `Diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Treatment` WRITE;
/*!40000 ALTER TABLE `Treatment` DISABLE KEYS */;
INSERT INTO `Treatment` (`treatment_id`,`diagnosis_id`,`staff_id`,`start_date`,`end_date`,`treatment_plan`) VALUES
('TRT001','DIAG001','STF01','2025-11-01','2025-11-07','Rest, fluids, antiviral if prescribed'),
('TRT002','DIAG002','STF03','2025-11-05',NULL,'Isolate and supportive care'),
('TRT003','DIAG003','STF01','2025-10-10','2025-10-20','Physiotherapy and rest');
/*!40000 ALTER TABLE `Treatment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` (`prescription_id`,`treatment_id`,`medication_name`,`dosage`,`frequency`,`start_date`,`end_date`,`notes`) VALUES
('PRES001','TRT001','Oseltamivir','75 mg','twice daily','2025-11-01','2025-11-05','Prescribed by Dr. Trang Pham'),
('PRES002','TRT003','Ibuprofen','200 mg','three times daily','2025-10-10','2025-10-15','For pain control');
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` (`appointment_id`,`student_id`,`staff_id`,`appointment_date`,`appointment_time`,`appt_type`,`reason`,`room`,`status`,`notes`) VALUES
('APPT001','S001','STF01','2025-11-01','09:00:00','consult','Initial visit','Room 101','completed','Triage and consultation'),
('APPT002','S002','STF02','2025-10-10','10:30:00','follow-up','After ankle sprain','Room 110','completed','Review physiotherapy progress'),
('APPT003','S003','STF03','2025-11-05','11:00:00','consult','COVID test result follow-up','Room 120','scheduled','Discuss PCR result');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` (`report_id`,`appointment_id`,`student_id`,`staff_id`,`created_at`,`current_status`,`diagnosis`,`prescription`,`alert_status`,`recovery_status`,`notes`) VALUES
('RPT001','APPT001','S001','STF01','2025-11-02 08:00:00','under observation','Influenza','Oseltamivir','open','pending','Weekly influenza cluster report includes S001'),
('RPT002','APPT003','S003','STF03','2025-11-06 12:00:00','active','COVID-19','supportive care','open','isolated','COVID-19 confirmed case');
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Alert` WRITE;
/*!40000 ALTER TABLE `Alert` DISABLE KEYS */;
INSERT INTO `Alert` (`alert_id`,`disease_id`,`alert_date`,`severity`,`message`) VALUES
('ALRT001','D001','2025-11-03 08:00:00','medium','Several influenza cases detected in Dorm A'),
('ALRT002','D002','2025-11-06 12:30:00','high','COVID-19 confirmed cluster in Engineering Dept');
/*!40000 ALTER TABLE `Alert` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Alert_Affected_Student` WRITE;
/*!40000 ALTER TABLE `Alert_Affected_Student` DISABLE KEYS */;
INSERT INTO `Alert_Affected_Student` (`alert_id`,`student_id`,`noted_at`) VALUES
('ALRT001','S001','2025-11-03 08:05:00'),
('ALRT002','S003','2025-11-06 12:35:00');
/*!40000 ALTER TABLE `Alert_Affected_Student` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Vaccination` WRITE;
/*!40000 ALTER TABLE `Vaccination` DISABLE KEYS */;
INSERT INTO `Vaccination` (`vaccination_id`,`student_id`,`vaccine_name`,`vaccination_date`,`dose`,`provider`,`notes`) VALUES
('VAX001','S001','Influenza (2025)','2025-10-01','single','Campus Clinic','Annual flu shot'),
('VAX002','S002','HPV Series - Dose 1','2024-02-15','1','Campus Clinic',''),
('VAX003','S003','COVID-19 Booster (2025)','2025-04-10','booster','Public Health Center','');
/*!40000 ALTER TABLE `Vaccination` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Vital_Sign` WRITE;
/*!40000 ALTER TABLE `Vital_Sign` DISABLE KEYS */;
INSERT INTO `Vital_Sign` (`vital_id`,`record_id`,`taken_at`,`vital_type`,`value`,`notes`) VALUES
('VIT001','MR001','2025-11-01 09:10:00','temperature','38.6 C','measured at triage'),
('VIT002','MR001','2025-11-02 08:30:00','temperature','37.2 C','follow-up');
/*!40000 ALTER TABLE `Vital_Sign` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'basit','basit@gmail.com','basit123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

-- restore session vars
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
