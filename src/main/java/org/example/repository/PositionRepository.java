package org.example.repository;

import org.example.entity.Position;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionRepository extends CrudRepository<Position, Integer> {

    List<Position> getPositionsByUserId(int userId);

    int deletePositionByUserId(int userId);
}
