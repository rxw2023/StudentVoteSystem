package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/224820213?useSSL=false&characterEncoding=UTF-8", "root", "root");
        conn.createStatement().execute("SET NAMES 'utf8'");
        return conn;
    }
}
