package com.vuisk.blogs.service.impl;

import com.vuisk.blogs.model.entities.LogAdmin;
import com.vuisk.blogs.repository.LogAdminRepository;
import com.vuisk.blogs.repository.OrdersRepository;
import com.vuisk.blogs.service.LogAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LogAdminServiceImpl implements LogAdminService {

    @Autowired
    private LogAdminRepository logAdminRepository;

    @Override
    public List<LogAdmin> findAll() {
        return null;
    }

    @Override
    public LogAdmin findById(Long id) {
        return null;
    }

    @Override
    public LogAdmin insert(LogAdmin logAdmin) {
        return logAdminRepository.save(logAdmin);
    }

    @Override
    public LogAdmin update(LogAdmin logAdmin) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }
}
