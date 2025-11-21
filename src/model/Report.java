package model;

public class Report {
    private String note;
    private int AID;
    private String illnessName;
    private String diagnosis;
    private String treatment;

    public Report() {}

    public Report(String note, int AID, String illnessName, String diagnosis, String treatment) {
        this.note = note;
        this.AID = AID;
        this.illnessName = illnessName;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
    }

    // Getter & Setter
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    public int getAID() { return AID; }
    public void setAID(int AID) { this.AID = AID; }

    public String getIllnessName() { return illnessName; }
    public void setIllnessName(String illnessName) { this.illnessName = illnessName; }

    public String getDiagnosis() { return diagnosis; }
    public void setDiagnosis(String diagnosis) { this.diagnosis = diagnosis; }

    public String getTreatment() { return treatment; }
    public void setTreatment(String treatment) { this.treatment = treatment; }

    @Override
    public String toString() {
        return "Report{" + "note='" + note + '\'' + ", AID=" + AID + ", illnessName='" + 
        illnessName + '\'' + ", diagnosis='" + diagnosis + '\'' + ", treatment='" + treatment + '\'' + '}';
    }
}
