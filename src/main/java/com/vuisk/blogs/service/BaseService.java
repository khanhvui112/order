package com.vuisk.blogs.service;

import java.util.List;

public interface BaseService<T> {

    List<T> findAll();

    T findById(Long id);

    T insert(T t);

    T update(T t);

    void deleteById(Long id);
}
