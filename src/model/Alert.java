package model;
import java.sql.Timestamp;

public class Alert {
    private int alertId;
    private int diseaseId;
    private String message;
    private String severity;
    private Timestamp alertDate;

    public Alert(int diseaseId, String message, String severity, Timestamp alertDate){
        this.diseaseId = diseaseId;
        this.message = message;
        this.severity = severity;
        this.alertDate = alertDate;
    }

    public Alert(int alertId, int diseaseId, String message, String severity, Timestamp alertDate) {
        this(diseaseId, message, severity, alertDate);
        this.alertId = alertId;
    }
    
    // Getter & Setter
    public int getAlertId() { return alertId; }
    public void setAlertId(int alertId) { this.alertId = alertId; }

    public int getDiseaseId() { return diseaseId; }
    public void setDiseaseId(int diseaseId) { this.diseaseId = diseaseId; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getSeverity() { return severity; }
    public void setSeverity(String severity) { this.severity = severity; }

    public Timestamp getAlertDate() { return alertDate; }
    public void setAlertDate(Timestamp alertDate) { this.alertDate = alertDate; }

    @Override
    public String toString() {
        return "Alert{" +
                "alertId=" + alertId +
                ", diseaseId=" + diseaseId +
                ", message='" + message + '\'' +
                ", severity='" + severity + '\'' +
                ", alertDate=" + alertDate +
                '}';
    }
}

