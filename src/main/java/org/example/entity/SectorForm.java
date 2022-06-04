package org.example.entity;

import java.util.List;

public class SectorForm {

    private String name;
    private List<String> sectors;
    private String acceptance;

    public SectorForm() {
    }

    public SectorForm(String name, List<String> sectors, String acceptance) {
        this.name = name;
        this.sectors = sectors;
        this.acceptance = acceptance;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getSectors() {
        return sectors;
    }

    public void setSectors(List<String> sectors) {
        this.sectors = sectors;
    }

    public String getAcceptance() {
        return acceptance;
    }

    public void setAcceptance(String acceptance) {
        this.acceptance = acceptance;
    }
}
