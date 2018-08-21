package com.checkin.webapp.room.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.booking.model.CheckBookingVO;
import com.checkin.webapp.room.model.RoomDAOInterface;
import com.checkin.webapp.room.model.RoomVO;

public class ShowRoomListCommand implements RoomCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String aStr = request.getParameter("a");
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy/MM/dd", Locale.KOREA );
		Date currentTime = new Date ();
		String today = mSimpleDateFormat.format ( currentTime ).toString();
		int a = 0;
		if(aStr != null && aStr != "") a = Integer.parseInt(aStr);
		String checkinout = request.getParameter("checkinout");
		
		//checkinout이 null 일 경우
		if(checkinout==null) {
			checkinout = today + "-"+ today;
			
		}
		String checkin = checkinout.split("-")[0].trim();
		String checkout = checkinout.split("-")[1].trim();
		
		System.out.println("ShowRoomListCommand.. a = "+ a + ", checkinout = "+ checkinout + ", checkin = "+ checkin + ", checkout = "+ checkout);
		
		//===================== dao 작업 ========================//
		RoomVO vo = new RoomVO();
		vo.setA(a);
		RoomDAOInterface dao = Constants.sqlSession.getMapper(RoomDAOInterface.class);
		List<RoomVO> list = dao.selectAllRoomList(vo);
		System.out.println("ShowRoomListCommand.."+list.size());
		System.out.println("ShowRoomListCommand.."+list.toString());
		
		mav.addObject("list", list);
		
		//=============== accomdotion 정보 가져오기 =================//
		AccomodationVO accoVo = new AccomodationVO();
		accoVo.setA(a);
		AccomodationDAOInterface dao2 = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		AccomodationVO accoResult = dao2.selectOneRecord(accoVo);
		System.out.println("ShowRoomListCommand.."+accoResult.toString());
		
		mav.addObject("accoVO",accoResult);
		
		//================= booking 정보 처리 =========================//
		CheckBookingVO bookingVo = new CheckBookingVO();
		bookingVo.setA(a);
		bookingVo.setCheckin(checkin);
		bookingVo.setCheckout(checkout);
		BookingDAOInterface dao3 = Constants.sqlSession.getMapper(BookingDAOInterface.class);
		List<Integer> bookingAvailList = dao3.getRoomsBookingAvailability(bookingVo);
		
					//예약 가능 결과를 담음.
		mav.addObject("bookingVO",bookingAvailList);
		System.out.println("ShowRoomListCommand.."+bookingAvailList.size());
		//===================== dao 작업 ========================//
		
		
		//==================== Session 처리 ========================//
		HttpSession session = request.getSession();
		
		System.out.println("형식 변환..."+checkin.replaceAll("/", "-"));
		session.setAttribute("checkin", checkin.replaceAll("/", "-"));
		session.setAttribute("checkout", checkout.replaceAll("/", "-"));
		session.setAttribute("today", today.replaceAll("/", "-"));
		
		
		//=========================================================//
		
		
		mav.setViewName("main/accomodation/showDetailAccomodation");
		return mav;
	}

}
