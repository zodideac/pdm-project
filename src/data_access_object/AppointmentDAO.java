package data_access_object;
import model.Appointment;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {

    // INSERT
    public void addAppointment(Appointment appointment) throws SQLException {
        String sql = "INSERT INTO Appointment (student_id, staff_id, appt_date, appt_time, status, appt_type, room) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, appointment.getStudentId());
        ps.setInt(2, appointment.getStaffId());
        ps.setDate(3, appointment.getApptDate());
        ps.setTime(4, appointment.getApptTime());
        ps.setString(5, appointment.getStatus());
        ps.setString(6, appointment.getApptType());
        ps.setString(7, appointment.getRoom());
        ps.executeUpdate();
        connection.close();
    }
    
    // SELECT ALL
    public List<Appointment> getAllAppointments() throws SQLException {
        String sql = "SELECT * FROM Appointment";
        List<Appointment> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            Appointment a = new Appointment(
                    rs.getInt("appointment_id"),
                    rs.getInt("student_id"),
                    rs.getInt("staff_id"),
                    rs.getDate("appt_date"),
                    rs.getTime("appt_time"),
                    rs.getString("status"),
                    rs.getString("appt_type"),
                    rs.getString("room")
            );
            list.add(a);
        }
        return list;
    }

    // UPDATE STATUS
    public void updateStatus(int appointmentId, String newStatus) throws SQLException {
        String sql = "UPDATE Appointment SET status=? WHERE appointment_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newStatus);
        ps.setInt(2, appointmentId);
        ps.executeUpdate();
        connection.close();
    }

    // DELETE
    public void deleteAppointment(int appointmentId) throws SQLException {
        String sql = "DELETE FROM Appointment WHERE appointment_id=?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, appointmentId);
        ps.executeUpdate();
        connection.close();
    }
}