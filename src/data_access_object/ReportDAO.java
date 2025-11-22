package data_access_object;
import model.Report;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    public boolean addReport(Report r) throws SQLException {
        String sql = "INSERT INTO Report (appointment_id, student_id, current_status, notes) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){

            ps.setInt(1, r.getAppointmentId());
            ps.setInt(2, r.getStudentId());
            ps.setString(3, r.getCurrentStatus());
            ps.setString(4, r.getNotes());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()){
                    if (rs.next()) {
                        r.setReportId(rs.getInt(1));
                    }
                }
            }
            return rowsInserted > 0;
        }
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