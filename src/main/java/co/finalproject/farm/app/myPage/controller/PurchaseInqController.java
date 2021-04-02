package co.finalproject.farm.app.myPage.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.myPage.service.puchasInqVO;
import co.finalproject.farm.app.myPage.service.impl.PurchaseInqMapper;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class PurchaseInqController {
	
	@Autowired PurchaseInqMapper pciMapper;
	
	Logger logger = LoggerFactory.getLogger(PurchaseInqController.class);
	
//	getpuchasInqList	
//	getpuchasInq
//	insertpuchasInq	
//	updatepuchasInq	
//	deletepuchasInq

	//전체조회
	@RequestMapping("/getpuchasInqList")
	public String getpuchasInqList(Model model) {
		model.addAttribute("list", pciMapper.getpuchasInqList());
		return "mypage/getpuchasInqList";
		
	}
	
	//단건조회
	@RequestMapping("/getpuchasInq")
	public String getpuchasInq(Model model, puchasInqVO vo) {
		model.addAttribute("plist", pciMapper.getpuchasInq(vo));
		System.out.println(vo);
		return "mypage/getpuchasInq";
	}

	//수정-수정폼
	@RequestMapping("/updatepuchasInq")
	public String updatepuchasInq(Model model,puchasInqVO vo) {
		model.addAttribute("pupdate", pciMapper.getpuchasInq(vo));
		return "mypage/updatepuchasInq";
		
	}
	
	//수정-수정처리
	@PostMapping("/updatepuchasInq")
	public String updatepuchasInq(puchasInqVO vo) {
		logger.debug(vo.toString());
		pciMapper.updatepuchasInq(vo);
		return "redirect:getpuchasInqList";
	}
	
	//삭제
	@GetMapping("/deletepuchasInq")
	public String deletepuchasInq(puchasInqVO vo) {
		pciMapper.deletepuchasInq(vo);
		
		return "redirect:getpuchasInqList";
	}

}
