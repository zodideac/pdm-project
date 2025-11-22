package data_access_object;
import model.Report;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    public void addReport(Report report) throws SQLException {
        String sql = "INSERT INTO Report (appointment_id, student_id, current_status, notes) VALUES (?, ?, ?, ?)";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, report.getAppointmentId());
        ps.setInt(2, report.getStudentId());
        ps.setString(3, report.getCurrentStatus());
        ps.setString(4, report.getNotes());
        ps.executeUpdate();
        connection.close();
    }

    public List<Report> getAllReports() throws SQLException {
        String sql = "SELECT * FROM Report";
        List<Report> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            Report r = new Report(
                    rs.getInt("report_id"),
                    rs.getInt("appointment_id"),
                    rs.getInt("student_id"),
                    rs.getTimestamp("created_at"),
                    rs.getString("current_status"),
                    rs.getString("notes")
            );
            list.add(r);
        }
        return list;
    }

    public void updateStatus(int reportId, String newStatus) throws SQLException {
        String sql = "UPDATE Report SET current_status=? WHERE report_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newStatus);
        ps.setInt(2, reportId);
        ps.executeUpdate();
        connection.close();
    }
          
    public void deleteReport(int reportId) throws SQLException {
        String sql = "DELETE FROM Report WHERE report_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, reportId);
        ps.executeUpdate();
        connection.close();
    }
}