# University Healthcare Database Project

## 1. Project Overview
This project manages university healthcare data including:
- Student
- Disease
- Medical_staff
- Appointment
- Alert
- Prescription
- Treatment
- Report

### Technologies
- **MySQL Workbench 8.0**
- **Java (JDK 8+)**
- **JDBC Connector**
- **IDE:** NetBeans / IntelliJ / VSCode (no Maven)

---

##  2. Setup Instructions
### 2.1 Database Setup
1. Open **MySQL Workbench**
2. Create connection:
   - Hostname: `localhost`
   - Port: `3306`
   - Username: `root` (or your local user)
   - Password: `123456`
3. File → Open SQL Script → select `schema_only.sql`
   - **Press `Ctrl + Shift + Enter`**
4. File → Open SQL Script → select `sample_data.sql`
   - **Press `Ctrl + Shift + Enter`**
5. Right-click database → Refresh (or press `Ctrl + R`)

✔️ Database is now ready.

### 2.2 Java Project Setup

> *JDBC driver (`mysql-connector-j-9.5.0.jar`) is already included and referenced in the project settings.*  
> No additional configuration required.

---

## 3. Running the Application
1. Open the project in your IDE
2. Ensure MySQL server is running
3. Run `Main.java`
