package org.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "sector")
public class Sector {
    @Id
    private int id;
    private String name;
    private Integer base_sector_id;

    public Sector() {
    }

    public Sector(int id, String name, int base_sector_id) {
        this.id = id;
        this.name = name;
        this.base_sector_id = base_sector_id;
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

    public int getBase_sector_id() {
        return base_sector_id;
    }

    public void setBase_sector_id(int base_sector_id) {
        this.base_sector_id = base_sector_id;
    }
}