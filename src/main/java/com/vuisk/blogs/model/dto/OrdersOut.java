package com.vuisk.blogs.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersOut {
    private Long id;

    private String name;

    private int quantity;

    private String menu;

    private String note;

    private int payment;

    private String createTime;

    private String department;

    private String descriptionPayment;

    private String description;
}
