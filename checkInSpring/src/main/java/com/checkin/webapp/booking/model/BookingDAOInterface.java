package com.checkin.webapp.booking.model;

import java.util.List;

public interface BookingDAOInterface {
	
	public int insertBooking(BookingVO vo);
	
	public int cancelBooking(BookingVO vo);
	
	//해당 룸이 예약이 가능한지 아닌지를 체크
	public List<BookingVO> getRoomsBookingAvailability(CheckBookingVO vo);
	
	public int checkAvailBooking(CheckBookingVO vo);
	
	//일반회원 예약리스트 확인
	public List<BookingVO> selectAllBookingList(int u);
	
	//master 예약 현황 내역
	public List<BookingVO> selectAllBookingListMaster(BookingVO vo);
	
	public int getBookingListCnt(BookingVO vo);
}
