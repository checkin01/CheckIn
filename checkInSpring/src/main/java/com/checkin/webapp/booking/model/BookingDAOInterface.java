package com.checkin.webapp.booking.model;

import java.util.List;

public interface BookingDAOInterface {
	
	public int insertBooking(BookingVO vo);
	
	public int cancelBooking(BookingVO vo);
	
	public List<BookingVO> selectAllBookingList(BookingVO vo);
}
