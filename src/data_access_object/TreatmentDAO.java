package data_access_object;
import model.Treatment;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;  

public class TreatmentDAO {
    public boolean addTreatment(Treatment t) throws SQLException {
        String sql = "INSERT INTO Treatment (staff_id, diagnosis_id, treatment_plan, start_date, end_date) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, t.getStaffId());
            ps.setInt(2, t.getDiagnosisId());
            ps.setString(3, t.getTreatmentPlan());
            ps.setDate(4, t.getStartDate());
            ps.setDate(5, t.getEndDate());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        t.setTreatmentId(rs.getInt(1));
                    }
                }
            }
            return rowsInserted > 0;
        }
    }

    public List<Treatment> getAllTreatments() throws SQLException {
        String sql = "SELECT * FROM Treatment";
        List<Treatment> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            list.add(new Treatment(
                rs.getInt("treatment_id"),
                rs.getInt("staff_id"),
                rs.getInt("diagnosis_id"),
                rs.getString("treatment_plan"),
                rs.getDate("start_date"),
                rs.getDate("end_date")
            ));
        }
        return list;
    }

    public void updateTreatmentPlan(int treatmentId, String newPlan) throws SQLException {
        String sql = "UPDATE Treatment SET treatment_plan=? WHERE treatment_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newPlan);
        ps.setInt(2, treatmentId);
        ps.executeUpdate();
        connection.close();
    }

    public void deleteTreatment(int treatmentId) throws SQLException {
        String sql = "DELETE FROM Treatment WHERE treatment_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, treatmentId);
        ps.executeUpdate();
        connection.close();
    }
}
