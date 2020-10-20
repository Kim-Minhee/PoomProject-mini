package com.hk.poom.controller;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.poom.dto.LoginDTO;
import com.hk.poom.dto.MypageDTO;
import com.hk.poom.dto.ProfUploadDTO;
import com.hk.poom.dto.RegisterComDTO;
import com.hk.poom.dto.RegisterPerDTO;
import com.hk.poom.service.PageService;
import com.hk.poom.service.MemberService;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	PageService pageService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext sc;
	
	@GetMapping("/poom/mypage")
	public String mypage( Model model, HttpSession session, @RequestParam("mno") int mno ) {
		LoginDTO loginMember = (LoginDTO) session.getAttribute("loginMember");
		int type = loginMember.getType_m();
		
		MypageDTO myInfo = new MypageDTO();
		if ( type==1 ) {	// 개인 회원
			myInfo = pageService.mypagePer(mno);
		} else if ( type==2 ) {	// 업체 회원
			myInfo = pageService.mypageCom(mno);
		}
		
		ProfUploadDTO myProf = pageService.myProf(mno);
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("myProf", myProf.getDbSaveName());
		
		return "page/mypage";
	}
	
	
	@PostMapping("/poom/mypage")
	public String mypagePost( Model model, MypageDTO mypageDTO, ProfUploadDTO profUploadDTO, @RequestParam("prof") MultipartFile prof ) {	//, @RequestParam("prof") MultipartFile prof
		logger.info("PageController_Post_/poom/mypage 실행");
		logger.info("수정할 회원 정보 = " + mypageDTO.toString());
		
		// 입력받은 회원 정보 수정 (공통)
		pageService.mypageUpdate(mypageDTO);
		if ( mypageDTO.getType_m()==1 ) {	// 개인 회원
			pageService.mypageUpdatePer(mypageDTO);
		} else if ( mypageDTO.getType_m()==2 ){	// 업체 회원
			pageService.mypageUpdateCom(mypageDTO);
		}
		
		
		// 업로드한 프로필 파일 저장
		if ( prof.isEmpty() ) {
		} else {
			String nowTime = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			String realPath = sc.getRealPath("/resources/prof/");
			String dbSaveName = "";
			dbSaveName = nowTime + prof.getOriginalFilename().substring(prof.getOriginalFilename().lastIndexOf("."));
		 	File oldProfFile = new File(realPath + prof.getOriginalFilename());
		    File newProfFile = new File(realPath + dbSaveName);
		    oldProfFile.renameTo(newProfFile);
			try {
				// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
				InputStream fileStream = prof.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, newProfFile);
			} catch (Exception e) {
				FileUtils.deleteQuietly(newProfFile);
				e.printStackTrace();
			}
			profUploadDTO.setMno(mypageDTO.getMno());
			profUploadDTO.setDbSaveName("/resources/prof/"+dbSaveName);
			memberService.profUpload(profUploadDTO);
		}
		return "page/mypagePost";
	}
	
	@GetMapping("/poom/otherpage")
	public String otherpage( ) {
		
		return "page/otherpage";
	}

}
