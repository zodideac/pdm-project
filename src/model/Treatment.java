package model;
import java.sql.Date;

public class Treatment {
    private int treatmentId;
    private int staffId;
    private int diagnosisId; // disease_id
    private String treatmentPlan;
    private Date startDate;
    private Date endDate;

    public Treatment(int treatmentId, int staffId, int diagnosisId,
                     String treatmentPlan, Date startDate, Date endDate) {
        this.treatmentId = treatmentId;
        this.staffId = staffId;
        this.diagnosisId = diagnosisId;
        this.treatmentPlan = treatmentPlan;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getter & Setter
    public int getTreatmentId() { return treatmentId; }
    public void setTreatmentId(int treatmentId) { this.treatmentId = treatmentId; }

    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }

    public int getDiagnosisId() { return diagnosisId; }
    public void setDiagnosisId(int diagnosisId) { this.diagnosisId = diagnosisId; }

    public String getTreatmentPlan() { return treatmentPlan; }
    public void setTreatmentPlan(String treatmentPlan) { this.treatmentPlan = treatmentPlan; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    @Override
    public String toString() {
        return "Treatment{" +
                "treatmentId=" + treatmentId +
                ", staffId=" + staffId +
                ", diagnosisId=" + diagnosisId +
                ", treatmentPlan='" + treatmentPlan + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}
