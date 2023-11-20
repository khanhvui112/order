package com.vuisk.blogs.model.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class HistoryPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private long orderId;

    private String description;

    private String name;

    private boolean status;

    private long createTime = System.currentTimeMillis();

    public HistoryPayment(long orderId, String description, String name) {
        this.orderId = orderId;
        this.description = description;
        this.name = name;
    }
}
