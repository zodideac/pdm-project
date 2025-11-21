package model;

public class Staff {
    private int staffID;
    private String staffName;
    private String role;
    private String address;

    public Staff() {}

    public Staff(int staffID, String staffName, String role, String address) {
        this.staffID = staffID;
        this.staffName = staffName;
        this.role = role;
        this.address = address;
    }

    // Getter & Setter
    public int getStaffID() { return staffID; }
    public void setStaffID(int staffID) { this.staffID = staffID; }

    public String getStaffName() { return staffName; }
    public void setStaffName(String staffName) { this.staffName = staffName; }
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    @Override
    public String toString() {
        return  "Staff [staffID=" + staffID + ", staffName=" + staffName + ", role=" + 
        role + ", address=" + address + "]";
    }
}