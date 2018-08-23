package com.checkin.webapp.room.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.room.model.RoomDAOInterface;
import com.checkin.webapp.room.model.RoomVO;

public class UpdateRoomFormCommand implements RoomCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, RoomVO vo) {
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		return null;
	}

	@Override
	public RoomVO executeVo(HttpServletRequest request, RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView execute(int r) {

		RoomDAOInterface dao = Constants.sqlSession.getMapper(RoomDAOInterface.class);
		RoomVO vo2 = dao.selectOneRoom(r);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo2);
		mav.setViewName("master/room/editRoom");
		return mav;
	}
}
