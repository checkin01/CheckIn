package com.checkin.webapp.booking.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.booking.model.BookingVO;

public class ShowAllBookingListCommand {
	public ModelAndView execute(HttpServletRequest request, BookingVO vo) {
		
		BookingDAOInterface dao = Constants.sqlSession.getMapper(BookingDAOInterface.class);				
		
		//session에서 mid 가져오기		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		vo.setMid(mid);
		
		int bookingTotalList = dao.getBookingListCnt(vo);
		System.out.println(bookingTotalList +' ' + vo.getBonepage());
		int totalpage =  bookingTotalList/vo.getBonepage();
		if(bookingTotalList%vo.getBonepage() != 0 )totalpage++;
		vo.setTotalpage(totalpage);
		
		//mid로 bookingList 조회
		List<BookingVO> list = dao.selectAllBookingListMaster(vo);
		
		//select aname from accomodation where mid = 'master6';
		AccomodationDAOInterface accoDAO = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		String aname = accoDAO.getAname(mid);
		
		//mav 생성
		ModelAndView mav =new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("aname",aname);
		mav.addObject("curpage", vo.getBcurpage());
		mav.addObject("onepage", vo.getBonepage());
		mav.addObject("totalpage", totalpage);

		
		mav.setViewName("/master/booking/manageBookingInfo");
		return mav;
	}
}
