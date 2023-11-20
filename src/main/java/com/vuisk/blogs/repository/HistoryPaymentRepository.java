package com.vuisk.blogs.repository;

import com.vuisk.blogs.model.entities.HistoryPayment;
import com.vuisk.blogs.model.entities.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface HistoryPaymentRepository extends JpaRepository<HistoryPayment, Long>  {
    @Query("SELECT u FROM HistoryPayment u WHERE u.createTime >= ?1 and u.status <= ?2")
    List<HistoryPayment> findTodayAndStatus(long createTime, long status);
}
