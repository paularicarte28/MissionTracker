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

    // GET BY ID
    public Astronaut getAstronautById(int id) {
        Astronaut astronaut = null;
        String sql = "SELECT a.*, m.name AS mission_name " +
                     "FROM astronauts a " +
                     "LEFT JOIN missions m ON a.mission_id = m.id " +
                     "WHERE a.id = ?";
        try (
            PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    astronaut = new Astronaut();
                    astronaut.setId(rs.getInt("id"));
                    astronaut.setName(rs.getString("name"));
                    astronaut.setNationality(rs.getString("nationality"));
                    astronaut.setRole(rs.getString("role"));
                    astronaut.setMissionid(rs.getInt("mission_id"));
                    astronaut.setMissionName(rs.getString("mission_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronaut;
    }

    // GET ALL
    public List<Astronaut> getAllAstronauts() {
        List<Astronaut> astronauts = new ArrayList<>();
        String sql = "SELECT * FROM astronauts";
        try (
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                Astronaut astronaut = new Astronaut();
                astronaut.setId(rs.getInt("id"));
                astronaut.setName(rs.getString("name"));
                astronaut.setNationality(rs.getString("nationality"));
                astronaut.setRole(rs.getString("role"));
                astronauts.add(astronaut);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronauts;
    }

    // INSERT
    public void insertAstronaut(Astronaut astronaut) {
        String sql = "INSERT INTO astronauts (name, nationality, role, mission_id) VALUES (?, ?, ?, ?)";
        try (
            PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setString(1, astronaut.getName());
            stmt.setString(2, astronaut.getNationality());
            stmt.setString(3, astronaut.getRole());
            stmt.setInt(4, astronaut.getMissionid());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // DELETE
    public Astronaut deleteAstronautById(int id) {
        Astronaut astronaut = null;
        String selectSql = "SELECT * FROM astronauts WHERE id = ?";
        String deleteSql = "DELETE FROM astronauts WHERE id = ?";

        try (
            PreparedStatement selectStmt = connection.prepareStatement(selectSql)
        ) {
            selectStmt.setInt(1, id);
            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    astronaut = new Astronaut();
                    astronaut.setId(rs.getInt("id"));
                    astronaut.setName(rs.getString("name"));
                    astronaut.setNationality(rs.getString("nationality"));
                    astronaut.setRole(rs.getString("role"));
                    astronaut.setMissionid(rs.getInt("mission_id"));
                }
            }

            if (astronaut != null) {
                try (PreparedStatement deleteStmt = connection.prepareStatement(deleteSql)) {
                    deleteStmt.setInt(1, id);
                    deleteStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronaut;
    }

    // SEARCH
    public List<Astronaut> searchAstronauts(String q, String nationality) {
        List<Astronaut> astronauts = new ArrayList<>();
        String sql = "SELECT * FROM astronauts WHERE 1=1"
                   + (q != null && !q.isEmpty() ? " AND (name LIKE ? OR role LIKE ?)" : "")
                   + (nationality != null && !nationality.isEmpty() ? " AND nationality = ?" : "");

        try (
            PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            int index = 1;
            if (q != null && !q.isEmpty()) {
                stmt.setString(index++, "%" + q + "%");
                stmt.setString(index++, "%" + q + "%");
            }
            if (nationality != null && !nationality.isEmpty()) {
                stmt.setString(index++, nationality);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Astronaut a = new Astronaut();
                    a.setId(rs.getInt("id"));
                    a.setName(rs.getString("name"));
                    a.setNationality(rs.getString("nationality"));
                    a.setRole(rs.getString("role"));
                    a.setMissionid(rs.getInt("mission_id"));
                    astronauts.add(a);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return astronauts;
    }

    //paginacion
    public int countAllAstronauts(String q, String nationality) {
        String sql = "SELECT COUNT(*) FROM astronauts WHERE 1=1"
                + (q != null && !q.isEmpty() ? " AND (name LIKE ? OR role LIKE ?)" : "")
                + (nationality != null && !nationality.isEmpty() ? " AND nationality = ?" : "");

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            int index = 1;
            if (q != null && !q.isEmpty()) {
                stmt.setString(index++, "%" + q + "%");
                stmt.setString(index++, "%" + q + "%");
            }
            if (nationality != null && !nationality.isEmpty()) {
                stmt.setString(index++, nationality);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        } 
        catch (SQLException e) {
           e.printStackTrace();
        }
            return 0;
    }

    public List<Astronaut> getAstronautsPaged(String q, String nationality, int offset, int limit) {

        List<Astronaut> astronauts = new ArrayList<>();
        String sql = "SELECT * FROM astronauts WHERE 1=1"
                + (q != null && !q.isEmpty() ? " AND (name LIKE ? OR role LIKE ?)" : "")
                + (nationality != null && !nationality.isEmpty() ? " AND nationality = ?" : "")
                + " ORDER BY name LIMIT ? OFFSET ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            int index = 1;
            if (q != null && !q.isEmpty()) {
                stmt.setString(index++, "%" + q + "%");
                stmt.setString(index++, "%" + q + "%");
            }
            if (nationality != null && !nationality.isEmpty()) {
                stmt.setString(index++, nationality);
            }

            stmt.setInt(index++, limit);
            stmt.setInt(index, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Astronaut a = new Astronaut();
                    a.setId(rs.getInt("id"));
                    a.setName(rs.getString("name"));
                    a.setNationality(rs.getString("nationality"));
                    a.setRole(rs.getString("role"));
                    a.setMissionid(rs.getInt("mission_id"));
                    astronauts.add(a);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

       return astronauts;
    }

}
