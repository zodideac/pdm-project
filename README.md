# University Healthcare Database Project

##  1. Project Overview
This project manages university healthcare data including students, staff, illnesses, appointments, and medical reports.

Technologies used:
- MySQL Workbench 8.0
- Java (JDK 8+)
- JDBC Connector
- IDE: NetBeans / IntelliJ (without Maven)

---

##  2. Setup Instructions
### 2.1. Database Setup
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
### 2.2. Add JDBC library (used to allow Java to connect to MySQL)
1. Open the project in **VSCode**.
2. **Press `Ctrl + Shift + P`** → search for **Project Settings**.
3. Go to the **libraries** tab → **Add Library**.
4. Select the following file: `mysql-connector-j-9.5.0.jar` in the `lib` folder.
5. Click **Apply Settings** to save.


