package com.checkin.webapp.webmaster.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeDAOInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class InsertNoticeOkCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo) {
		HttpSession session = request.getSession();
		vo.setWid((String)session.getAttribute("wid"));
		System.out.println("글 추가 command vo = "+ vo.toString());
		
		NoticeDAOInterface dao = Constants.sqlSession.getMapper(NoticeDAOInterface.class);
		int cnt = dao.insertNotice(vo);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			System.out.println("공지사항 글 추가 성공");
			mav.setViewName("redirect:/webmaster/notices");
		}else {
			System.out.println("공지사항 글 추가 성공");
			mav.setViewName("redirect:/webmaster/tryAddNotice");
		}
		
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(int no) {
		// TODO Auto-generated method stub
		return null;
	}

}
