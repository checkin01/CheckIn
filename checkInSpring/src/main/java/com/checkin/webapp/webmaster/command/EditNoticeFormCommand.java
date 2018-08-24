package com.checkin.webapp.webmaster.command;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeDAOInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class EditNoticeFormCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo) {
		return null;
	}

	@Override
	public ModelAndView execute(int no) {
		NoticeDAOInterface dao = Constants.sqlSession.getMapper(NoticeDAOInterface.class);
		NoticeVO vo = dao.selectOneNotice(no);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo",vo);
		mav.setViewName("/webmaster/notice/editNotice");
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
