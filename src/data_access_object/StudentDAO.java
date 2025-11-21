package data_access_object;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Student;
import util.DBConnection;
public class StudentDAO {
    public List<Student> getAllStudents() throws SQLException {
        List<Student> list = new ArrayList<>();
        String query = "SELECT * FROM Student";

        try (Connection conn = DBConnection.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Student s = new Student();
                s.id = rs.getInt("S_ID");
                s.firstName = rs.getString("First_Name");
                s.middleName = rs.getString("Middle_Name");
                s.lastName = rs.getString("Last_Name");
                s.sex = rs.getString("Sex");
                s.birthDate = rs.getString("Birth_date");
                s.address = rs.getString("Address");
                list.add(s);
            }
        }
        return list;
    }

    public void insertStudent(Student s) throws SQLException {
        String query = "INSERT INTO Student VALUES (?,?,?,?,?,?,?)";
        try (Connection conn = DBConnection.connect();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, s.id);
            ps.setString(2, s.firstName);
            ps.setString(3, s.middleName);
            ps.setString(4, s.lastName);
            ps.setString(5, s.sex);
            ps.setString(6, s.birthDate);
            ps.setString(7, s.address);
            ps.executeUpdate();
        }
    }
}

