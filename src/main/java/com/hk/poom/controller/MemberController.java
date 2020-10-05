package com.hk.poom.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hk.poom.dto.FindIdDTO;
import com.hk.poom.service.MemberService;




@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
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
		
		
		return "member/registerPer";
	}
	
	
	@GetMapping("/poom/register/new")
	public String registerNew( ) {
		
		
		return "member/registerNew";
	}
	
	@PostMapping("/poom/register/new")
	public String registerNewPost( ) {
		
		
		return "member/registerNewPost";
	}
	
	@GetMapping("/poom/login")
	public String login( ) {
		
		
		return "member/login";
	}
	
	@PostMapping("/poom/login")
	public String loginPost( ) {
		
		//로그인 성공시 홈으로
		
		//로그인 실패시
		return "member/loginFail";
	}
	
	@GetMapping("/poom/logout")
	public String logout( ) {
		
		
		return "member/logout";
	}
	
	@GetMapping("/poom/find/id")
	public String findId( ) {
		
		
		return "member/findId";
	}
	
	
	@PostMapping("/poom/find/id")
	public String findIdPost( Model model, FindIdDTO findIdDTO) {
		
		model.addAttribute("findIdDTO", memberService.memberFindId(findIdDTO));
		return "member/findIdPost";
	}
	
	@GetMapping("/poom/find/pwd")
	public String findPwd( ) {
		
		
		return "member/findPwd";
	}
	

}
