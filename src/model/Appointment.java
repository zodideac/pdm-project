package model;

public class Appointment {
    private int AID;
    private int SID;
    private int staffID;
    private String time;

    public Appointment() {}

    public Appointment(int AID, int SID, int staffID, String time) {
        this.AID = AID;
        this.SID = SID;
        this.staffID = staffID;
        this.time = time;
    }

    // Getter & Setter
    public int getAID() { return AID; }
    public void setAID(int AID) { this.AID = AID; }

    public int getSID() { return SID; }
    public void setSID(int SID) { this.SID = SID; }

    public int getStaffID() { return staffID; }
    public void setStaffID(int staffID) { this.staffID = staffID; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    @Override
    public String toString() {
        return "Appointment{" + "AID=" + AID + ", SID=" + SID + ", staffID=" + staffID + 
        ", time='" + time + '\'' + '}';
    }
}
