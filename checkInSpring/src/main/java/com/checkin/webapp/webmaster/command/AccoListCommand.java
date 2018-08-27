package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;

public class AccoListCommand {
	public ModelAndView execute(HttpServletRequest request) {
		
		WebmasterDAOInterface dao =Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		List<AccomodationVO> list = dao.showAccoList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("/webmaster/accomodation/showAccoList");
		return mav;
		
	}
}
