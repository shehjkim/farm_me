package co.finalproject.farm.app.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.finalproject.farm.app.myPage.service.FarmVO;
import co.finalproject.farm.app.myPage.service.puchasInqVO;
import co.finalproject.farm.app.myPage.service.puchasReplyVO;
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
	
	//등록폼
		@RequestMapping("/insertpuchasInq")
		public String insertpuchasInq(puchasInqVO vo, Model model) {
			return "mypage/insertpuchasInq";
		}

	//등록처리
		@PostMapping("/insertpuchasInq")
		public String insertpuchasInqProc(puchasInqVO vo,MultipartHttpServletRequest request) throws Exception,IOException{
			//파일 업로드
			MultipartFile file = vo.getInqfile();
			String pur_inq_filename="";
			
			if(file != null && !file.isEmpty() &&  file.getSize() > 0) {
				String filename = file.getOriginalFilename();
			
				File rename = FileRenamePolicy.rename(new File("C:\\upload", filename));
				pur_inq_filename += rename.getName();
				file.transferTo(rename);//임시폴더에서 업로드 폴더로 이동
			}
			vo.setPur_inq_filename(pur_inq_filename);
				
			logger.debug(vo.toString());
			pciMapper.insertpuchasInq(vo);
			return "mypage/getpuchasInqList";
		}
	

	//수정-수정폼
	@RequestMapping("/updatepuchasInq")
	public String updatepuchasInq(Model model,puchasInqVO vo) {
		model.addAttribute("pupdate", pciMapper.getpuchasInq(vo));
		return "mypage/updatepuchasInq";
		
	}
	
	//수정-수정처리
	@PostMapping("/updatepuchasInq")
	public String updatepuchasInq(puchasInqVO vo,MultipartHttpServletRequest request) throws Exception,IOException {
		//파일 업로드
		MultipartFile file = vo.getInqfile();
		String pur_inq_filename="";
		
		if(file != null && !file.isEmpty() &&  file.getSize() > 0) {
			String filename = file.getOriginalFilename();
		
			File rename = FileRenamePolicy.rename(new File("C:\\upload", filename));
			pur_inq_filename += rename.getName();
			file.transferTo(rename);//임시폴더에서 업로드 폴더로 이동
		}
		vo.setPur_inq_filename(pur_inq_filename);
		
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
	
//댓글
//댓글 조회
	@RequestMapping("/getpuchasReplyList")
	public @ResponseBody List<puchasReplyVO> getpuchasReplyList(puchasReplyVO vo){
		return pciMapper.getpuchasReplyList(vo);
	}
	
//댓글 등록
	@RequestMapping("/insertpuchasReply")
	public @ResponseBody puchasReplyVO insertpuchasReply(puchasReplyVO vo) {
		pciMapper.insertpuchasReply(vo);
		return vo;
	}
	
//댓글 삭제
	@RequestMapping("/deletepuchasReply")
	public @ResponseBody puchasReplyVO deletepuchasReply(puchasReplyVO vo) {
		pciMapper.deletepuchasReply(vo);		
		return vo;
	}
	

}
