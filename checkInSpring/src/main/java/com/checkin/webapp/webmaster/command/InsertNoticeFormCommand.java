package com.checkin.webapp.webmaster.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class InsertNoticeFormCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("webmaster/notice/writeNotice");
		return mav;
	}

}
