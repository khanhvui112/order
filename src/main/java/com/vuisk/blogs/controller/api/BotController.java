package com.vuisk.blogs.controller.api;

import com.google.common.base.Strings;
import com.vuisk.blogs.model.dto.OrdersOut;
import com.vuisk.blogs.model.dto.Response;
import com.vuisk.blogs.model.entities.Config;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.service.impl.ConfigServiceImpl;
import com.vuisk.blogs.service.impl.OrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping("/api")
public class BotController {

    @Autowired
    private OrdersServiceImpl orderService;
    @Autowired
    private ConfigServiceImpl configService;
    @RequestMapping("/getMessage")
    public Response get(@RequestParam(value = "time", required = false, defaultValue = "0") String time,
                        @RequestParam(value = "type", required = false, defaultValue = "0") int type) {
        List<Orders> list = null;
        if(1 > 1 && type == 2){
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
            List<Orders> ordersDis = new ArrayList<>();
            List<Integer> idRemove = new ArrayList<>();
            for (int i = 0; i < list.size(); i++) {
                Orders o = list.get(i);
                for (int j = i + 1; j < list.size(); j++) {
                    Orders o2 = list.get(j);
                    if(o.getMenu().equalsIgnoreCase(o2.getMenu())){
                        if(Strings.isNullOrEmpty(o.getNote()) && Strings.isNullOrEmpty(o2.getNote()) || o.getNote().equalsIgnoreCase(o2.getNote())){
                            idRemove.add(i);
                            ordersDis.add(o2);
                        }
                    }
                }
            }
            if (!idRemove.isEmpty()) {
                list.removeAll(ordersDis);
                for (Orders o : list) {
                    for (Orders o2 : ordersDis) {
                        if(o.getMenu().equalsIgnoreCase(o2.getMenu())){
                            if (Strings.isNullOrEmpty(o.getNote()) && Strings.isNullOrEmpty(o2.getNote()) || o.getNote().equalsIgnoreCase(o2.getNote())) {
                                o.setQuantity(o.getQuantity()+o2.getQuantity());
                                o.setNote(o.getNote());
                                if(!Strings.isNullOrEmpty(o2.getNote())){
                                    o.setNote(o.getNote() + " | "+o2.getNote());
                                }
                                o.setName(o.getName()+", "+o2.getName());
                            }
                        }
                    }
                }
            }
            int total = 0;
            for(Orders o : list){
                mssg += o.getName()+" "+o.getQuantity()+"s: "+o.getMenu();
                if(!Strings.isNullOrEmpty(o.getNote())){
                    mssg += "("+o.getNote() +")";
                }
                total += o.getQuantity();
                mssg += "\n";
            }
            mssg += "Tổng: "+total;
        }
        System.out.println(mssg);
        return new Response(true, mssg,  null);
    }


    @RequestMapping(value = "/getRefreshToken", method = RequestMethod.GET)
    public Response getRefreshToken(){
        List<Config> configs = configService.findByName("REFRESH_TOKEN");
        if(configs != null && !configs.isEmpty()){
            Config config = configs.get(0);
            return new Response(true, "Lấy token thành công",  config.getValue());
        }
        return new Response(false, "Lấy token thất bại",  null);
    }
    @RequestMapping(value = "/getToken", method = RequestMethod.GET)
    public Response getToken(){
        List<Config> configs = configService.findByName("TOKEN");
        if(configs != null && !configs.isEmpty()){
            Config config = configs.get(0);
            return new Response(true, "Lấy token thành công",  config.getValue());
        }
        return new Response(false, "Lấy token thất bại",  null);
    }
    @RequestMapping("/updateToken")
    public Response updateToken(@RequestParam String token){
        List<Config> configs = configService.findByName("TOKEN");
        if(configs != null && !configs.isEmpty()){
            Config config = configs.get(0);
            config.setValue(token);
            configService.update(config);
            return new Response(true, "Update token thành công",  config.getValue());
        }
        return new Response(false, "Update token thất bại",  null);
    }
    @RequestMapping("/updateRefreshToken")
    public Response updateRefreshToken(@RequestParam String token){
        List<Config> configs = configService.findByName("REFRESH_TOKEN");
        if(configs != null && !configs.isEmpty()){
            Config config = configs.get(0);
            config.setValue(token);
            config.setUpdateTime(System.currentTimeMillis());
            configService.update(config);
            return new Response(true, "Update token thành công",  config.getValue());
        }
        return new Response(false, "Update token thất bại",  null);
    }
    @RequestMapping(value = "/lastUpdateRefreshToken", method = RequestMethod.GET)
    public Response lastUpdateRefreshToken(){
        List<Config> configs = configService.findByName("REFRESH_TOKEN");
        if(configs != null && !configs.isEmpty()){
            Config config = configs.get(0);
            return new Response(true, "Lấy token thành công",  config.getUpdateTime());
        }
        return new Response(false, "Lấy token thất bại",  null);
    }

    @RequestMapping("/getTokenSendSMS")
    public Response getTokenSendSMS(){
        List<Config> configs = configService.findByName("TOKEN_TWILIO");
        if(configs != null && !configs.isEmpty()){
            Config config = configs.get(0);
            return new Response(true, "Lấy token thành công",  config.getValue());
        }
        return new Response(false, "Lấy token thất bại",  null);
    }
}
