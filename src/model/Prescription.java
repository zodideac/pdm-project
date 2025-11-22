package model;
import java.sql.Date;

public class Prescription {
    private int prescriptionId;
    private int reportId;
    private int treatmentId;
    private String medicationName;
    private String dosage;
    private String frequency;
    private Date startDate;
    private Date endDate;

    public Prescription(int reportId, int treatmentId, String medicationName, String dosage, 
                        String frequency, Date startDate, Date endDate){
        this.reportId = reportId;
        this.treatmentId = treatmentId;
        this.medicationName = medicationName;
        this.dosage = dosage;
        this.frequency = frequency;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Prescription(int prescriptionId, int reportId, int treatmentId, String medicationName,
                        String dosage, String frequency, Date startDate, Date endDate) {
        this(reportId, treatmentId, medicationName, dosage, frequency, startDate, endDate);
        this.prescriptionId = prescriptionId;
    }
    
    // Getter & Setter
    public int getPrescriptionId() { return prescriptionId; }
    public void setPrescriptionId(int prescriptionId) { this.prescriptionId = prescriptionId; }

    public int getReportId() { return reportId; }
    public void setReportId(int reportId) { this.reportId = reportId; }

    public int getTreatmentId() { return treatmentId; }
    public void setTreatmentId(int treatmentId) { this.treatmentId = treatmentId; }

    public String getMedicationName() { return medicationName; }
    public void setMedicationName(String medicationName) { this.medicationName = medicationName; }

    public String getDosage() { return dosage; }
    public void setDosage(String dosage) { this.dosage = dosage; }

    public String getFrequency() { return frequency; }
    public void setFrequency(String frequency) { this.frequency = frequency; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    @Override
    public String toString() {
        return "Prescription{" +
                "prescriptionId=" + prescriptionId +
                ", reportId=" + reportId +
                ", treatmentId=" + treatmentId +
                ", medicationName='" + medicationName + '\'' +
                ", dosage='" + dosage + '\'' +
                ", frequency='" + frequency + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}

