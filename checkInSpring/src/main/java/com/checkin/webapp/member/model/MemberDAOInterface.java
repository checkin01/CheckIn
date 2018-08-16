package com.checkin.webapp.member.model;

import java.util.List;

public interface MemberDAOInterface {
	//로그인, 마이페이지
	public MemberVO selectMember(MemberVO vo);
	
	//회원가입
	public int insertMember(MemberVO vo);
	
	//회원탈퇴
	public int deleteMember(MemberVO vo);
	
	//전체 멤버 보기
	public List<MemberVO> selectAllMember(MemberVO vo);
	
	
}
