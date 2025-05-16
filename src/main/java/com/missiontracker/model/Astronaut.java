package com.missiontracker.model;

public class Astronaut {
    private int id;
    private String name;
    private String nationality;
    private String role;
    private int missionId;
    private String missionName;

    // Constructor
    public Astronaut(int id, String name, String nationality, String role, int missionId) {
        this.id = id;
        this.name = name;
        this.nationality = nationality;
        this.role = role;
        this.missionId = missionId;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getMissionId() {
        return missionId;
    }

    public void setMissionId(int missionId) {
        this.missionId = missionId;
    }

    public String getMissionName() {
        return missionName;
    }

    public void setMissionName(String missionName) {
        this.missionName = missionName;
    }
}
