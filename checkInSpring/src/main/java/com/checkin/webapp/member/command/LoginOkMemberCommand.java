package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberDAOInterface;
import com.checkin.webapp.member.model.MemberVO;

public class LoginOkMemberCommand implements MemberCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		MemberDAOInterface dao = Constants.sqlSession.getMapper(MemberDAOInterface.class);
		
		MemberVO vo2 = dao.selectMember(vo);
		
		System.out.println(1+ vo.toString());
				
		if(vo2!=null) {
			System.out.println(2+vo2.toString());
			HttpSession session = request.getSession();
			session.setAttribute("u", vo2.getU());
			session.setAttribute("uname", vo2.getUname());
			session.setAttribute("uuid", vo2.getUuid());
			session.setAttribute("type", "U");
			session.setAttribute("logChk", "Y");
		}else {
			System.out.println("vo2 is null...");
		}
		
		return vo2;
	}

}
