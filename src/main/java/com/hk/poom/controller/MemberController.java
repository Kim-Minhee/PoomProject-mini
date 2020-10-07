package com.hk.poom.controller;

import java.io.File;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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

import com.hk.poom.dto.FindIdDTO;
import com.hk.poom.dto.LoginDTO;
import com.hk.poom.dto.RegisterPerDTO;
import com.hk.poom.service.MemberService;



@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext sc;
	
	@GetMapping("/poom/register/com")
	public String registerCom( ) {
		
		
		return "member/registerCom";
	}
	
	@PostMapping("/poom/register/com")
	public String registerComPost( ) {
		
		
		return "member/registerComPost";
	}
	
	
	
	@GetMapping("/poom/register/per")
	public String registerPer( ) {
		logger.info("MemberController_Get_/poom/register/per 실행");
		
		return "member/registerPer";
	}
	
	
	@GetMapping("/poom/register/new")
	public String registerNew( ) {
		logger.info("MemberController_Get_/poom/register/new 실행");
		
		return "member/registerNew";
	}
	
	@PostMapping("/poom/register/new")
	public String registerNewPost( Model model, RegisterPerDTO registerPerDTO, @RequestParam("prof") MultipartFile multipartFile, @RequestParam("name") String name ) {
		logger.info("MemberController_Post_/poom/register/new 실행");
		logger.info("신규 개인 회원 입력 정보 = " + registerPerDTO.toString());
		logger.info("프로필  파일 이름 = " + multipartFile.getOriginalFilename());
		
		// 회원 정보 저장
		memberService.memberRegisterPer(registerPerDTO);
		model.addAttribute("name", name);
		
		// 프로필 사진 저장
		// sc.getRealPath : browser deployment location에서 project명까지의 경로
		File prof = new File(sc.getRealPath("/resources/fileupload/") + multipartFile.getOriginalFilename());
		logger.info("파일의 실제 저장 위치(실행 디렉토리) = " + prof);
		
		try {
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, prof);
		} catch (Exception e) {
			FileUtils.deleteQuietly(prof);
			e.printStackTrace();
		}
				
		// jsp에서 해당 이미지를 출력할 수 있게.. /resources로 시작하는 경로를 model에 저장해놓기
		model.addAttribute("imgSrc", "/resources/fileupload/" + multipartFile.getOriginalFilename());
		
		return "member/registerNewPost";
	}
	
	
	@GetMapping("/poom/login")
	public String login( ) {
		logger.info("MemberController_Get_/poom/login 실행");
		
		return "member/login";
	}
	
	@PostMapping("/poom/login")
	public String loginPost( HttpServletRequest request, HttpSession session, LoginDTO loginDTO ) {
		logger.info("MemberController_Post_/poom/login 실행");
		logger.info("로그인할 member = " + loginDTO.toString());
		
		LoginDTO loginMember = memberService.memberLogin( loginDTO );
		if ( loginMember!= null ) {
			logger.info("로그인 성공");
			
			session.setAttribute("loginMember", loginMember);
			
			//로그인 성공시 홈으로
			return "home";
		} else {
			logger.info("로그인 실패");
			
			//로그인 실패시
			return "member/loginFail";
		}
		
	}
	
	@GetMapping("/poom/logout")
	public String logout( HttpSession session ) {
		logger.info("MemberController_Get_/poom/logout 실행");
		
		session.invalidate();
		
		return "member/logout";
	}
	
	
	@GetMapping("/poom/find/id")
	public String findId( ) {
		
		
		return "member/findId";
	}
	
	
	@PostMapping("/poom/find/id")
	public String findIdPost( Model model, FindIdDTO findIdDTO ) {
		
		model.addAttribute("findIdDTO", memberService.memberFindId(findIdDTO));
		return "member/findIdPost";
	}
	
	@GetMapping("/poom/find/pwd")
	public String findPwd( ) {
		
		
		return "member/findPwd";
	}
	

}
