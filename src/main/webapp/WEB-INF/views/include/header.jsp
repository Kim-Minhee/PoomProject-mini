<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<body>
		    <!-- ? Preloader Start -->
		    <div id="preloader-active">
		        <div class="preloader d-flex align-items-center justify-content-center">
		            <div class="preloader-inner position-relative">
		                <div class="preloader-circle"></div>
		                <div class="preloader-img pere-text">
		                    <img src="/resources/img/loading_logo2.PNG" alt="">
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- Preloader Start -->
		    <header>
		        <!-- Header Start -->
		        <div class="header-area">
		            <div class="main-header ">
		                <div class="header-bottom  header-sticky">
		                    <div class="container-fluid">
		                        <div class="row align-items-center">
		                            <!-- Logo -->
		                            <div class="col-xl-2 col-lg-2">
		                                <div class="logo">
		                                    <a href="/poom"><img src="/resources/img/poom_logo5.png" alt="" style="width:140px; height:auto; border-radius:30px"></a>
		                                </div>
		                            </div>
		                            <div class="col-xl-10 col-lg-10">
		                                <div class="menu-wrapper  d-flex align-items-center justify-content-end">
		                                    <!-- Main-menu -->
		                                    <div class="main-menu d-none d-lg-block">
		                                        <nav>
		                                            <ul id="navigation">                                                                                          
		                                                <li><a href="/poom/rehome/list">분양</a>
		                                                   <ul class="submenu">
		                                                        <li><a href="/poom/rehome/list">강아지</a></li>
		                                                        <li><a href="/poom/rehome/list">고양이</a></li>
		                                                        <li><a href="/poom/rehome/list">새</a></li>
		                                                        <li><a href="/poom/rehome/list">물고기</a></li>
		                                                        <li><a href="/poom/rehome/list">기타</a></li>
		                                                    </ul>
		                                                </li>
		                                                <li><a href="/poom/community/list">소통</a>
		                                                	<ul class="submenu">
		                                                        <li><a href="/poom/community/list">용품 나눔</a></li>
		                                                        <li><a href="/poom/community/list">동네 친구 찾기</a></li>
		                                                        <li><a href="/poom/community/list">정보 공유</a></li>
		                                                        <li><a href="/poom/community/list">찾습니다</a></li>
		                                                        <li><a href="/poom/community/list">분양 후기</a></li>
		                                                        <li><a href="/poom/community/list">Q&A</a></li>
		                                                        <li><a href="/poom/community/list">건의하기</a></li>
		                                                        <li><a href="/poom/community/list">분양 후기</a></li>
		                                                    </ul>
		                                                </li>
		                                                <li><a href="/poom/notice/list">공지</a>
		                                                	<ul class="submenu">
		                                                        <li><a href="/poom/notice/list">안내</a></li>
		                                                        <li><a href="/poom/notice/list">유의사항</a></li>
		                                                    </ul>
		                                                </li>
		                                                
				                       <c:choose>
											<c:when test="${empty loginMember}">
											
														<li><a href="/poom/register/new">회원가입</a>
		                                                	<ul class="submenu">
		                                                        <li><a href="/poom/register/new">개인</a></li>
		                                                        <li><a href="/poom/register/per">카카오 연동</a></li>
		                                                        <li><a href="/poom/register/com">업체</a></li>
		                                                    </ul>
		                                                </li>
		                                            </ul>
		                                        </nav>
		                                    </div>
		                                    
		                                    <!-- Header-btn -->
		                                    <div class="header-right-btn d-none d-lg-block ml-20">
		                                        <a href="/poom/login" class="btn header-btn">로그인</a>
		                                    </div>
		                                    
		                               		</c:when>
		                                
		                                	<c:otherwise>
		                                	
				                                		<li>
					                                		<a href="/poom/mypage?mno=${loginMember.mno}" style="color:#38A79C;">
					                                			<strong>${loginMember.name}</strong>&nbsp;
						      									<img style="border-radius:20px" onerror="this.src='/resources/img/testImg.jpg'" src="${loginMember.dbSaveName}" width="40px" height="40px">
					                                		</a>
					                                    	<ul class="submenu">
					                                        	<li><a href="/poom/mypage?mno=${loginMember.mno}">마이페이지</a></li>
					                                            <li><a href="/poom/logout">로그아웃</a></li>
					                                        </ul>
				                                    	</li>
				                                    </ul>
				                                </nav>
				                            </div>
			                             		
			                             	</c:otherwise>
											</c:choose>
											
				                        </div>
				                    </div> 
				                    <!-- Mobile Menu -->
				                    <div class="col-12">
				                    	<div class="mobile_menu d-block d-lg-none"></div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
					<!-- Header End -->
					</header>
					<main>


<!-- 			      <li class="nav-item"> -->
<!-- 			        <a class="nav-link" href="/poom/register/com">업체 회원가입</a> -->
<!-- 			      </li> -->
<!-- 			      <li class="nav-item"> -->
<!-- 			        <a class="nav-link" href="/poom/register/per">연동</a> -->
<!-- 			      </li> -->
<!-- 			      <li class="nav-item"> -->
<!-- 			        <a class="nav-link" href="/poom/register/new">개인 회원가입</a> -->
<!-- 			      </li> -->



