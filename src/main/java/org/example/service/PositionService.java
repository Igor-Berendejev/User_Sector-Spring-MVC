package org.example.service;

import org.example.entity.Position;
import org.example.repository.PositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PositionService {

    @Autowired
    PositionRepository positionRepository;

    public Position addPosition(Position position){
        return positionRepository.save(position);
    }

    public List<Position> getPositionsByUserId(int userId){
        return positionRepository.getPositionsByUserId(userId);
    }

    public int deletePositionsByUserId(int userId){
        return positionRepository.deletePositionByUserId(userId);
    }
}
