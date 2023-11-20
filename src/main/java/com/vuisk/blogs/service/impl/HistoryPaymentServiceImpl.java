package com.vuisk.blogs.service.impl;

import com.vuisk.blogs.model.entities.HistoryPayment;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.repository.HistoryPaymentRepository;
import com.vuisk.blogs.service.HistoryPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class HistoryPaymentServiceImpl implements HistoryPaymentService {

    @Autowired
    private HistoryPaymentRepository historyPaymentRepository;

    @Override
    public List<HistoryPayment> findAll() {
        return historyPaymentRepository.findAll();
    }

    @Override
    public HistoryPayment findById(Long id) {
        return historyPaymentRepository.findById(id).orElse(null);
    }

    @Override
    public HistoryPayment insert(HistoryPayment historyPayment) {
        return historyPaymentRepository.save(historyPayment);
    }

    @Override
    public HistoryPayment update(HistoryPayment historyPayment) {
        return null;
    }

    @Override
    public void deleteById(Long id) {
        historyPaymentRepository.deleteById(id);
    }

    public List<HistoryPayment> findTodayAndStatus(long createTime, long status) {
        return historyPaymentRepository.findTodayAndStatus(createTime, status);
    }
}
