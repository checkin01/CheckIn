package com.checkin.webapp.webmaster.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeDAOInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class EditNoticeOkCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo) {
		System.out.println("editOK command vo = "+vo.toString());
		//DAO 작업
		NoticeDAOInterface dao = Constants.sqlSession.getMapper(NoticeDAOInterface.class);
		int cnt = dao.updateNotice(vo);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			System.out.println("공지사항 수정 성공");
			mav.setViewName("redirect:/webmaster/notices");
		}else {
			System.out.println("공지사항 수정 실패");
			mav.setViewName("redirect:/webmaster/modifyNotice");
		}
		return mav;
	}

	@Override
	public ModelAndView execute(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
