package com.svalero.missiontracker.model;

import lombok.Data;

import Java.sql.Date;

@Data

public class Astronauts{
    private int id;
    private String name;
    private String nacionality;
    private String role;
    private int mission_id;
}

 