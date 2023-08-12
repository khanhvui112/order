package com.vuisk.blogs.repository;

import com.vuisk.blogs.model.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
