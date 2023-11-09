package com.vuisk.blogs.service.impl;

import com.vuisk.blogs.model.entities.Config;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.repository.ConfigRepository;
import com.vuisk.blogs.service.ConfigService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfigServiceImpl implements ConfigService {
    @Autowired
    private ConfigRepository configRepository;
    @Override
    public List<Config> findAll() {
        return null;
    }

    @Override
    public Config findById(Long id) {
        return null;
    }

    @Override
    public Config insert(Config config) {
        return null;
    }

    @Override
    public Config update(Config config) {
        return configRepository.save(config);
    }

    @Override
    public void deleteById(Long id) {

    }
    public List<Config> findByName(String name) {
        return configRepository.findByName(name);
    }
}
