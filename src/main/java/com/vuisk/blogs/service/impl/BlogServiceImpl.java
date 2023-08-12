package com.vuisk.blogs.service.impl;

import com.vuisk.blogs.model.entities.Blog;
import com.vuisk.blogs.repository.BlogRepository;
import com.vuisk.blogs.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogRepository blogRepository;

    @Override
    public List<Blog> findAll() {
        return blogRepository.findAll();
    }

    @Override
    public Blog findById(Long id) {
        return blogRepository.findById(id).orElse(null);
    }

    @Override
    public Blog insert(Blog blog) {
        return blogRepository.save(blog);
    }

    @Override
    public Blog update(Blog blog) {
        return blogRepository.save(blog);
    }

    @Override
    public void deleteById(Long id) {
        blogRepository.deleteById(id);
    }
}
