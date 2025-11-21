package data_access_object;

import model.Illness;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IllnessDAO {

    public boolean addIllness(Illness i) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "INSERT INTO Illness (I_Name, Symptom, Treatment, Timeline) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, i.getName());
        ps.setString(2, i.getSymptom());
        ps.setString(3, i.getTreatment());
        ps.setString(4, i.getTimeline());
        boolean result = ps.executeUpdate() > 0;
        connection.close();
        return result;
    }

    public Illness getIllnessByName(String name) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM Illness WHERE I_Name = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        ResultSet rs = ps.executeQuery();

        Illness i = null;
        if (rs.next()) {
            i = new Illness(
                rs.getString("I_Name"),
                rs.getString("Symptom"),
                rs.getString("Treatment"),
                rs.getString("Timeline")
            );
        }
        connection.close();
        return i;
    }

    public List<Illness> getAllIllnesses() throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM Illness";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(sql);

        List<Illness> list = new ArrayList<>();
        while (rs.next()) {
            list.add(new Illness(
                rs.getString("I_Name"),
                rs.getString("Symptom"),
                rs.getString("Treatment"),
                rs.getString("Timeline")
            ));
        }
        connection.close();
        return list;
    }

    public boolean updateIllness(Illness i) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "UPDATE Illness SET Symptom=?, Treatment=?, Timeline=? WHERE I_Name=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, i.getSymptom());
        ps.setString(2, i.getTreatment());
        ps.setString(3, i.getTimeline());
        ps.setString(4, i.getName());
        boolean result = ps.executeUpdate() > 0;
        connection.close();
        return result;
    }

    public boolean deleteIllness(String name) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        String sql = "DELETE FROM Illness WHERE I_Name=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        boolean result = ps.executeUpdate() > 0;
        connection.close();
        return result;
    }
}

