CREATE DATABASE university_healthcare;
USE university_healthcare;
CREATE TABLE Student (
    S_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Sex CHAR(1),
    Birth_date DATE,
    Address VARCHAR(100)
);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Staff_Name VARCHAR(100),
    S_Role VARCHAR(50),
    S_Address VARCHAR(100)
);

CREATE TABLE Illness (
    I_Name VARCHAR(100) PRIMARY KEY,
    I_Symptom VARCHAR(255),
    I_Treatment VARCHAR(255),
    I_Timeline VARCHAR(100)
);

CREATE TABLE Appointment (
    A_ID INT PRIMARY KEY,
    S_ID INT,
    Staff_ID INT,
    Time DATETIME,
    FOREIGN KEY (S_ID) REFERENCES Student(S_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Report (
    R_Note VARCHAR(255),
    A_ID INT,
    I_Name VARCHAR(100),
    S_Diagnosis VARCHAR(255),
    I_Treatment VARCHAR(255),
    PRIMARY KEY (A_ID, I_Name),
    FOREIGN KEY (A_ID) REFERENCES Appointment(A_ID),
    FOREIGN KEY (I_Name) REFERENCES Illness(I_Name)
);
