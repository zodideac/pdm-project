package model;
import java.sql.Timestamp;

public class Report {
    private int reportId;
    private int appointmentId;
    private int studentId;
    private Timestamp createdAt;
    private String currentStatus;
    private String notes;

    public Report() {}

    public Report(int reportId, int appointmentId, int studentId,
                  Timestamp createdAt, String currentStatus, String notes) {
        this.reportId = reportId;
        this.appointmentId = appointmentId;
        this.studentId = studentId;
        this.createdAt = createdAt;
        this.currentStatus = currentStatus;
        this.notes = notes;
    }

    // Getter & Setter
    public int getReportId() { return reportId; }
    public void setReportId(int reportId) { this.reportId = reportId; }

    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getCurrentStatus() { return currentStatus; }
    public void setCurrentStatus(String currentStatus) { this.currentStatus = currentStatus; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    @Override
    public String toString() {
        return "Report{" +
                "reportId=" + reportId +
                ", appointmentId=" + appointmentId +
                ", studentId=" + studentId +
                ", createdAt=" + createdAt +
                ", currentStatus='" + currentStatus + '\'' +
                ", notes='" + notes + '\'' +
                '}';
    }
}