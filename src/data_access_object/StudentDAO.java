package data_access_object;
import model.Student;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public void addStudent(Student s) throws SQLException {
        String sql = "INSERT INTO Student (student_id, first_name, last_name, gender, address, date_of_birth, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, s.getStudentId());
        ps.setString(2, s.getFirstName());
        ps.setString(3, s.getLastName());
        ps.setString(4, s.getGender());
        ps.setString(5, s.getAddress());
        ps.setDate(6, s.getDateOfBirth());
        ps.setString(7, s.getEmail());
        ps.setString(8, s.getPhone());
        ps.executeUpdate();
        connection.close();
    }

    public List<Student> getAllStudents() throws SQLException {
        String sql = "SELECT * FROM Student";
        List<Student> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            Student s = new Student(
                    rs.getInt("student_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("gender"),
                    rs.getString("address"),
                    rs.getDate("date_of_birth"),
                    rs.getString("email"),
                    rs.getString("phone")
            );
            list.add(s);
        }
        return list;
    }

    public void updateContactInfo(int studentId, String newPhone, String newEmail) throws SQLException {
        String sql = "UPDATE Student SET phone=?, email=? WHERE student_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newPhone);
        ps.setString(2, newEmail);
        ps.setInt(3, studentId);
        ps.executeUpdate();
        connection.close();
    }

    public void deleteStudent(int studentId) throws SQLException {
        String sql = "DELETE FROM Student WHERE student_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, studentId);
        ps.executeUpdate();
        connection.close();
    }
}