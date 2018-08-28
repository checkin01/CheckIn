package com.checkin.webapp.review.model;

import java.util.List;

public interface ReviewDAOInterface {
	//숙박업자 리뷰리스트 모아보기
	public List<ReviewVO> selectAllAccoReview(ReviewVO vo);
	//숙박업자 리뷰 상세보기
	public ReviewVO selectDetail(String uuid,String v);
	
	public List<ReviewVO> selectAllReviewList(ReviewVO vo);
	
	public ReviewVO selectOneReview(ReviewVO vo);
	
	public int updateReview(ReviewVO vo);
	
	public int deleteReview(ReviewVO vo);
	
	public int insertReview(ReviewVO vo);
	
	public int getReviewListCnt(ReviewVO vo);
	
	public int updateVRecordBooking(ReviewVO vo);
	
}
