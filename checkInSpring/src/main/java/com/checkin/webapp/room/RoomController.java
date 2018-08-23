package com.checkin.webapp.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.room.command.InsertRoomFormCommand;
import com.checkin.webapp.room.command.InsertRoomOkCommand;
import com.checkin.webapp.room.command.ShowMasterRoomListCommand;
import com.checkin.webapp.room.command.UpdateRoomFormCommand;
import com.checkin.webapp.room.command.UpdateRoomOkCommand;
import com.checkin.webapp.room.model.RoomVO;

@Controller
public class RoomController {
	/*
	//일반사용자가 보는 룸리스트로 이동
	// 매핑 주소 : /main/showGuestroomList
	public ModelAndView showAllRoomList(HttpServletRequest request, RoomVO vo) {}
	*/
	
	//가맹점이 보는 룸리스트
	// 매핑 주소 : /master/showMyGuestroomList
	@RequestMapping("/master/showMyGuestroomList")
	public ModelAndView showMasterRoomList(HttpServletRequest request) {
		
		ShowMasterRoomListCommand command = new ShowMasterRoomListCommand();
		return command.execute(request);
	}
	
	
	//룸 정보 수정페이지로 이동(가맹점)
	// 매핑 주소 : /master/modifyGuestroomInfo
	@RequestMapping("/master/modifyGuestroomInfo")
	public ModelAndView updateRoomForm(@RequestParam("r") int r) {		
		
		UpdateRoomFormCommand command = new UpdateRoomFormCommand();
		return command.execute(r);
	}
	
		
	//룸 정보 수정OK(가맹점)
	// 매핑 주소 : /master/tryModifyGuestroomInfo
	@RequestMapping(value="/master/tryModifyGuestroomInfo" ,method=RequestMethod.POST)
	public ModelAndView updateRoomOk(
			HttpServletRequest req,RoomVO vo,
			@RequestParam("filename1") MultipartFile rimg1,
			@RequestParam("filename2") MultipartFile rimg2,
			@RequestParam("filename3") MultipartFile rimg3
			) {
		System.out.println("RoomController...updateRoomOk()"+vo.toString());
		UpdateRoomOkCommand command = new UpdateRoomOkCommand();
		return command.execute(req, vo, rimg1, rimg2, rimg3);
	
	
	}
	//룸 추가 폼으로 이동
	// 매핑 주소 : /master/addGuestroomInfo
	@RequestMapping("/master/addGuestroomInfo")
	public ModelAndView insertRoomForm(HttpServletRequest request) {
		InsertRoomFormCommand command = new InsertRoomFormCommand();
		return command.execute(request);
	}
	
	//룸 추가OK
	// 매핑 주소 : /master/tryAddGuestroomInfo
	@RequestMapping("/master/tryAddGuestroomInfo")
	public ModelAndView insertRoomOk(HttpServletRequest request, RoomVO vo,
			@RequestParam("filename1") MultipartFile rimg1,
			@RequestParam("filename2") MultipartFile rimg2,
			@RequestParam("filename3") MultipartFile rimg3) {
		
		System.out.println("RoomController...insertRoomOk()"+vo.toString());
		InsertRoomOkCommand command = new InsertRoomOkCommand();
		return command.execute(request, vo, rimg1, rimg2, rimg3);
	}	
	
	
	
	/*//룸 삭제(가맹점)
	// 매핑 주소 : /master/deleteGuestroomInfo
	public ModelAndView deleteRoom(@RequestParam("r") int r) {
		DeleteRoomCommand command = new DeleteRoomCommand();
		return command.execute(r);
	}*/
		
}
