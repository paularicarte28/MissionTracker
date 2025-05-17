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

    public Astronaut getAstronautById(int id) {
        Astronaut astronaut = null;
        try {
            String sql = "SELECT a.*, m.name AS mission_name " +
                    "FROM astronauts a " +
                    "LEFT JOIN missions m ON a.mission_id = m.id " +
                    "WHERE a.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                astronaut = new Astronaut();
                astronaut.setId(rs.getInt("id"));
                astronaut.setName(rs.getString("name"));
                astronaut.setNationality(rs.getString("nationality"));
                // astronaut.setMissionName(rs.getString("mission_name"));
            }

            stmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronaut;
    }

      public Astronaut deleteAstronautById(int id) {
    Astronaut astronaut = null;
    try {
        String selectSql = "SELECT * FROM astronauts WHERE id = ?";
        PreparedStatement selectStmt = connection.prepareStatement(selectSql);
        selectStmt.setInt(1, id);
        ResultSet rs = selectStmt.executeQuery();

        if (rs.next()) {
            astronaut = new Astronaut();
            astronaut.setId(rs.getInt("id"));
            astronaut.setName(rs.getString("name"));
            astronaut.setNationality(rs.getString("nationality"));
            astronaut.setRole(rs.getString("role"));
            astronaut.setMissionid(rs.getInt("mission_id"));
        }

        rs.close();
        selectStmt.close();

        if (astronaut != null) {
            String deleteSql = "DELETE FROM astronauts WHERE id = ?";
            PreparedStatement deleteStmt = connection.prepareStatement(deleteSql);
            deleteStmt.setInt(1, id);
            deleteStmt.executeUpdate();
            deleteStmt.close();
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return astronaut;
}

    

    public List<Astronaut> getAllAstronauts() {
        List<Astronaut> astronauts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM astronauts ";

            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Astronaut astronaut = new Astronaut();
                astronaut.setId(rs.getInt("id"));
                astronaut.setName(rs.getString("name"));
                astronaut.setNationality(rs.getString("nationality"));
                astronaut.setRole(rs.getString("role"));
                astronauts.add(astronaut);
            }
            System.out.println("Astronauts encontrados: " + astronauts.size());

            stmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronauts;
        
    }

    // INSERT
    public void insertAstronaut(Astronaut astronaut) {
        String sql = "INSERT INTO astronauts (name, nationality, role, mission_id) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, astronaut.getName());
            stmt.setString(2, astronaut.getNationality());
            stmt.setString(3, astronaut.getRole());
            stmt.setInt(4, astronaut.getMissionid());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
