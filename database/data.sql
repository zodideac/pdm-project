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
