package com.checkin.webapp.accomodation.model;

import java.util.List;

public interface AccomodationDAOInterface {
	public List<AccomodationVO> selectAllList(AccomodationVO vo);
	
	public AccomodationVO selectOneRecord(AccomodationVO vo);
	
	public int updateAccomodation(AccomodationVO vo);
	
	public int deleteAccomodation(AccomodationVO vo);
	
	public int insertAccomodation(AccomodationVO vo);
	
	public int getAvgGrade(AccomodationVO vo);
	
	public List<AccomodationVO> getHistory(int a1, int a2, int a3);
	
	public List<AccomodationVO> get3TopGradeAccomodation(AccomodationVO vo);
}
