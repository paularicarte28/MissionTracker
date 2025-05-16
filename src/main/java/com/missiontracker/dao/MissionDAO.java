package com.missiontracker.dao;

import com.missiontracker.model.Mission;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MissionDAO {
    private Connection connection;

    public MissionDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Mission> getAllMissions() {
        List<Mission> missions = new ArrayList<>();
        try {
            String sql = "SELECT * FROM mission";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Mission m = new Mission(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("launch_date"),
                        rs.getString("objective"),
                        rs.getString("status"));
                missions.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return missions;
    }

    public List<Mission> searchMissions(String keyword) {
        List<Mission> results = new ArrayList<>();
        try {
            String sql = "SELECT * FROM mission WHERE name LIKE ? OR status LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            String q = "%" + keyword + "%";
            stmt.setString(1, q);
            stmt.setString(2, q);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Mission m = new Mission(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("launch_date"),
                        rs.getString("objective"),
                        rs.getString("status"));
                results.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

}
