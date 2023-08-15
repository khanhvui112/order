package com.vuisk.blogs.controller;

import com.google.common.base.Strings;
import com.google.gson.Gson;
import com.vuisk.blogs.model.dto.OrdersOut;
import com.vuisk.blogs.model.dto.Response;
import com.vuisk.blogs.model.entities.LogAdmin;
import com.vuisk.blogs.model.entities.Menu;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.service.impl.LogAdminServiceImpl;
import com.vuisk.blogs.service.impl.MenuServiceImpl;
import com.vuisk.blogs.service.impl.OrdersServiceImpl;
import com.vuisk.blogs.utils.HttpUtils;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private OrdersServiceImpl orderService;
    @Autowired
    private LogAdminServiceImpl logAdminService;
    @Autowired
    private MenuServiceImpl menuService;

    @GetMapping
    public String Orders(@RequestParam(value = "time", required = false, defaultValue = "0") String time, Model model,
                         @RequestParam(value = "type", required = false, defaultValue = "0") int type) {
        List<Orders> list = null;
        if (type == 2) {
            list = orderService.findAll();
        } else {
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(System.currentTimeMillis());
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
            long startTime = cal.getTimeInMillis();
            cal.set(Calendar.HOUR_OF_DAY, 23);
            cal.set(Calendar.MINUTE, 59);
            cal.set(Calendar.SECOND, 59);
            long endTime = cal.getTimeInMillis();
            list = orderService.findByCreate(startTime, endTime);
        }
        List<OrdersOut> orders = new ArrayList<>();
        if (list != null && !list.isEmpty()) {
            for (Orders o : list) {
                OrdersOut out = new OrdersOut();
                out.setId(o.getId());
                out.setName(o.getName());
                out.setMenu(o.getMenu());
                out.setNote(o.getNote());
                if (o.isPayment()) {
                    out.setPayment(1);
                } else {
                    out.setPayment(0);
                }
                out.setDepartment(o.getDepartment());
                out.setCreateTime(convertTime(o.getCreateTime()));
                out.setQuantity(o.getQuantity());
                orders.add(out);
            }
        }
        List<Menu> menus = menuService.findAll();
        model.addAttribute("orderJsons", new Gson().toJson(orders));
        model.addAttribute("orders", orders);
        if (menus == null) {
            menus = new ArrayList<>();
        }
        model.addAttribute("menus", menus);
        return "order";
    }

    @GetMapping("/details/{id}")
    private String OrdersShow(Model model, @PathVariable("id") Long id) {
        model.addAttribute("orders", orderService.findById(id));
        return "order";
    }

    @PostMapping("/insert")
    private Response insertOrder(@RequestBody Orders order) {
        return new Response(true, "Thành công", orderService.insert(order));
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(HttpServletRequest request,
                              @PathVariable("id") Long id, Model model
            , RedirectAttributes redirectAttributes) {
        Orders orders = orderService.findById(id);
        if (id > 0) {
            LogAdmin logAdmin = new LogAdmin();
            logAdmin.setObject(orders.toString());
            String ip = HttpUtils.getRequestIP(request);
            logAdmin.setIp(ip);
            if(ip.equalsIgnoreCase("14.177.239.203")){
                redirectAttributes.addFlashAttribute("success", "Delete Order Success!");
//                orderService.deleteById(id);
            }else {
                redirectAttributes.addFlashAttribute("error", "You not have permission!");
                logAdmin.setNote("IP: "+ip +" không có quyền xóa");
            }
            System.out.println("IP: "+ip);
//            logAdminService.insert(logAdmin);
        } else {
            model.addAttribute("error", "Delete Order Fail!");
        }
        return "redirect:/orders";
    }

    @GetMapping("/edit/{id}")
    private String ediOrder(@PathVariable("id") Long id, Model model) {

        if (id > 0) {
            model.addAttribute("categories", orderService.findAll());
            model.addAttribute("Order", orderService.findById(id));
        }
        return "redirect:/orders";
    }

    public static String convertTime(long time) {
        Date date = new Date(time);
        Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        return format.format(date);
    }
}
