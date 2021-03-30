package co.finalproject.farm.app.myPage.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.myPage.service.FarmVO;
import co.finalproject.farm.app.myPage.service.impl.FarmMapper;
import co.finalproject.farm.app.notice.service.NoticeVO;

@Controller
public class FarmController {

	@Autowired
	FarmMapper farmMapper;

	Logger logger = LoggerFactory.getLogger(FarmController.class);

//전체조회
	@RequestMapping("/getFarmList")
	public String getFarmList(Model model) {
		model.addAttribute("farmlist", farmMapper.getFarmList());
		return "mypage/getFarmList";
	}

//단건조회
	@RequestMapping("/getFarm")
	public @ResponseBody List<FarmVO> getFarm(FarmVO vo) {
		return farmMapper.getFarm(vo);
	}

//등록폼
	@RequestMapping("/insertFarm")
	public String insertFarm(Model model) {
		return "mypage/insertFarm";
	}

//등록처리
	@PostMapping("/insertFarm")
	public String insertFarmProc(FarmVO vo) {
		logger.debug(vo.toString());
		farmMapper.insertFarm(vo);
		return "redirect:getFarmList";

	}

//수정
	// 수정폼
	@RequestMapping("/updateFarm")
	public String updateFarm(Model model) {
		return "mypage/updateFarm";
	}

	// 수정처리
	@PostMapping("/updateFarm")
	public String updateFarmProc(FarmVO vo) {
		logger.debug(vo.toString());
		farmMapper.updateFarm(vo);
		return "redirect:getFarm?farm_no=" + vo.getFarm_no();
	}

//삭제
	@GetMapping("/deleteFarm")
	public String deleteFarm(FarmVO vo) {
		farmMapper.deleteFarm(vo);

		return "redirect:getFarmList";
	}

}
