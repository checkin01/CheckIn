package com.checkin.webapp.webmaster.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.webmaster.model.NoticeVO;

public interface WebmasterCommandInterface {
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo);
	
}
