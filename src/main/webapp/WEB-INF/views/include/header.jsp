<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.poom.dto.LoginDTO"%>

<%  LoginDTO loginMember = (LoginDTO) session.getAttribute("loginMember");
	if ( loginMember!=null ) {  %>

<body>
 <a href="/poom">홈</a>
 <a href="/poom/rehome/list">분양글</a>
 <a href="/poom/community/list">소통글</a>
 <a href="/poom/notice/list">공지글</a>
 
 <span>
 	${loginMember.name}   			
<%-- 	<img style="border-radius:20px" src="${sessionScope.principal.userProfile }" width="40px" height="40px"> --%>
	<a href="/poom/logout">로그아웃</a>
 </span>
				</a>
 <br /><br />
  <!-- Page Wrapper -->
  <div id="wrapper">

<%  } else {  %>

<body>
 <a href="/poom">홈</a>
 <a href="/poom/rehome/list">분양글</a>
 <a href="/poom/community/list">소통글</a>
 <a href="/poom/notice/list">공지글</a>
 <a href="/poom/login">로그인</a>
 <a href="/poom/register/com">업체 회원가입</a>
 <a href="/poom/register/per">연동</a>
 <a href="/poom/register/new">개인 회원가입</a>
 <br /><br />
  <!-- Page Wrapper -->
  <div id="wrapper">

<%  }  %>