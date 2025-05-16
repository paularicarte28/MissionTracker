package com.svalero.missiontracker.model;

import lombok.Data;

import Java.sql.Date;

@Data

public class Mission{
    private int id;
    private String name;
    private Datetime launch_date;
    private String objective;
    private String status;    
}

