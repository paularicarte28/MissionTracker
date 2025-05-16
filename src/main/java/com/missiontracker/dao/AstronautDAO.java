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

    public List<Astronaut> getAllAstronauts() {
        List<Astronaut> astronauts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM astronauts " ;
                        
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Astronaut astronaut = new Astronaut();
                astronaut.setId(rs.getInt("id"));
                astronaut.setName(rs.getString("name"));
                astronaut.setNationality(rs.getString("nationality"));
                 astronaut.setRole(rs.getString("rol"));
                   astronauts.add(astronaut);
            }System.out.println("Astronauts encontrados: " + astronauts.size());

            stmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronauts;
    }
}
