package com.hk.poom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RehomeController {
	
	@GetMapping("/poom/rehome/list")
	public String rehomeList( ) {
		
		
		return "rehome/rehomeList";
	}
	
	@GetMapping("/poom/rehome/add")
	public String rehomeAdd( ) {
		
		
		return "rehome/rehomeAdd";
	}
	
	
	@PostMapping("/poom/rehome/add")
	public String rehomeAddPost( ) {
		
		
		return "rehome/rehomeAddPost";
	}
	
	@GetMapping("/poom/rehome/update")
	public String rehomeUpdate( ) {
		
		
		return "rehome/rehomeUpdate";
	}
	
	
	@PostMapping("/poom/rehome/update")
	public String rehomeUpdatePost( ) {
		
		
		return "rehome/rehomeUpdatePost";
	}
	
	@GetMapping("/poom/rehome/delete")
	public String rehomeDelete( ) {
		
		
		return "rehome/rehomeDelete";
	}
	
	
	@PostMapping("/poom/rehome/delete")
	public String rehomeDeletePost( ) {
		
		
		return "rehome/rehomeList";
	}

}
