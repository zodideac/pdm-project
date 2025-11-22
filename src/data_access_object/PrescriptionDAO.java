package data_access_object;
import model.Prescription;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PrescriptionDAO {
    public boolean addPrescription(Prescription p) throws SQLException {
        String sql = "INSERT INTO Prescription (report_id, treatment_id, medication_name, dosage, frequency, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){

            ps.setInt(1, p.getReportId());
            ps.setInt(2, p.getTreatmentId());
            ps.setString(3, p.getMedicationName());
            ps.setString(4, p.getDosage());
            ps.setString(5, p.getFrequency());
            ps.setDate(6, p.getStartDate());
            ps.setDate(7, p.getEndDate());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()){
                    if (rs.next()) {
                        p.setPrescriptionId(rs.getInt(1));
                    }
                }
            }
            return rowsInserted > 0;
        }
    }
    
    public List<Prescription> getAllPrescriptions() throws SQLException {
        String sql = "SELECT * FROM Prescription";
        List<Prescription> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            list.add(new Prescription(
                    rs.getInt("prescription_id"),
                    rs.getInt("report_id"),
                    rs.getInt("treatment_id"),
                    rs.getString("medication_name"),
                    rs.getString("dosage"),
                    rs.getString("frequency"),
                    rs.getDate("start_date"),
                    rs.getDate("end_date")
            ));
        }
        return list;
    }

    public void updateDosage(int prescriptionId, String newDosage) throws SQLException {
        String sql = "UPDATE Prescription SET dosage=? WHERE prescription_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newDosage);
        ps.setInt(2, prescriptionId);
        ps.executeUpdate();
        connection.close();
    }


    public void deletePrescription(int prescriptionId) throws SQLException {
        String sql = "DELETE FROM Prescription WHERE prescription_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, prescriptionId);
        ps.executeUpdate();
        connection.close();
    }
}