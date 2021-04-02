package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.puchasInqVO;

public interface PurchaseInqMapper {
	
	public List<puchasInqVO> getpuchasInqList();
	
	public puchasInqVO getpuchasInq(puchasInqVO vo);
	
	public int insertpuchasInq(puchasInqVO vo);
	
	public int updatepuchasInq(puchasInqVO vo);
	
	public int deletepuchasInq(puchasInqVO vo);

}
