package com.missiontracker.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


<<<<<<< HEAD
    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database connection failed");

        }
=======
public class DBConnection {

    private Connection connection;

    public void connect() throws ClassNotFoundException, SQLException {
        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mariadb://localhost:3307/missiontracker", "root", "root");
>>>>>>> 0b47234 (cambiar metodos para meter instancia de dbconecction)
    }

    public void close() throws SQLException {
        connection.close();
    }

    public Connection getConnection() {
        return connection;
    }
}



