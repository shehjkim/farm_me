package co.finalproject.farm.app.myPage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.myPage.service.impl.OrderMapper;

@Controller
public class OrderController {
	
	@Autowired OrderMapper orderMapper;
	
	Logger logger = LoggerFactory.getLogger(OrderController.class);
	
//전체조회
	@RequestMapping("/getOrderList")
	public String getOrderList(Model model) {
		model.addAttribute("list", orderMapper.getOrderList());
		System.out.println(model);
		return "mypage/getOrderList";
	}
	

}
