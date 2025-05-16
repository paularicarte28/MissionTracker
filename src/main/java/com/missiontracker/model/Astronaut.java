package com.missiontracker.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Astronaut {
    private int id;
    private String name;
    private String nationality;
    private String role;
    private int missionid;
    // private String missionName;
}

 

