package com.missiontracker.model;

public class Mission {
    private int id;
    private String name;
    private String launchDate;
    private String objective;
    private String status;

    public Mission(int id, String name, String launchDate, String objective, String status) {
        this.id = id;
        this.name = name;
        this.launchDate = launchDate;
        this.objective = objective;
        this.status = status;
    }

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

    public String getLaunchDate() {
        return launchDate;
    }

    public void setLaunchDate(String launchDate) {
        this.launchDate = launchDate;
    }

    public String getObjective() {
        return objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}