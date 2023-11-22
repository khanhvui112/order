package com.vuisk.blogs.model.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private int quantity;

    private String menu;

    private String note;

    private String department;

    private boolean payment;

    private String notePayment;

    @Column(columnDefinition = "text")
    private String descriptionPayment;

    private String description;

    @Column(columnDefinition = "longtext")
    private String qrPayment;
    private long createTime = System.currentTimeMillis();
}
