package com.checkin.webapp.webmaster.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public interface WebmasterCommandInterface {
	
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo);
	
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo);
	
	public ModelAndView execute(HttpServletRequest request);
	
	public ModelAndView execute(int no);
}
