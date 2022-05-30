package org.example.repository;

import org.example.entity.Sector;
import org.springframework.data.repository.CrudRepository;

public interface SectorRepository extends CrudRepository<Sector, Integer> {

    public Sector getSectorByName(String sectorName);

}