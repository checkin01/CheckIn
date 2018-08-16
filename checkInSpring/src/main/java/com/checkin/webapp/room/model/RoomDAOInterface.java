package com.checkin.webapp.room.model;

import java.util.List;

public interface RoomDAOInterface {
	
	//특정 숙박업소의 룸 전체 리스트
	public List<RoomVO> selectAllRoomList(RoomVO vo);
	
	public RoomVO selectOneRoom(RoomVO vo);
	
	public int insertRoom(RoomVO vo);
	
	public int updateRoom(RoomVO vo);
	
	public int deleteRoom(RoomVO vo);
	
	public List<Integer> getAvgGradeAllRoom(RoomVO vo); 
	
	public int getAvgGradeOneRoom(RoomVO vo);
	
	public List<Boolean> getAvailBooking(RoomVO vo);
}
