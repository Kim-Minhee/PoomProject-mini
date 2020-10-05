package com.hk.poom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommunityController {
	
	@GetMapping("/poom/comunity/list")
	public String comunityList( ) {
		
		return "comunity/comunityList";
	}
	
	@GetMapping("/poom/comunity/read")
	public String comunityRead( ) {
		
		
		return "comunity/comunityRead";
	}
	
	
	@PostMapping("/poom/comunity/read")
	public String comunityReadPost( ) {
		
		
		return "comunity/comunityReadPost";
	}
	
	@GetMapping("/poom/comunity/add")
	public String comunityAdd( ) {
		
		
		return "comunity/comunityAdd";
	}
	
	
	@PostMapping("/poom/comunity/add")
	public String comunityAddPost( ) {
		
		
		return "comunity/comunityAddPost";
	}
	
	@GetMapping("/poom/comunity/update")
	public String comunityUpdate( ) {
		
		
		return "comunity/comunityUpdate";
	}
	
	
	@PostMapping("/poom/comunity/update")
	public String comunityUpdatePost( ) {
		
		
		return "comunity/comunityUpdatePost";
	}
	
	@GetMapping("/poom/comunity/delete")
	public String comunityDelete( ) {
		
		
		return "comunity/comunityDelete";
	}
	
	
	@PostMapping("/poom/comunity/delete")
	public String comunityDeletePost( ) {
		
		
		return "comunity/comunityList";
	}
	
	
	

}
