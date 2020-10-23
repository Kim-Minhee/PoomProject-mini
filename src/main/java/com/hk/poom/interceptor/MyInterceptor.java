package com.hk.poom.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hk.poom.dto.LoginDTO;
import com.hk.poom.dto.RehomeReadDTO;

public class MyInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		System.out.println("-------------------- MyInterceptor_preHandle 실행 --------------------");
//		// 처음 요청받은 url
//		// ( request에서 받았다가... 그걸 다시 response해서 보이지 않게 숨겨놓고... 다시 request로 찾아오고...? )
//		StringBuffer firstUrl = request.getRequestURL();
//		System.out.println("처음 요청받은 url = " + firstUrl);
//		request.setAttribute("firstUrl", firstUrl);
//		
		// 요청한 브라우저의 session을 가져옴
		HttpSession session = request.getSession();
		
		// session에 저장돼 있는 loginMember, writerMno를 가져옴
		LoginDTO loginMember = (LoginDTO) session.getAttribute("loginMember");
		int writerMno = (int) session.getAttribute("writerMno");
		System.out.println("writerMno = " + writerMno);
//		// session 에 넣어야지@!!!!!!!!!
//		RehomeReadDTO rehomeReadDTO = (RehomeReadDTO) request.getAttribute("rehomeRead");
		// 로그인 한 사람의 회원번호와 글쓴이의 회원번호 비교
		if ( loginMember.getMno()!=writerMno ) {	// 불일치 -> 접근 제한			
//			// 저장한 url 보내주기
//			response.flushBuffer();
			response.sendRedirect("/poom/noauth");
			
			return false;	// 더이상 컨트롤러 요청으로 가지 않도록...
		} else {	// 일치 -> 접근 가능
			
			return true;
		}
		
	}
	
}
