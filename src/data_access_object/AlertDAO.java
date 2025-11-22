package data_access_object;
import model.Alert;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlertDAO {
    public void addAlert(Alert a) throws SQLException {
        String sql = "INSERT INTO Alert (alert_id, disease_id, message, severity, alert_date) VALUES (?, ?, ?, ?, ?)";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, a.getAlertId());
        ps.setInt(2, a.getDiseaseId());
        ps.setString(3, a.getMessage());
        ps.setString(4, a.getSeverity());
        ps.setTimestamp(5, a.getAlertDate());
        ps.executeUpdate();
        connection.close();
    }

    public List<Alert> getAllAlerts() throws SQLException {
        String sql = "SELECT * FROM Alert";
        List<Alert> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            Alert a = new Alert(
                    rs.getInt("alert_id"),
                    rs.getInt("disease_id"),
                    rs.getString("message"),
                    rs.getString("severity"),
                    rs.getTimestamp("alert_date")
            );
            list.add(a);
        }
        return list;
    }

    public void updateAlertMessage(int alertId, String newMessage) throws SQLException {
        String sql = "UPDATE Alert SET message=? WHERE alert_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newMessage);
        ps.setInt(2, alertId);
        ps.executeUpdate();
        connection.close();
    }

    public void deleteAlert(int alertId) throws SQLException {
        String sql = "DELETE FROM Alert WHERE alert_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, alertId);
        ps.executeUpdate();
        connection.close();
    }
}
