package com.vuisk.blogs.service.impl;


import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.repository.OrdersRepository;
import com.vuisk.blogs.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.Normalizer;
import java.util.List;
import java.util.regex.Pattern;

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
//        order.setPayment(false);
        String p = covertToString(order.getName().trim()) + " "+ order.getDepartment();
        order.setDescription(p.trim());
        return ordersRepository.save(order);
    }
    public String covertToString(String value) {
        try {
            String temp = Normalizer.normalize(value, Normalizer.Form.NFD);
            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
            return pattern.matcher(temp).replaceAll("");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return value;
    }
    @Override
    public Orders update(Orders order) {
//        order.setPayment(false);
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
