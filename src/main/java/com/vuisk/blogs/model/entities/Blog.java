package com.vuisk.blogs.model.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.Instant;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Blog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(name = "category_id")
    private long categoryId;

    private String content;

    private boolean active;

    @JsonFormat(pattern = "dd-MM-yyyy HH:mm:ss", timezone = "UTC")
    private Instant createTime = Instant.now();

    @ManyToOne
    @JoinColumn(name = "category_id", insertable = false, updatable = false)
    private Category category;
}
