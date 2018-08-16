package com.checkin.webapp.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.review.model.ReviewVO;

@Controller
public class ReviewController {
	/*
	//리뷰쓰기 폼으로 이동
	// 매핑 주소 : /main/writeReview
	public ModelAndView writeReviewForm(HttpServletRequest request) {}
	
	//리뷰쓰기 성공/실패
	// 매핑 주소 : /main/tryWriteReview
	public ModelAndView writeReviewOk(HttpServletRequest request, ReviewVO vo) {}
	
	// 매핑 주소 : /main/modifyReview
	public ModelAndView editReviewForm(HttpServletRequest request) {}
	
	// 매핑 주소 : /main/tryModifyReview
	public ModelAndView editReviewOk(HttpServletRequest request, ReviewVO vo) {}
	
	// 매핑 주소 : /main/tryDeleteReview
	public ModelAndView deleteReview(HttpServletRequest request, ReviewVO vo) {}
	
	//내가 작성한 리뷰 보기
	// 매핑 주소 : /main/showMyReviewList
	public List<ReviewVO> showMemberReviewList(HttpServletRequest request){}
	
	//가맹 업자 숙소 리뷰 리스트 보기
	// 매핑 주소 : /master/showAccoReviewList
	public List<ReviewVO> showMasterReviewList(HttpServletRequest request){}
	
	//master 숙소 리뷰  상세 보기 보기
	// 리뷰 보기 시 모달 창으로 보여짐, 페이지 이동은 없고 데이터만 ajax로 처리 해줌.
	// 매핑 주소 : /master/viewReview
	public ReviewVO selectReviewAjaxMaster(HttpServletRequest request){}
	
	*/
}
