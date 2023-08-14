package com.vuisk.blogs.service.impl;

import com.vuisk.blogs.model.entities.Menu;
import com.vuisk.blogs.repository.MenuRepository;
import com.vuisk.blogs.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuRepository menuRepository;

    @Override
    public List<Menu> findAll() {
        return menuRepository.findAll();
    }

    @Override
    public Menu findById(Long id) {
        return null;
    }

    @Override
    public Menu insert(Menu menu) {
        return null;
    }

    @Override
    public Menu update(Menu menu) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }
}
