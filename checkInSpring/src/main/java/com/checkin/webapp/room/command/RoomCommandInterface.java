package com.checkin.webapp.room.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.room.model.RoomVO;

public interface RoomCommandInterface {
	public ModelAndView execute(HttpServletRequest request,RoomVO vo);
	public ModelAndView execute(HttpServletRequest request);
	
}
