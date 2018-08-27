package com.checkin.webapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginWebmasterInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			System.out.println("WebmasterLoginInterceptor");
			HttpSession session = request.getSession();
			String wid = (String) session.getAttribute("wid");
			
			if(wid==null || "".equals(wid)) {
				System.out.println("WebmasterLoginInterceptor..wid:"+wid);
				response.sendRedirect("/webapp/webmaster");
				return false;
			}else {
				return true;
			}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		

	}

}
