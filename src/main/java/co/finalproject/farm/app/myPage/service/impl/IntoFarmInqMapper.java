package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.IntoFarmInqVO;
import co.finalproject.farm.app.myPage.service.IntoFarmReplyVO;


public interface IntoFarmInqMapper {
	
	public List<IntoFarmInqVO> getintoFarmInqList();
	
	public IntoFarmInqVO getintoFarmInq(IntoFarmInqVO vo);
	
	public int insertintoFarmInq(IntoFarmInqVO vo);
	
	public int updateintoFarmInq(IntoFarmInqVO vo);
	
	public int deleteintoFarmInq(IntoFarmInqVO vo);
	
	
	//댓글
//	public List<IntoFarmReplyVO> getintoFarmReplyList(IntoFarmReplyVO vo);
//	public int insertintoFarmReply(IntoFarmReplyVO vo);
//	public int deleteintoFarmReply(IntoFarmReplyVO vo);

}
