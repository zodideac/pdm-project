package data_access_object;
import model.MedicalStaff;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicalStaffDAO {

    // INSERT
    public void addMedicalStaff(MedicalStaff staff) throws SQLException {
        String sql = "INSERT INTO Medical_Staff (first_name, last_name, role, department, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, staff.getFirstName());
            ps.setString(2, staff.getLastName());
            ps.setString(3, staff.getRole());
            ps.setString(4, staff.getDepartment());
            ps.setString(5, staff.getEmail());
            ps.setString(6, staff.getPhone());
            ps.executeUpdate();
        }
    }

    // UPDATE PHONE OR EMAIL
    public void updateContactInfo(int staffId, String newPhone, String newEmail) throws SQLException {
        String sql = "UPDATE Medical_Staff SET phone=?, email=? WHERE staff_id=?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newPhone);
            ps.setString(2, newEmail);
            ps.setInt(3, staffId);
            ps.executeUpdate();
        }
    }

    // DELETE
    public void deleteMedicalStaff(int staffId) throws SQLException {
        String sql = "DELETE FROM Medical_Staff WHERE staff_id=?";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, staffId);
            ps.executeUpdate();
        }
    }

    // SELECT ALL
    public List<MedicalStaff> getAllMedicalStaff() throws SQLException {
        String sql = "SELECT * FROM Medical_Staff";
        List<MedicalStaff> staffList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                staffList.add(new MedicalStaff(
                        rs.getInt("staff_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("role"),
                        rs.getString("department"),
                        rs.getString("email"),
                        rs.getString("phone")
                ));
            }
        }
        return staffList;
    }

}

