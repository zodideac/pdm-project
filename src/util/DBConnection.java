package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/UniversityHealthSystem";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";
    
    // driver is loaded only once
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC Driver
        } catch (ClassNotFoundException e) {
            System.err.println("❌ JDBC Driver not found. Make sure mysql-connector-j.jar is added to lib folder!");
            e.printStackTrace();
        }
    }

    // return DB connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
