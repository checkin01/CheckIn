package com.checkin.webapp.accomodation.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;

public class EditAccoCommand implements AccomodationCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo, MultipartFile file1, MultipartFile file2,
			MultipartFile file3) {
		ModelAndView mav = new ModelAndView();

		String newFileName = inputFile(request, file1);
		if(newFileName!=null)
			vo.setAimg1("/webapp/img/"+newFileName);
		
		newFileName = inputFile(request, file2);
		if(newFileName!=null)
			vo.setAimg2("/webapp/img/"+newFileName);
		
		newFileName = inputFile(request, file3);
		if(newFileName!=null)
			vo.setAimg3("/webapp/img/"+newFileName);
		
		/* dao 작얻 */
		System.out.println("EditAccoCommand..before executing dao" + vo.toString());
		System.out.println("EditAccoCommand.. dao.. execute...");
		AccomodationDAOInterface dao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		int result = dao.updateAccomodation(vo);
		System.out.println("EditAccoCommand.." + vo.toString());

		if (result > 0) {
			mav.setViewName("redirect:/master/viewAcco");
		} else {
			// 실패

			mav.setViewName("redirect:/master/editAcco");
		}

		return mav;
	}
	
	public String getFileNewName(String folder,String orgFileName ) {
		String newFileName = orgFileName;
		File fCheck = new File(folder, orgFileName);
		int cnt = 1; // 파일명에 붙일 번호

		while (fCheck.exists()) {// 파일이 존재하는 지 확인 : 있으면 true, 없으면 false
			int idx = orgFileName.lastIndexOf(".");// 마지막 .의 위치를 구하여 파일명과 확장자를 구한다.
			// 파일명
			String firstFile = orgFileName.substring(0, idx);
			// 확장자
			String lastFile = orgFileName.substring(idx + 1);
			fCheck = new File(folder, firstFile + cnt + "." + lastFile);
			if (!fCheck.exists()) {
				newFileName = fCheck.getName();
				break;
			}
		cnt++;
		}
		return newFileName;
	}

	public String inputFile(HttpServletRequest req, MultipartFile file) {
		String folder = req.getSession().getServletContext().getRealPath("/img");
		System.out.println("folder=" + folder);
		String newFileName = null;
		// String argName2 = file2.getName();
		// String argName3 = file3.getName();

		try {
			if (file != null) {
				//String argName1 = file1.getName(); // path를 포함한 이름 구한다.
				String orgFilename = file.getOriginalFilename();
				if (!orgFilename.isEmpty()) {
					// 파일명이 존재하면
					// 파일이 업로드 될 폴데에 존재하는지 확인
					newFileName = getFileNewName(folder,orgFilename);
					file.transferTo(new File(folder,newFileName));
					}
			} else {
				System.out.println("EditAccoCommand.. file null...");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return newFileName;
	}

}
