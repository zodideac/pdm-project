package data_access_object;
import model.Student;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public boolean addStudent(Student s) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO Student (S_ID, First_Name, Middle_Name, Last_Name, Sex, Birth_date, Address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, s.getSID());
        ps.setString(2, s.getFirstName());
        ps.setString(3, s.getMiddleName());
        ps.setString(4, s.getLastName());
        ps.setString(5, s.getSex());
        ps.setString(6, s.getBirthDate()); // nếu dùng LocalDate thì convert
        ps.setString(7, s.getAddress());
        boolean rs = ps.executeUpdate() > 0;
        conn.close();
        return rs;
    }

    public Student getStudentById(int id) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM Student WHERE S_ID = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Student student = null;
        if (rs.next()) {
            student = new Student(
                rs.getInt("S_ID"),
                rs.getString("First_Name"),
                rs.getString("Middle_Name"),
                rs.getString("Last_Name"),
                rs.getString("Sex"),
                rs.getString("Birth_date"),
                rs.getString("Address")
            );
        }
        connection.close();
        return student;
    }

    public List<Student> getAllStudents() throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM Student";
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        List<Student> students = new ArrayList<>();
        while (rs.next()) {
            Student student = new Student(
                rs.getInt("S_ID"),
                rs.getString("First_Name"),
                rs.getString("Middle_Name"),
                rs.getString("Last_Name"),
                rs.getString("Sex"),
                rs.getString("Birth_date"),
                rs.getString("Address")
            );
        }
        connection.close();
        return students;        
    }

    public boolean updateStudent(Student s) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "UPDATE Student SET First_Name=?, Middle_Name=?, Last_Name=?, Sex=?, Birth_date=?, Address=? WHERE S_ID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, s.getFirstName());
        ps.setString(2, s.getMiddleName());
        ps.setString(3, s.getLastName());
        ps.setString(4, s.getSex());
        ps.setString(5, s.getBirthDate());
        ps.setString(6, s.getAddress());
        ps.setInt(7, s.getSID());
        boolean result = ps.executeUpdate() > 0;
        connection.close();
        return result;
    }

    public boolean deleteStudent(int id) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "DELETE FROM Student WHERE S_ID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        boolean result = ps.executeUpdate() > 0;
        connection.close();
        return result;
    }
}
