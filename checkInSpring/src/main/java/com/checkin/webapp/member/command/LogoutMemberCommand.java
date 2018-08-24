package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.master.command.MasterCommandInterface;
import com.checkin.webapp.master.model.MasterVO;

public class LogoutMemberCommand implements MasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		//mav 생성
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	@Override
	public MasterVO executeVo(HttpServletRequest request, MasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
