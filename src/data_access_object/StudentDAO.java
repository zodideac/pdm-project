package data_access_object;
import model.Student;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public boolean addStudent(Student s) throws SQLException {
        String sql = "INSERT INTO Student (first_name, last_name, gender, address, date_of_birth, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, s.getFirstName());
            ps.setString(2, s.getLastName());
            ps.setString(3, s.getGender());
            ps.setString(4, s.getAddress());
            ps.setDate(5, s.getDateOfBirth());
            ps.setString(6, s.getEmail());
            ps.setString(7, s.getPhone());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    s.setStudentId(rs.getInt(1));
                }
            }
            return rowsInserted > 0;
        }
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