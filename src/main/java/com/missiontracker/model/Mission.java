package com.missiontracker.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data

@AllArgsConstructor
@NoArgsConstructor
public class Mission {
    private int id;
    private String name;
    private String launchDate;
    private String objective;
    private String status;

}
