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
		ProfUploadDTO uploadeddFile = new ProfUploadDTO(); 
		if ( type==1 ) {	// 개인 회원
			myInfo = pageService.mypagePer(mno);
			uploadeddFile = pageService.memberFile(mno);
		} else if ( type==2 ) {	// 업체 회원
			myInfo = pageService.mypageCom(mno);
			uploadeddFile = pageService.comFile(mno);
		}
		
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("uploadeddFile", uploadeddFile);
		model.addAttribute("type_m", type);
		
		// 아직 미구현
//		// 입양 리스트 출력
//		AdminPayDTO buyInfo = new AdminPayDTO();
//		buyInfo.setId_buyer(myInfo.getId());
//		model.addAttribute("buyList", pageService.mypageBuyList(buyInfo));
//		// 분양 리스트 출력
//		AdminPayDTO saleInfo = new AdminPayDTO();
//		saleInfo.setId_saler(myInfo.getId());
//		model.addAttribute("saleList", pageService.mypageSaleList(saleInfo));
//		// 쓴글 리스트 출력
//		CommunityListDTO writeInfo = new CommunityListDTO();
//		writeInfo.setId_writer(myInfo.getId());
//		model.addAttribute("writeList", pageService.mypageWriteList(writeInfo));
		
		return "page/mypage";
	}
	
	
	@PostMapping("/poom/mypage")
	public String mypagePost( HttpSession session, Model model, MypageDTO mypageDTO, ProfUploadDTO profUploadDTO, @RequestParam("prof") MultipartFile prof, @RequestParam("brn_img") MultipartFile brn_img) {	//, @RequestParam("prof") MultipartFile prof
		logger.info("PageController_Post_/poom/mypage 실행");
		logger.info("수정할 회원 정보 = " + mypageDTO.toString());
		
		// 입력받은 회원 정보 수정 (공통)
		pageService.mypageUpdate(mypageDTO);
		if ( mypageDTO.getType_m()==1 ) {	// 개인 회원
			pageService.mypageUpdatePer(mypageDTO);
		} else if ( mypageDTO.getType_m()==2 ){	// 업체 회원
			pageService.mypageUpdateCom(mypageDTO);
		}
		
		String nowTime = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
		//profUploadDTO.setMno(mypageDTO.getMno());
		
		// 업로드한 프로필 파일 저장
		if ( prof.isEmpty() ) {
		} else {
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
			
			profUploadDTO.setDbSaveName("/resources/prof/"+dbSaveName);
			memberService.profUpload(profUploadDTO);
		}
		// 업로드한 사업자 등록 파일 저장
		if ( brn_img.isEmpty() ) {
		} else {
			String realPath1 =sc.getRealPath("/resources/brn_img/");
			//logger.info("확장자는`````````````````"+brn_img.getOriginalFilename().substring(brn_img.getOriginalFilename().lastIndexOf(".")));
			String brnName = nowTime + brn_img.getOriginalFilename().substring(brn_img.getOriginalFilename().lastIndexOf("."));
			File oldBrnFile = new File(realPath1 + brn_img.getOriginalFilename());
			File newBrnFile = new File(realPath1 + brnName);
			oldBrnFile.renameTo(newBrnFile);
			try {
				InputStream fileStream1 = brn_img.getInputStream();
			    FileUtils.copyInputStreamToFile(fileStream1, newBrnFile);
			}catch (Exception e) {
				FileUtils.deleteQuietly(newBrnFile);
			    e.printStackTrace();
			}
			
			profUploadDTO.setBrnName("/resources/brn_img/"+brnName);
			memberService.brnUpload(profUploadDTO);
		}
		
		// 로그인 정보 수정
		LoginDTO loginMember = new LoginDTO();
		loginMember.setType_m(mypageDTO.getType_m());
		loginMember.setMno(mypageDTO.getMno());
		loginMember.setPwd(mypageDTO.getPwd());
		loginMember.setEmail(mypageDTO.getEmail());
		loginMember.setName(mypageDTO.getName());
		loginMember.setDbSaveName(profUploadDTO.getDbSaveName());
		
		session.setAttribute("loginMember", loginMember);

		
		return "page/mypagePost";
	}
	
	@GetMapping("/poom/otherpage")
	public String otherpage( ) {
		
		return "page/otherpage";
	}
	
	// 접근 제한
	@GetMapping("/poom/noauth")
	public String noAuth( ) {
		logger.info("PageController_Get_/poom/noAuth 실행");
		
		return "page/noAuth";
	}
	
	// admin 회원 상세정보 보기
	@GetMapping("/poom/eachpage")
	public String eachpage( Model model, @RequestParam("mno") int mno, @RequestParam("mtp") int type_m ) {
		
		logger.info("type_m-----------------은?"+type_m);
		MypageDTO myInfo = new MypageDTO();
		ProfUploadDTO uploadeddFile = new ProfUploadDTO(); 
		if ( type_m==1 ) {	// 개인 회원
			myInfo = pageService.mypagePer(mno);
			uploadeddFile = pageService.memberFile(mno);
		} else if ( type_m==2 ) {	// 업체 회원
			myInfo = pageService.mypageCom(mno);
			uploadeddFile = pageService.comFile(mno);
		}
		
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("uploadeddFile", uploadeddFile);
		model.addAttribute("type_m", type_m);
		
		return "page/mypage";
	}

}
