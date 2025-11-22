package model;
import java.sql.Date;
public class Student {
    private int studentId;
    private String firstName;
    private String lastName;
    private Date dateOfBirth;
    private String gender;
    private String email;
    private String phone;
    private String address;

    public Student(String firstName, String lastName, Date dateOfBirth, 
                   String gender, String email, String phone, String address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public Student(int studentId, String firstName, String lastName, String gender, 
                   String address, Date dateOfBirth, String email, String phone) {
        this(firstName, lastName, dateOfBirth, gender, email, phone, address);
        this.studentId = studentId;
    }

    // getter & setter
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    @Override
    public String toString() {
        return "Student{" + "studentId=" + studentId + ", firstName='" + firstName + '\'' 
        + ", lastName='" + lastName + '\'' + ", dateOfBirth=" + dateOfBirth + ", gender='" 
        + gender + '\'' + ", email='" + email + '\'' + ", phone='" + phone + '\'' + ", address='" + address + '\'' + '}';
    }
}
