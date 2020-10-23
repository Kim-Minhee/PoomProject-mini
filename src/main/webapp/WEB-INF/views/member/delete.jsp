<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>

<style type="text/css">
/*-- POPUP common style S ======================================================================================================================== --*/
#mask {
   position: absolute;
   left: 0;
   top: 0;
   z-index: 999;
   background-color: #000000;
   display: none;
}

.layerpop {
   display: none;
   z-index: 1000;
   border: 2px solid #ccc;
   background: #fff;
   /*    cursor: move; */
}

.layerpop_area .title {
   padding: 10px 10px 10px 10px;
   border: 0px solid #aaaaaa;
   background: #f1f1f1;
   color: #3eb0ce;
   font-size: 1.3em;
   font-weight: bold;
   line-height: 24px;
}

.layerpop_area .layerpop_close {
   width: 25px;
   height: 25px;
   display: block;
   position: absolute;
   top: 10px;
   right: 10px;
   background: transparent url('btn_exit_off.png') no-repeat;
}

.layerpop_area .layerpop_close:hover {
   background: transparent url('btn_exit_on.png') no-repeat;
   cursor: pointer;
}

.layerpop_area .content {
   width: 96%;
   margin: 2%;
   color: #828282;
}

#target1 {
   color: #2C952C;
   text-align: center;
   padding: 15px;
}

.star_rating {
   font-size: 0;
   letter-spacing: -4px;
}

.star_rating a {
   font-size: 22px;
   letter-spacing: 0;
   display: inline-block;
   margin-left: 5px;
   color: #ccc;
   text-decoration: none;
}

.starRev span:first-child {
   margin-left: 0;
}

.starRev span.on {
   color: red;
}
/*-- POPUP common style E --*/
</style>

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<script>
   function wrapWindowByMask() {
      //화면의 높이와 너비를 구한다.
      var maskHeight = $(document).height();
      var maskWidth = $(window).width();
      //문서영역의 크기 
      console.log("document 사이즈:" + $(document).width() + "*"
            + $(document).height());
      //브라우저에서 문서가 보여지는 영역의 크기
      console.log("window 사이즈:" + $(window).width() + "*"
            + $(window).height());
      //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
      $('#mask').css({
         'width' : maskWidth,
         'height' : maskHeight
      });
      //애니메이션 효과
      //$('#mask').fadeIn(1000);      
      $('#mask').fadeTo("slow", 0.5);
   }
   function popupOpen() {
      $('.layerpop').css("position", "absolute");
      //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
      $('.layerpop').css(
            "top",
            (($(window).height() - $('.layerpop').outerHeight()) / 2)
                  + $(window).scrollTop());
      $('.layerpop').css(
            "left",
            (($(window).width() - $('.layerpop').outerWidth()) / 2)
                  + $(window).scrollLeft());
      $('.layerpop').draggable();
      $('#layerbox').show();
   }
   function popupClose() {
      $('#layerboxc').hide();
      $('#mask').hide();
   }
   function goDetail() {
      /*팝업 오픈전 별도의 작업이 있을경우 구현*/
      popupOpen(); //레이어 팝업창 오픈 
      wrapWindowByMask(); //화면 마스크 효과 
   }
   $(document).ready(function() {
      var formObj = $("form[name='reviewForm']");
      $(".write_btn").on("click", function() {
         if (fn_valiChk()) {
            return false;
         }
         alert("리뷰작성이 완료되었습니다.");
         formObj.attr("action", "/review/list");
         formObj.attr("method", "post");
         formObj.submit();
      });
   })
   $(document).ready(function() {
      $('.starRev>span').click(function() {
         $(this).parent().children('span.on').removeClass('on');
         $(this).addClass('on').prevAll('span').addClass('on');
         var bb = $(this).attr('data-value');
         alert(bb+'점 선택!')
         $("#point").val(bb); // 히든 인풋에 값 저장.
         return false;
      });
   });
   function fn_valiChk() {
      var writeForm = $("form[name='writeForm'] .chk").length;
      for (var i = 0; i < writeForm; i++) {
         if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
            alert($(".chk").eq(i).attr("title"));
            return true;
         }
      }
   }
</script>

</head>
<jsp:include page="../include/header.jsp"></jsp:include>

   <!--Popup Start -->
         <button onClick="javascript:goDetail('테스트');">탈퇴하기</button>
         <div style="height: 1000px;"></div>

         <!-- 팝업뜰때 배경 -->
         <div id="mask"></div>


         <div id="layerbox" class="layerpop"
            style="width: 700px; height: 350px;">
            <article class="layerpop_area">
               <div class="title2">리뷰 작성하기</div>
               <a href="javascript:popupClose();" class="layerpop_close"
                  id="layerbox_close"></a> <br>


               <form name="writeForm" method="post" action="/review/rWrite">
                  <table>
                     <tbody>

                        <tr>
                           <td><label for="title">주문번호</label><input type="text"
                              id="orderNum" name="orderNum" class="chk" title="주문번호를 입력하세요"
                              value="${myOrderList.orderNum}" placeholder="주문번호를 입력하세요" /></td>
                        </tr>
                        <tr>
                           <td><label for="content">내용</label> <textarea
                                 id="r_content" name="r_content" class="chk"
                                 title="내용을 입력하세요." placeholder="내용을 입력해주세요"></textarea></td>
                        </tr>
                        <tr>
                           <td><label for="writer">작성자</label><input type="text"
                              id="writer" name="w_id" placeholder="ID가져올 예정"
                              value="${loginMember.id}" /></td>
                        <tr>
                        <tr>
                           <td><label for="writer"></label><input type="hidden"
                              id="snum" name="snum" value='${myOrderList.snum}'
                              placeholder="사업자번호 가져올예정" /></td>
                        <tr>
                        <tr>
                           <td><label for="star">별점</label> <input type="hidden"
                              name="star" id="point" />
                              <div class="starRev">
                                 <span class="star1 on" id="star1" data-value="1">★</span> <span
                                    class="star2 on" id="star2" data-value="2">★</span> <span
                                    class="star3 on" id="star3" data-value="3">★</span> <span
                                    class="star4 on" id="star4" data-value="4">★</span> <span
                                    class="star5 on" id="star5" data-value="5">★</span>

                              </div>
                        <tr>
                           <td>
                              <button type="submit" class="write_btn">작성하기</button>
                           </td>
                        </tr>

                        <tr>


                           <td>
                              <button id='layerboxc'>취소</button>
                           </td>
                        </tr>

                     </tbody>
                  </table>
               </form>

            </article>
         </div>

         <!--Popup End -->


<jsp:include page="../include/footer.jsp"></jsp:include>