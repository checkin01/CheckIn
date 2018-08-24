package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.member.model.MemberVO;

public class preModifyMemberCommand implements MemberCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {	
		//mav생성
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/mypage/checkPwdInfo");
		return mav;
	}

	@Override
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
