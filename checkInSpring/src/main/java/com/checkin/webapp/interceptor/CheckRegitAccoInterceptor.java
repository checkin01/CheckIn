package com.checkin.webapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;

public class CheckRegitAccoInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(wasRegitAcco(request)) {
			return true;
		}else {
			response.sendRedirect("/webapp/master/first");
			return false;
		}
	}
	

	public boolean wasRegitAcco(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		AccomodationDAOInterface dao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		AccomodationVO vo = new AccomodationVO();
		vo.setMid(mid);
		AccomodationVO resultVO = dao.selectOneRecord(vo);
		if(resultVO!=null && resultVO.getA()!= 0) {
			return true;
		}else {
			return false;
		}
	}
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
