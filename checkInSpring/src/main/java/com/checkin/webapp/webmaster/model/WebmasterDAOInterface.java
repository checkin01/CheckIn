package com.checkin.webapp.webmaster.model;

import java.util.List;

import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.master.model.MasterVO;
import com.checkin.webapp.member.model.MemberVO;

public interface WebmasterDAOInterface {
	//웹마스터 로그인
	public WebmasterVO selectWebmaster(WebmasterVO vo);
	
	//member 정보 확인
	public List<MemberVO> showMemberList(WebmasterVO vo);
	
	//master 정보 확인
	public List<MasterVO> showMasterList(WebmasterVO vo);
	
	//accomodation 정보 확인
	public List<AccomodationVO> showAccoList(WebmasterVO vo);
	
	public int getAllMemberListCnt();
	
	public int getAllAccoListCnt();
	
	public int getAllMasterListCnt();
}
