package com.vuisk.blogs.controller.api;

import com.google.common.base.Strings;
import com.vuisk.blogs.model.dto.OrdersOut;
import com.vuisk.blogs.model.dto.Response;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.service.impl.OrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping("/api/getMessage")
public class BotController {

    @Autowired
    private OrdersServiceImpl orderService;

    @RequestMapping
    public Response get(@RequestParam(value = "time", required = false, defaultValue = "0") String time,
                        @RequestParam(value = "type", required = false, defaultValue = "0") int type) {
        List<Orders> list = null;
        if(type == 2){
            list = orderService.findAll();
        }else{
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(System.currentTimeMillis());
            cal.set(Calendar.HOUR_OF_DAY,0);
            cal.set(Calendar.MINUTE,0);
            cal.set(Calendar.SECOND,0);
            long startTime = cal.getTimeInMillis();
            cal.set(Calendar.HOUR_OF_DAY,23);
            cal.set(Calendar.MINUTE,59);
            cal.set(Calendar.SECOND,59);
            long endTime = cal.getTimeInMillis();
            list = orderService.findByCreate(startTime, endTime);
        }
        String mssg = "";
        if(list != null && !list.isEmpty()){
            for(Orders o : list){
                mssg += o.getName()+" "+o.getQuantity()+"s: "+o.getMenu();
                if(!Strings.isNullOrEmpty(o.getNote())){
                    mssg += "("+o.getNote() +")";
                }
                mssg += "\n";
            }
            mssg += "Tổng: "+list.size();
        }
        return new Response(true, mssg,  null);
    }
}
