package model;

import java.sql.Date;
import java.sql.Time;

public class Appointment {
    private int appointmentId;
    private int studentId;
    private int staffId;
    private Date apptDate;
    private Time apptTime;
    private String status;
    private String apptType;
    private String room;

    public Appointment() {}

     public Appointment(int appointmentId, int studentId, int staffId, Date apptDate,
                       Time apptTime, String status, String apptType, String room) {
        this.appointmentId = appointmentId;
        this.studentId = studentId;
        this.staffId = staffId;
        this.apptDate = apptDate;
        this.apptTime = apptTime;
        this.status = status;
        this.apptType = apptType;
        this.room = room;
    }

    // Getter & Setter
    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }

    public Date getApptDate() { return apptDate; }
    public void setApptDate(Date apptDate) { this.apptDate = apptDate; }

    public Time getApptTime() { return apptTime; }
    public void setApptTime(Time apptTime) { this.apptTime = apptTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getApptType() { return apptType; }
    public void setApptType(String apptType) { this.apptType = apptType; }

    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }

    @Override
    public String toString() {
        return "Appointment{" +
                "appointmentId=" + appointmentId +
                ", studentId=" + studentId +
                ", staffId=" + staffId +
                ", apptDate=" + apptDate +
                ", apptTime=" + apptTime +
                ", status='" + status + '\'' +
                ", apptType='" + apptType + '\'' +
                ", room='" + room + '\'' +
                '}';
    }
}
