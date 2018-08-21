package com.checkin.webapp.booking.model;

import java.util.List;

public interface BookingDAOInterface {
	
	public int insertBooking(BookingVO vo);
	
	public int cancelBooking(BookingVO vo);
	
	public List<BookingVO> selectAllBookingList(BookingVO vo);
	
	//해당 룸이 예약이 가능한지 아닌지를 체크
	public List<Integer> getRoomsBookingAvailability(CheckBookingVO vo);
	
	public int checkAvailBooking(CheckBookingVO vo);

}
