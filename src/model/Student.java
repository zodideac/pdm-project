package model;
public class Student {
    private int SID;
    private String firstName;
    private String middleName;
    private String lastName;
    private String sex;
    private String birthDate;
    private String address;

    public Student() { }

    public Student(int SID, String firstName, String middleName, String lastName, String sex, String birthDate, String address) {
        this.SID = SID;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.sex = sex;
        this.birthDate = birthDate;
        this.address = address;
    }

    // getter & setter
    public int getSID() {
        return SID;
    }
    public void setSID(int SID) {
        this.SID = SID;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getMiddleName() {
        return middleName;
    }
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getBirthDate() {
        return birthDate;
    }
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Student [SID=" + SID + ", firstName=" + firstName + ", middleName=" + middleName + 
                ", lastName=" + lastName + ", sex=" + sex + ", birthDate=" + birthDate + ", address=" + address + "]";
    }
}
