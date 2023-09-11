package com.vuisk.blogs.repository;

import com.vuisk.blogs.model.entities.Config;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ConfigRepository extends JpaRepository<Config, Long> {
    @Query("SELECT u FROM Config u WHERE u.name >= ?1")
    List<Config> findByName(String name);
}
