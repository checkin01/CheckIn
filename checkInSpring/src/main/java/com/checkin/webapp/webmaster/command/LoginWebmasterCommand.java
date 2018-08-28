package com.checkin.webapp.webmaster.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class LoginWebmasterCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, NoticeVO vo) {
		
		return null;
	}	

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		System.out.println("LoginWebmasterCommand before DAO....."+vo.toString());
		//DAO작업
		WebmasterDAOInterface dao = Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		String wid = dao.selectWebmaster(vo);
		
		System.out.println("LoginWebmasterCommand after DAO.....wid="+wid);
		ModelAndView mav = new ModelAndView();				
		
		HttpSession session = request.getSession();
		
		if(wid==null || wid.equals("")) {//로그인 실패시
			System.out.println("로그인 실패");
			session.setAttribute("logChk", "N");
			mav.setViewName("redirect:/webmaster");
			
		
		}else {//로그인 성공시
			System.out.println("로그인 성공");
			//세션 설정			
			session.setAttribute("wid", wid);
			session.setAttribute("type", "W");
			session.setAttribute("logChk", "Y");
			//mav 설정
			mav.setViewName("redirect:/webmaster");
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
