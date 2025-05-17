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

    // GET ALL
    public List<Mission> getAllMissions() {
        List<Mission> missions = new ArrayList<>();

        try {
            String sql = "SELECT * FROM missions";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Mission m = new Mission();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setLaunchDate(rs.getString("launch_date"));
                m.setObjective(rs.getString("objective"));
                m.setStatus(rs.getString("status"));
                missions.add(m);
            }

            stmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return missions;
    }

    // GET ONE
    public Mission getMissionById(int id) {
        Mission mission = null;
        try {
            String sql = "SELECT * FROM missions WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                mission = new Mission();
                mission.setId(rs.getInt("id"));
                mission.setName(rs.getString("name"));
                mission.setLaunchDate(rs.getString("launch_date"));
                mission.setObjective(rs.getString("objective"));
                mission.setStatus(rs.getString("status"));
            }

            stmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mission;
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
                results.add(new Mission(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("launch_date"),
                        rs.getString("objective"),
                        rs.getString("status")));
            }

            stmt.close();
            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public void updateMission(Mission mission) {
        try {
            String sql = "UPDATE missions SET name = ?, launch_date = ?, objective = ?, status = ? WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, mission.getName());
            stmt.setString(2, mission.getLaunchDate());
            stmt.setString(3, mission.getObjective());
            stmt.setString(4, mission.getStatus());
            stmt.setInt(5, mission.getId());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteMissionById(int id) {
        try {
            String sql = "DELETE FROM missions WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            int affectedRows = stmt.executeUpdate();
            stmt.close();
            return affectedRows > 0;

            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //insert
    public void insertMission(Mission mission) {
    try {
        String sql = "INSERT INTO missions (name, launch_date, objective, status) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, mission.getName());
        stmt.setString(2, mission.getLaunchDate());
        stmt.setString(3, mission.getObjective());
        stmt.setString(4, mission.getStatus());
        stmt.executeUpdate();
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public Mission getMissionByName(String name) {
    Mission mission = null;
    try {
        String sql = "SELECT * FROM missions WHERE name = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, name);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            mission = new Mission();
            mission.setId(rs.getInt("id"));
            mission.setName(rs.getString("name"));
            mission.setLaunchDate(rs.getString("launch_date"));
            mission.setObjective(rs.getString("objective"));
            mission.setStatus(rs.getString("status"));
        }

        stmt.close();
        rs.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return mission;
}
}
