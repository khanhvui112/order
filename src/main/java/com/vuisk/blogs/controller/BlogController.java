package com.vuisk.blogs.controller;

import com.vuisk.blogs.model.entities.Blog;
import com.vuisk.blogs.model.entities.Category;
import com.vuisk.blogs.service.impl.BlogServiceImpl;
import com.vuisk.blogs.service.impl.CategoryServiceImpl;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/blogs")
public class BlogController {

    @Autowired
    private BlogServiceImpl blogServiceImpl;

    @Autowired
    private CategoryServiceImpl categoryServiceImpl;

    @GetMapping
    private String blogs(Model model){
        model.addAttribute("orders", blogServiceImpl.findAll());
        return "blog";
    }

    @GetMapping("/details/{id}")
    private String blogsShow(Model model, @PathVariable("id") Long id){
        model.addAttribute("blog", blogServiceImpl.findById(id));
        return "user/blog-show";
    }

    @GetMapping("/insert")
    private String formBlog(Model model){
        model.addAttribute("categories",categoryServiceImpl.findAll());
        model.addAttribute("blog", new Blog());
        return "blog/insert";
    }

    @PostMapping("/insert")
    private String insertBlog(@Valid @ModelAttribute("blog") Blog blog
            , BindingResult result
            , RedirectAttributes redirectAttributes){

        if (!result.hasErrors()){
            redirectAttributes.addFlashAttribute("success","Insert Blog Success");
            blogServiceImpl.insert(blog);
            return "redirect:/blogs";
        }
        redirectAttributes.addFlashAttribute("error","Insert Blog Fail");
        return "blog/insert";
    }

    @GetMapping("/delete/{id}")
    public String deleteBlog(@PathVariable("id") Long id, Model model
            , RedirectAttributes redirectAttributes){

        if (id > 0){
            redirectAttributes.addFlashAttribute("success", "Delete Blog Success!");
            blogServiceImpl.deleteById(id);
        }else{
            model.addAttribute("error","Delete Blog Fail!");
        }
        return "redirect:/blogs";
    }

    @GetMapping("/edit/{id}")
    private String ediBlog(@PathVariable("id") Long id, Model model){

        if (id > 0){
            model.addAttribute("categories",categoryServiceImpl.findAll());
            model.addAttribute("blog",blogServiceImpl.findById(id));
            return "blog/edit";
        }
        return "redirect:/blogs";
    }
    @PostMapping("/edit")
    private String editCategory(@Valid @ModelAttribute("category") Blog blog,
                                BindingResult result,
                                RedirectAttributes redirectAttributes){

        if (blog.getId() != null && !result.hasErrors()){
            redirectAttributes.addFlashAttribute("success","Update Blog Sucess!");
            blogServiceImpl.update(blog);
        }else{
            redirectAttributes.addFlashAttribute("success","Update Blog Fail!");
        }
        return "redirect:/blogs";
    }
}
