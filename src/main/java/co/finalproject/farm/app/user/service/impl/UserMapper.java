package co.finalproject.farm.app.user.service.impl;

import java.util.List;

import co.finalproject.farm.app.user.service.UserVO;

public interface UserMapper {
	
	public int idCheck(UserVO vo);    			//id 중복체크
	public int emailCheck(UserVO vo); 			//이메일 중복체크
	public UserVO loginCheck(UserVO vo);		//로그인 체크
	public UserVO idFind(UserVO vo);			//id찾기
	public int pwFind(UserVO vo);				//pw 찾기
	
	public UserVO getUser(UserVO vo);			//회원 단건조회(회원 아이디로 조회)
	public List<UserVO> getUserList(UserVO vo);	//회원 전체조회
	
	public int insertUser(UserVO vo); 			//회원가입
	public int updateUser(UserVO vo); 			//회원 정보수정 
	public int updateUserToFarmer(UserVO vo);	//회원 권한 변경(user-> farmer)
	public int deleteUser(UserVO vo);			//회원탈퇴 또는 관리자 페이지 내에서 회원 삭제

}
