package com.vuisk.blogs.controller;

import com.vuisk.blogs.service.impl.BlogServiceImpl;
import com.vuisk.blogs.service.impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private CategoryServiceImpl categoryServiceImpl;

    @Autowired
    private BlogServiceImpl blogServiceImpl;

    @GetMapping
    private String user(Model model){
        model.addAttribute("blogs", blogServiceImpl.findAll());
        model.addAttribute("categories", categoryServiceImpl.findAll());
        return "user/index";
    }
    @GetMapping("/admin")
    private String home(){

        return "index";
    }
}
