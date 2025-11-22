package data_access_object;
import model.Disease;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeseaseDAO {
    public void addDisease(Disease d) throws SQLException {
        String sql = "INSERT INTO Disease (disease_id, name, description, severity, contagious) VALUES (?, ?, ?, ?, ?)";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, d.getDiseaseId());
        ps.setString(2, d.getName());
        ps.setString(3, d.getDescription());
        ps.setString(4, d.getSeverity());
        ps.setBoolean(5, d.isContagious());
        ps.executeUpdate();
        connection.close();
    }

    public List<Disease> getAllDiseases() throws SQLException {
        String sql = "SELECT * FROM Disease";
        List<Disease> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            Disease d = new Disease(
                    rs.getInt("disease_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("severity"),
                    rs.getBoolean("contagious")
            );
            list.add(d);
        }
        return list;
    }

    public void updateDiseaseSeverity(int diseaseId, String newSeverity) throws SQLException {
        String sql = "UPDATE Disease SET severity=? WHERE disease_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newSeverity);
        ps.setInt(2, diseaseId);
        ps.executeUpdate();
        connection.close();
    }

    public void deleteDisease(int diseaseId) throws SQLException {
        String sql = "DELETE FROM Disease WHERE disease_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, diseaseId);
        ps.executeUpdate();
        connection.close();
    }
}
