package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberDAOInterface;


public class UidCheckCommand {

	public int execute(HttpServletRequest request, @RequestParam("uuid") String uuid){
		int result = 0;
		if(Constants.sqlSession != null) {
			MemberDAOInterface dao = Constants.sqlSession.getMapper(MemberDAOInterface.class);
			result = dao.uidCheck(uuid);			
		}else {
			System.out.println("sqlSession null...");
		}				
		return result;
		
	}
}
