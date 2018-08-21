package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.member.model.MemberVO;

public interface MemberCommandInterface {
	public ModelAndView execute(HttpServletRequest request, MemberVO vo);
	
	public ModelAndView execute(HttpServletRequest request);
	
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo);
}
