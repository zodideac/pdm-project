package data_access_object;
import model.Disease;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeseaseDAO {
    public boolean addDisease(Disease d) throws SQLException {
        String sql = "INSERT INTO Disease (name, description, severity, contagious) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){

            ps.setString(1, d.getName());
            ps.setString(2, d.getDescription());
            ps.setString(3, d.getSeverity());
            ps.setBoolean(4, d.isContagious());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()){
                    if (rs.next()) {
                        d.setDiseaseId(rs.getInt(1));
                    }
                }
            }
            return rowsInserted > 0;
        }
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
