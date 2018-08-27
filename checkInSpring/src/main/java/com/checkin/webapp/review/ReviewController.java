package com.checkin.webapp.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.review.command.EditReviewCommand;
import com.checkin.webapp.review.command.InsertReviewCommand;
import com.checkin.webapp.review.command.SelectListCommand;
import com.checkin.webapp.review.command.SelectReviewAjaxCommand;
import com.checkin.webapp.review.command.SelectReviewListAjaxCommand;
import com.checkin.webapp.review.command.SelectReviewsCntAjaxCommand;
import com.checkin.webapp.review.model.ReviewVO;

@Controller
public class ReviewController {
	/*
	 * //리뷰쓰기 폼으로 이동 // 매핑 주소 : /main/writeReview public ModelAndView
	 * writeReviewForm(HttpServletRequest request) {}
	 * 
	 * //리뷰쓰기 성공/실패 // 매핑 주소 : /main/tryWriteReview public ModelAndView
	 * writeReviewOk(HttpServletRequest request, ReviewVO vo) {}
	 * 
	 * // 매핑 주소 : /main/modifyReview public ModelAndView
	 * editReviewForm(HttpServletRequest request) {}
	 * 
	 * // 매핑 주소 : /main/tryModifyReview public ModelAndView
	 * editReviewOk(HttpServletRequest request, ReviewVO vo) {}
	 * 
	 * // 매핑 주소 : /main/tryDeleteReview public ModelAndView
	 * deleteReview(HttpServletRequest request, ReviewVO vo) {}
	 * 
	 * //내가 작성한 리뷰 보기 // 매핑 주소 : /main/showMyReviewList public List<ReviewVO>
	 * showMemberReviewList(HttpServletRequest request){}
	 * 
	 * //가맹 업자 숙소 리뷰 리스트 보기 // 매핑 주소 : /master/showAccoReviewList public
	 * List<ReviewVO> showMasterReviewList(HttpServletRequest request){}
	 * 
	 * //master 숙소 리뷰 상세 보기 보기 // 리뷰 보기 시 모달 창으로 보여짐, 페이지 이동은 없고 데이터만 ajax로 처리 해줌.
	 * // 매핑 주소 : /master/viewReview public ReviewVO
	 * selectReviewAjaxMaster(HttpServletRequest request){}
	 * 
	 */

	// 일반회원 리뷰 리스트
	// 매핑 주소 : /master/showAccoReviewList
	@RequestMapping("/main/showAccoReviewList")
	public ModelAndView showMemberReviewList(HttpServletRequest request, ReviewVO vo) {

		return new SelectListCommand().execute(request, vo);
	}

	@RequestMapping("/main/getReivews")
	@ResponseBody
	public List<ReviewVO> selectReviewListAjax(HttpServletRequest request, ReviewVO vo) {
		return new SelectReviewListAjaxCommand().executeAjax(request, vo);
	}

	@RequestMapping("/main/getReivewsCnt")
	@ResponseBody
	public int selectReviewCntAjax(HttpServletRequest request, @RequestParam("r") int r) {
		return new SelectReviewsCntAjaxCommand().executeAjax(request, r);
	}
	
	@RequestMapping(value="/main/mypage/tryWriteReview",method=RequestMethod.POST)
	public ModelAndView writeReview(HttpServletRequest request,ReviewVO vo , MultipartFile file1) {
		return new InsertReviewCommand().execute(request,vo,file1);
	}
	
	@RequestMapping("/main/mypage/getReview")
	@ResponseBody
	public ReviewVO selectReviewAjax(HttpServletRequest request, ReviewVO vo){
		return new SelectReviewAjaxCommand().executeAjax(request,vo);
	}
	
	
	@RequestMapping(value="/main/mypage/tryEditReview",method=RequestMethod.POST)
	public ModelAndView editReview(HttpServletRequest request, ReviewVO vo, MultipartFile file1) {
		System.out.println("ReviewController... editReview.. "+vo.toString());
		return new EditReviewCommand().execute(request,vo,file1);
	}
	
}
