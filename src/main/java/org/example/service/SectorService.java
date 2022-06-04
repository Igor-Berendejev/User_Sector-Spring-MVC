package org.example.service;

import org.example.repository.SectorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SectorService {

    @Autowired
    SectorRepository sectorRepository;

    public int getSectorIdByName(String sectorName) {
        return sectorRepository.getSectorByName(sectorName).getId();
    }
    public String getSectorNameById(int id){ return sectorRepository.getSectorById(id).getName(); }
}
