package com.checkin.webapp.member.model;

import java.util.List;

public interface MemberDAOInterface {
	//로그인, 마이페이지
	public MemberVO selectMember(MemberVO vo);
	
	//포인트
	public int mypageMember(int u);
	
	//회원가입
	public int insertMember(MemberVO vo);
	
	//회원탈퇴
	public int deleteMember(MemberVO vo);
	
	//전체 멤버 보기
	public List<MemberVO> selectAllMember(MemberVO vo);
	
	//일반회원 아이디 중복체크
	public int uidCheck(String uuid);
	
	//회원정보 수정페이지 들어가기 전 비밀번호 체크
	public String checkMemberPwd(MemberVO vo);
	
	//회원정보 수정페이지 회원정보 표시
	public MemberVO editInfoMember(MemberVO vo);
	
	//회원정보 수정
	public int editMember(MemberVO vo);
	
	//회원정보 수정시 비밀번호 미변경시 현 비밀번호 가져오기
	public String selectMemberPwd(MemberVO vo);
		
}
