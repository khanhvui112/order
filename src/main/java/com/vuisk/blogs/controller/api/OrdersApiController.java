package com.vuisk.blogs.controller.api;

import com.google.common.base.Strings;
import com.vuisk.blogs.model.dto.OrdersOut;
import com.vuisk.blogs.model.dto.Response;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.service.impl.OrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
@RequestMapping("/api/order")
public class OrdersApiController {

    @Autowired
    private OrdersServiceImpl orderService;


    @GetMapping("/details/{id}")
    private String OrdersShow(Model model, @PathVariable("id") Long id){
        model.addAttribute("orders", orderService.findById(id));
        return "order";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    private Response insertOrder(@RequestBody Orders order){
        if(Strings.isNullOrEmpty(order.getName())){
            return new Response(false, "Vui lòng nhập tên",  null);
        }
        if(Strings.isNullOrEmpty(order.getMenu())){
            return new Response(false, "Vui lòng chọn món",  null);
        }
        if(order.getQuantity() == 0){
            return new Response(false, "Vui lòng nhập số lượng",  null);
        }
        return new Response(true, "Thành công",  orderService.insert(order));
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    private Response updateOrder(@RequestBody Orders order){
        Orders ordersDb = orderService.findById(order.getId());
        if(ordersDb == null){
            return new Response(false, "Không tìm thấy  ",  null);
        }
        order.setCreateTime(ordersDb.getCreateTime());
        if(Strings.isNullOrEmpty(order.getName())){
            return new Response(false, "Vui lòng nhập tên",  null);
        }
        if(Strings.isNullOrEmpty(order.getMenu())){
            return new Response(false, "Vui lòng chọn món",  null);
        }
        if(order.getQuantity() == 0){
            return new Response(false, "Vui lòng nhập số lượng",  null);
        }
        return new Response(true, "Thành công",  orderService.insert(order));
    }
    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable("id") Long id, Model model
            , RedirectAttributes redirectAttributes){

        if (id > 0){
            redirectAttributes.addFlashAttribute("success", "Delete Order Success!");
            orderService.deleteById(id);
        }else{
            model.addAttribute("error","Delete Order Fail!");
        }
        return "redirect:/Orders";
    }

    @GetMapping("/edit/{id}")
    private String ediOrder(@PathVariable("id") Long id, Model model){

        if (id > 0){
            model.addAttribute("categories",orderService.findAll());
            model.addAttribute("Order",orderService.findById(id));
            return "Order/edit";
        }
        return "redirect:/Orders";
    }
}
