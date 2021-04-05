package co.finalproject.farm.app.myPage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import co.finalproject.farm.app.myPage.service.IntoFarmInqVO;
import co.finalproject.farm.app.myPage.service.impl.IntoFarmInqMapper;

@Controller
public class IntoFarmInqController {
	
	@Autowired IntoFarmInqMapper ifiMapper; 
	
	Logger logger = LoggerFactory.getLogger(IntoFarmInqController.class);
	
//getintoFarmInqList
//getintoFarmInq
//insertintoFarmInq
//updateintoFarmInq
//deleteintoFarmInq
	
	//전체조회
	@RequestMapping("/getintoFarmInqList")
	public String getintoFarmInqList(Model model) {
		model.addAttribute("list", ifiMapper.getintoFarmInqList());
		return "mypage/getintoFarmInqList";
	}
	
	//단건조회
	@RequestMapping("/getintoFarmInq")
		public String getintoFarmInq(Model model,IntoFarmInqVO vo) {
			model.addAttribute("ilist", ifiMapper.getintoFarmInq(vo));
			return "mypage/getintoFarmInq";
	}
	
	//등록폼
	@RequestMapping("/insertintoFarmInq")
	public String insertintoFarmInq(IntoFarmInqVO vo, Model model) {
		return "mypage/insertintoFarmInq";
	}
	
	//등록처리
			@PostMapping("/insertintoFarmInq")
			public String insertintoFarmInqProc(IntoFarmInqVO vo){		
				logger.debug(vo.toString());
				ifiMapper.insertintoFarmInq(vo);
				return "redirect:getintoFarmInqList";
			}
			
			//수정
			// 수정폼
			@RequestMapping("/updateintoFarmInq")
			public String updateintoFarmInq(Model model,IntoFarmInqVO vo) {
				model.addAttribute("ulist", ifiMapper.getintoFarmInq(vo));
				return "mypage/updateintoFarmInq";
			}

			// 수정처리
			@PostMapping("/updateintoFarmInq")
			public String updateintoFarmInqProc(IntoFarmInqVO vo) {
				logger.debug(vo.toString());
				ifiMapper.updateintoFarmInq(vo);
				return "redirect:getintoFarmInqList";
			}

		//삭제
			@GetMapping("/deleteintoFarmInq")
			public String intoFarmInqVO(IntoFarmInqVO vo) {
				ifiMapper.deleteintoFarmInq(vo);
				return "redirect:getintoFarmInqList";
			}
		

}
