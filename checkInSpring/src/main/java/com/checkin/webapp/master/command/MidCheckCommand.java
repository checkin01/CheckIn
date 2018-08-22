package com.checkin.webapp.master.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;

import com.checkin.webapp.Constants;
import com.checkin.webapp.master.model.MasterDAOInterface;

public class MidCheckCommand{

	public int execute(HttpServletRequest request, @RequestParam("mid") String mid){
		int result = 0;
		if(Constants.sqlSession != null) {
			MasterDAOInterface dao = Constants.sqlSession.getMapper(MasterDAOInterface.class);
			result = dao.midCheck(mid);			
		}else {
			System.out.println("sqlSession null...");
		}				
		return result;
		
	}

}
