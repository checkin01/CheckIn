package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.master.model.MasterVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;

public class MasterListCommand {
	public ModelAndView execute(HttpServletRequest request) {
		
		WebmasterDAOInterface dao = Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		List<MasterVO> list = dao.showMasterList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("/webmaster/member/showMaster");
		return mav;
	}
}
