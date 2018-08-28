package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeDAOInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class GetMemberNoticeCommand implements WebmasterCommandInterface {

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
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(int no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<NoticeVO> executeAjax(HttpServletRequest request, NoticeVO vo) {
		System.out.println("GetMemberNoticeCommand... executeAjax()...");
		NoticeDAOInterface dao =Constants.sqlSession.getMapper(NoticeDAOInterface.class);
		List<NoticeVO> list = dao.getMemberNoticeList(vo);
		System.out.println("GetMemberNoticeCommand... list : "+list.toString());
		return list;
	}

}
