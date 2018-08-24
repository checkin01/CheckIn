package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeDAOInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class ShowAllNoticeListCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		//Session에 있는 wid를 noticeVO wid에 입력
		NoticeVO vo2 = new NoticeVO();		
		vo2.setWid(vo.getWid());
		//DAO 작업
		NoticeDAOInterface dao = Constants.sqlSession.getMapper(NoticeDAOInterface.class);
		List<NoticeVO> list = dao.selectAllNoticeList(vo2);
		
		//mav 작업
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("webmaster/notice/showNoticeList");
		return mav;
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
		// TODO Auto-generated method stub
		return null;
	}

}
