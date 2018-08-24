package com.checkin.webapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	public SqlSession mySqlsession;
	
	@Autowired
	public void setSqlSession() {
		Constants.sqlSession = mySqlsession;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
	
		return "main/index";
	}
	
	@RequestMapping(value = "/webmaster", method = RequestMethod.GET)
	public String webmasterMain(Locale locale, Model model) {
		
		return "webmaster/main";
	}
	
	@RequestMapping(value="/master/first", method = RequestMethod.GET)
	public String masterMain(HttpServletRequest request) {
		if((String)request.getSession().getAttribute("mid")==null) return "main/login/login";
		return "master/first";
	}
	
	@RequestMapping(value="/error", method = RequestMethod.GET)
	public String error(HttpServletRequest request) {
		return "error";
	}
}
