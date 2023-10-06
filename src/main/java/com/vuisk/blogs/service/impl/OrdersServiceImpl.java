package com.vuisk.blogs.service.impl;


import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.repository.OrdersRepository;
import com.vuisk.blogs.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrdersServiceImpl implements OrderService {
    @Autowired
    private OrdersRepository ordersRepository;

    @Override
    public List<Orders> findAll() {
        return ordersRepository.findAll();
    }

    @Override
    public Orders findById(Long id) {
        return ordersRepository.findById(id).orElse(null);
    }

    @Override
    public Orders insert(Orders order) {
        order.setNote(order.getNote().trim());
        return ordersRepository.save(order);
    }

    @Override
    public Orders update(Orders order) {
        return ordersRepository.save(order);
    }

    @Override
    public void deleteById(Long id) {
        ordersRepository.deleteById(id);
    }

    public List<Orders> findByCreate(long start, long end) {
        return ordersRepository.findByCreateTime(start, end);
    }
}
