package com.dev.hotelpms.home;

import com.dev.hotelpms.pay.PayService;
import com.dev.hotelpms.pay.PayVO;
import com.dev.hotelpms.room.BookingService;
import com.dev.hotelpms.room.ReservedVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private PayService payService;

    @GetMapping("/")
    public ModelAndView home() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<ReservedVO> voSuccessList=  bookingService.getSucessReserve("더블");
        mv.addObject("duubleList",voSuccessList);
        voSuccessList=  bookingService.getSucessReserve("디럭스");
        mv.addObject("deluxList",voSuccessList);
        voSuccessList=  bookingService.getSucessReserve("스위트");
        mv.addObject("sweetList",voSuccessList);
        voSuccessList=  bookingService.getSucessReserve("스탠다드");
        mv.addObject("standardList",voSuccessList);
        voSuccessList=  bookingService.getSucessReserve("트윈");
        mv.addObject("twinList",voSuccessList);
        List<ReservedVO> voPossibleList=  bookingService.getPossibleReserve();
        mv.addObject("possibleList",voPossibleList);
        PayVO payVO = new PayVO();
        payVO =  payService.getPayDetail(payVO);
        mv.addObject("payVO",payVO);
        mv.setViewName("index");
        return mv;
    }

}
