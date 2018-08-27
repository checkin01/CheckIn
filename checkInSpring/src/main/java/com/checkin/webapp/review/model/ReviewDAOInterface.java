package com.checkin.webapp.review.model;

import java.util.List;

public interface ReviewDAOInterface {
	
	public List<ReviewVO> selectAllReviewList(ReviewVO vo);
	
	public ReviewVO selectOneReview(ReviewVO vo);
	
	public int updateReview(ReviewVO vo);
	
	public int deleteReview(ReviewVO vo);
	
	public int insertReview(ReviewVO vo);
	
	public int getReviewListCnt(ReviewVO vo);
	
	public int updateVRecordBooking(ReviewVO vo);
	
}
