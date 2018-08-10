package com.checkin.webapp.master.model;

import java.util.List;

public interface MasterDAOInterface {
	
	public MasterVO selectMaster(MasterVO vo);
	
	public int insertMaster(MasterVO vo);
	
	public int updateMaster(MasterVO vo);
	
	public int deleteMaster(MasterVO vo);
	
	public List<MasterVO> selectAllMaster(MasterVO vo);
}
