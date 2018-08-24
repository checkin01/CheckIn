package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberDAOInterface;
import com.checkin.webapp.member.model.MemberVO;

public class showMemberCommand implements MemberCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MemberVO vo) {
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		HttpSession session = request.getSession();		
		int u = (Integer)session.getAttribute("u");	
		System.out.println("u22:"+u);
		
		MemberDAOInterface dao = Constants.sqlSession.getMapper(MemberDAOInterface.class);
		System.out.println("point00");
		
		///////////////////////////////////
		int point= dao.mypageMember(u);//upoint얻어오기
		
		System.out.println("point11:"+point);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("upoint",point);
		mav.setViewName("main/mypage/point");
		return mav;
	}

	@Override
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo) {
		return null;		
	}
}
