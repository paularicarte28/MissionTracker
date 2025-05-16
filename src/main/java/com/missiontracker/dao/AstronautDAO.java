package com.missiontracker.dao;

import com.missiontracker.model.Astronaut;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AstronautDAO {

    private Connection connection;

    public AstronautDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Astronaut> getAllAstronauts() {
        List<Astronaut> astronauts = new ArrayList<>();
        try {
            String sql = "SELECT a.*, m.name AS mission_name " +
                    "FROM astronaut a LEFT JOIN mission m ON a.mission_id = m.id";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Astronaut a = new Astronaut(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("nationality"),
                        rs.getString("role"),
                        rs.getInt("mission_id"));
                a.setMissionName(rs.getString("mission_name"));
                astronauts.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronauts;
    }

    // GET BY ID
    public Astronaut getAstronautById(int id) {
        try {
            String sql = "SELECT a.*, m.name AS mission_name " +
                    "FROM astronaut a LEFT JOIN mission m ON a.mission_id = m.id " +
                    "WHERE a.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Astronaut a = new Astronaut(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("nationality"),
                        rs.getString("role"),
                        rs.getInt("mission_id"));
                a.setMissionName(rs.getString("mission_name"));
                return a;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}