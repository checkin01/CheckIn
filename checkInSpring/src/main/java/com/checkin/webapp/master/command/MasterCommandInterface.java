package com.checkin.webapp.master.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.master.model.MasterVO;

public interface MasterCommandInterface {
	public ModelAndView execute(HttpServletRequest request, MasterVO vo);
	
	public ModelAndView execute(HttpServletRequest request);
	
	public MasterVO executeVo(HttpServletRequest request, MasterVO vo);
}
