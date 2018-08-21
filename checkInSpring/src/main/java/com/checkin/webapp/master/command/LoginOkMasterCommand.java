package com.checkin.webapp.master.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.master.model.MasterDAOInterface;
import com.checkin.webapp.master.model.MasterVO;

public class LoginOkMasterCommand implements MasterCommandInterface{

	@Override
	public ModelAndView execute(HttpServletRequest request, MasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MasterVO executeVo(HttpServletRequest request, MasterVO vo) {
		MasterDAOInterface dao = Constants.sqlSession.getMapper(MasterDAOInterface.class);
		MasterVO vo2 = dao.selectMaster(vo);
		
		
		
		if(vo2!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("mname", vo2.getMname());
			session.setAttribute("mid", vo2.getMid());
			session.setAttribute("aname", vo2.getAname());
			session.setAttribute("type", "M");
			session.setAttribute("logChk", "Y");
		}else {
			System.out.println("vo2 is null....");
		}
		return vo2;
	}

}
