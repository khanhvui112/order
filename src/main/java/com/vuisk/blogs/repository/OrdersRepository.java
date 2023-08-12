package com.vuisk.blogs.repository;

import com.vuisk.blogs.model.entities.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

    @Query("SELECT u FROM Orders u WHERE u.createTime >= ?1 and u.createTime <= ?2")
    List<Orders> findByCreateTime(long start, long end);
}
