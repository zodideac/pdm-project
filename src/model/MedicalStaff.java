package model;

public class MedicalStaff {
    private int staffId;
    private String firstName;
    private String lastName;
    private String role;
    private String department;
    private String email;
    private String phone;

    public MedicalStaff() {}

    public MedicalStaff(int staffId, String firstName, String lastName, String role,
                        String department, String email, String phone) {
        this.staffId = staffId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.department = department;
        this.email = email;
        this.phone = phone;
    }

    // Getter & Setter
    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    @Override
    public String toString() {
        return  "MedicalStaff{" +
                "staffId=" + staffId + ", firstName='" + firstName + '\'' + ", lastName='" + 
                lastName + '\'' + ", role='" + role + '\'' + ", department='" + department + 
                '\'' + ", email='" + email + '\'' + ", phone='" + phone + '\'' + '}';
    }
}