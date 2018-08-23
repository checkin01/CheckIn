package com.checkin.webapp.room.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.room.model.RoomDAOInterface;
import com.checkin.webapp.room.model.RoomVO;

public class ShowMasterRoomListCommand implements RoomCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		RoomDAOInterface dao = Constants.sqlSession.getMapper(RoomDAOInterface.class);
		RoomVO vo = new RoomVO();
		vo.setMid(mid);
		List<RoomVO> list = dao.selectAllRoomList(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("master/room/manageDetailRoom");
		return mav;
	}

	@Override
	public RoomVO executeVo(HttpServletRequest request, RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
