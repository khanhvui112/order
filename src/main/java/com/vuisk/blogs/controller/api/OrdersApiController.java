package com.vuisk.blogs.controller.api;

import com.google.common.base.Strings;
import com.vuisk.blogs.model.dto.OrdersOut;
import com.vuisk.blogs.model.dto.Response;
import com.vuisk.blogs.model.entities.Config;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.service.impl.ConfigServiceImpl;
import com.vuisk.blogs.service.impl.OrdersServiceImpl;
import com.vuisk.blogs.utils.HttpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/api/order")
public class OrdersApiController {

    @Autowired
    private OrdersServiceImpl orderService;
    @Autowired
    private ConfigServiceImpl configService;

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
    private Response updateOrder(@RequestBody Orders order, HttpServletRequest request){
        String ip = HttpUtils.getRequestIP(request);
        if(!ip.startsWith("14.") && !ip.startsWith("0:")){
            return new Response(false, "Bạn không thể cập nhật bản ghi này "+ip,  null);
        }
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
        return new Response(true, "Thành công "+ip,  orderService.insert(order));
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

    @RequestMapping(value = "/updateTransaction", method = RequestMethod.POST)
    private Response updateTransaction(@RequestBody List<String> lst, HttpServletRequest request){
        String ip = HttpUtils.getRequestIP(request);
        List<Config> configs = configService.findByName("IP_ACCEPT");
        List<String> ips = new ArrayList<>(Arrays.asList(configs.get(0).getValue().split(",")));
        if(!ips.contains(ip) || !ip.startsWith("14.") && !ip.startsWith("0:")){//!ip.startsWith("14.") && !ip.startsWith("0:") ||
            return new Response(false, "Bạn không thể cập nhật bản ghi này "+ip,  null);
        }
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        long startTime = cal.getTimeInMillis();
//        startTime = startTime - 86400000;//Ngayf hom qua
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        long endTime = cal.getTimeInMillis();
//        endTime = endTime - 86400000;
        List<Orders> orders = orderService.findByCreate(startTime, endTime);
        List<Orders> outs = new ArrayList<>();
        if(orders != null && !orders.isEmpty()){
            for (Orders o : orders){
                if(!o.isPayment()){
                    for(String s : lst){
                        List<String> names = new ArrayList<>(Arrays.asList(s.split(",")));
                        if(o.getName().equalsIgnoreCase(names.get(0))){
                            o.setPayment(true);
                            o.setNote(o.getNote()+"(Bot đã cập nhật thanh toán lúc: "+convertTime(System.currentTimeMillis())+")");
                            orderService.update(o);
                            outs.add(o);
                        }
                    }
                }
            }
        }
        return new Response(true, "Thành công "+ip,  outs);
    }
    public static String convertTime(long time) {
        Date date = new Date(time);
        Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        return format.format(date);
    }
}
