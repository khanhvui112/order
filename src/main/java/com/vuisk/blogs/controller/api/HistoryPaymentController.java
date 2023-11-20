package com.vuisk.blogs.controller.api;

import com.vuisk.blogs.model.dto.Response;
import com.vuisk.blogs.model.entities.HistoryPayment;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.service.impl.ConfigServiceImpl;
import com.vuisk.blogs.service.impl.HistoryPaymentServiceImpl;
import com.vuisk.blogs.service.impl.OrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/api/history")
public class HistoryPaymentController {

    @Autowired
    private HistoryPaymentServiceImpl historyPaymentService;

    @GetMapping("/")
    public Response findStatus() {
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
        List<HistoryPayment>  list = historyPaymentService.findTodayAndStatus(startTime, 0);
        String msg = "";
        if(!list.isEmpty()){
            for(HistoryPayment h : list){
                if(!h.isStatus()){
                    msg += h.getName()+" đã CK với nội dụng: "+h.getDescription() +"\n";
                    h.setStatus(true);
                    historyPaymentService.insert(h);
                }
            }
        }
        return new Response(true, msg,  null);
    }
}
