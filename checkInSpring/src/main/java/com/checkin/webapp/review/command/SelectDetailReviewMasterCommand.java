package com.checkin.webapp.review.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class SelectDetailReviewMasterCommand {
	public ReviewVO execute(HttpServletRequest request,@RequestParam("uuid") String uuid,@RequestParam("v") String v) {
		
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		System.out.println("Command..selectDetailReview..11");		
		ReviewVO vo = dao.selectDetail(uuid,v);
		System.out.println("Command..selectDetailReview..22");	
		return vo;
	}
}
