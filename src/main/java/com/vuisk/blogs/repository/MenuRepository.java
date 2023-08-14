package com.vuisk.blogs.repository;

import com.vuisk.blogs.model.entities.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Long> {
}
