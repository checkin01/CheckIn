package com.checkin.webapp.master.model;

import java.util.ArrayList;
import java.util.List;

public interface MasterDAOInterface {
	
	public MasterVO selectMaster(MasterVO vo);
	
	public MasterChartVO selectMasterChart(MasterChartVO vo);//예약차트...
	
	public MasterChartVO selectMasterChart2(MasterChartVO vo);//리뷰차트...
	
	public MasterChartVO selectMasterChart3(MasterChartVO vo);//룸차트...
	
	public ArrayList<MasterChartVO> selectBookingDate(MasterChartVO vo);
	
	public ArrayList<MasterChartVO> selectSaleBooking(MasterChartVO vo);
	
	
	public ArrayList<MasterChartVO> selectAllRoomName(MasterChartVO vo); //룸 이름 리스트
	public ArrayList<MasterChartVO> getBookingCountEachRoom(MasterChartVO vo);//매월 룸별 예약 건수리스트
	
	public int insertMaster(MasterVO vo);
	
	public int updateMaster(MasterVO vo);
	
	public int deleteMaster(MasterVO vo);
	
	public List<MasterVO> selectAllMaster(MasterVO vo);
}
