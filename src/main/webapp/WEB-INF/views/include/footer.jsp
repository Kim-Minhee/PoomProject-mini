<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </main>
    <footer>
        <div class="footer-wrapper">
           <!-- Footer Start-->
           <div class="footer-area footer-padding">
               <div class="container ">
                   <div class="row justify-content-between">
                       <div class="col-xl-4 col-lg-3 col-md-8 col-sm-8">
                           <div class="single-footer-caption mb-50">
                               <div class="single-footer-caption mb-30">
                                   <!-- logo -->
                                   <div class="footer-logo mb-35">
                                       <a href="/poom">
                                       	<img src="/resources/img/poom_logo5.png" alt="" style="width:140px; height:auto; border-radius:30px"></a>
                                   </div>
                                   <div class="footer-tittle">
                                       <div class="footer-pera">
                                           <p>품으로의 다양한 소식을 빠르게 받아보고 싶으신가요? 하단의 공식 SNS를 팔로우해주세요!</p>
                                       </div>
                                   </div>
                                   <!-- social -->
                                   <div class="footer-social">
                                       <a href="#"><i class="fab fa-twitter"></i></a>
                                       <a href="#"><i class="fab fa-facebook-f"></i></a>
                                       <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle">
                                   <h4>게시판</h4>
                                   <ul>
                                       <li><a href="/poom/rehome/list">분양</a></li>
                                       <li><a href="/poom/community/list">소통</a></li>
                                       <li><a href="/poom/notice/list">공지</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle">
                                   <h4>회원</h4>
                                   <ul>
                                   
                                   <c:choose>
										<c:when test="${empty loginMember}">
											
                                       <li><a href="/poom/register/new">개인 회원가입</a></li>
                                       <li><a href="/poom/register/com">업체 회원가입</a></li>
                                       <li><a href="/poom/login">로그인</a></li>
                                       
                                        </c:when>
                                   
                                   		<c:otherwise>
                                       
                                       <li><a href="/poom/mypage">마이페이지</a></li>
                                       <li><a href="/poom/logout">로그아웃</a></li>
                                      	
                                      	</c:otherwise> 
                                   </c:choose>
                                   
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-3 col-lg-4 col-md-6 col-sm-4">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle">
                                   <h4>문의하기</h4>
                                   <ul>
                                       <li><a href="#">ydpmembers@naver.com</a></li>
                                       <li><a href="http://www.learningmen.com/ins/5000200458270?site_=normal">한경닷컴 IT 교육센터</a></li>
                                       <li class="number"><a href="#">(02) 123-4567</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- footer-bottom area -->
           <div class="footer-bottom-area">
               <div class="container">
                   <div class="footer-border">
                       <div class="row d-flex align-items-center">
                           <div class="col-xl-12 ">
                               <div class="footer-copy-right text-center">
                                   <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- Footer End-->
          </div>
      </footer>
      <!-- Scroll Up -->
      <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->

    <script src="https://technext.github.io/environmentalorganization/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/popper.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/owl.carousel.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/wow.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/animated.headline.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.sticky.js"></script>
    <!-- Progress -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.barfiller.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.counterup.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/waypoints.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.countdown.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="https://technext.github.io/environmentalorganization/assets/js/contact.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.form.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.validate.min.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/mail-script.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="https://technext.github.io/environmentalorganization/assets/js/plugins.js"></script>
    <script src="https://technext.github.io/environmentalorganization/assets/js/main.js"></script>
    
</body>
</html>