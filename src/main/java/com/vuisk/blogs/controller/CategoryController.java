package com.vuisk.blogs.controller;

import com.vuisk.blogs.model.entities.Category;
import com.vuisk.blogs.service.impl.CategoryServiceImpl;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryServiceImpl categoryServiceImpl;

    @GetMapping
    private String category(Model model){
        model.addAttribute("categories", categoryServiceImpl.findAll());
        return "category";
    }
    @GetMapping("/insert")
    private String formCategory(Model model){
        model.addAttribute("category", new Category());
        return "form/insert";
    }

    @PostMapping("/insert")
    private String insertCategory(@ModelAttribute("category") Category category
            , RedirectAttributes redirectAttributes){

        if (Strings.isNotBlank(category.getName())){
            redirectAttributes.addFlashAttribute("success","Insert Category Success");
            categoryServiceImpl.insert(category);
            return "redirect:/category";
        }
        return "form/insert";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model
            , RedirectAttributes redirectAttributes){

        if (id > 0){
            redirectAttributes.addFlashAttribute("success", "Delete Category Success!");
            categoryServiceImpl.deleteById(id);
        }else{
            model.addAttribute("error","Delete Category Fail!");
        }
        return "redirect:/category";
    }

    @GetMapping("/edit/{id}")
    private String editCategory(@PathVariable("id") Long id, Model model){

        if (id > 0){
            model.addAttribute("category",categoryServiceImpl.findById(id));
            return "form/edit";
        }
        return "redirect:/category";
    }
    @PostMapping("/edit")
    private String editCategory(@ModelAttribute("category") Category category,
                                RedirectAttributes redirectAttributes){

        if (category.getId() != null){
            redirectAttributes.addFlashAttribute("success","Update Category Sucess!");
            categoryServiceImpl.update(category);
        }else{
            redirectAttributes.addFlashAttribute("success","Update Category Fail!");
        }
        return "redirect:/category";
    }
}
