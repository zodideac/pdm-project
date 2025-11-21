# University Healthcare Database Project

##  1. Project Overview
This project manages university healthcare data including students, staff, illnesses, appointments, and medical reports.

Technologies used:
- MySQL Workbench 8.0
- Java (JDK 8+)
- JDBC Connector
- IDE: NetBeans / IntelliJ (without Maven)

---

##  2. Folder Structure
project/
│── src/  # Backend Java files
│ ├── DBConnection.java
│ ├── StudentDAO.java
│ ├── Student.java
│ └── Main.java
│
│── lib/
│ └── mysql-connector-j-8.0.xx.jar
│
│── database/
│ ├── schema.sql  # Database & table creation
│ └── sample_data.sql  # Insert sample data
│
│── README.md

---

##  3. Setup Instructions
### 3.1. Database Setup
1. Open **MySQL Workbench**
2. Create connection:
   - Hostname: `localhost`
   - Port: `3306`
   - Username: `root` (or your local user)
3. File → Open SQL Script → select `schema_only.sql`
   - **Press `Ctrl + Shift + Enter`**
4. File → Open SQL Script → select `sample_data.sql`
   - **Press `Ctrl + Shift + Enter`**
5. Right-click database → Refresh (or press `Ctrl + R`)


