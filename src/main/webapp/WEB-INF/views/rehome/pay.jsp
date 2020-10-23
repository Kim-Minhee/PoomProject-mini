<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<jsp:include page="../include/inHead.jsp"></jsp:include>

     <script> 


   $(function(){
	   //alert("시작");
        var IMP = window.IMP; // 생략가능
        IMP.init('imp62439158'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var bno=$('#bno').text();
        var cost=$('#cost').text();
        //alert("cost = "+cost);
		var id_saler=$('#id_saler').text();
		//alert("id_saler = "+id_saler);
		var id_buyer=$('#id_buyer').text();
       	//alert("id_buyer = "+id_buyer);
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'POOM 분양받기',
            amount : cost,//코스트가 안들어가서 결제가 안됨
          buyer_email : 'alsghl159@naver.com',
            buyer_name : id_buyer,
             buyer_tel : '01041577363',
             buyer_addr : '화곡동',
             buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                //alert("rsp.success 들어옴");
                $.ajax({
                    url: "/poom/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                        //기타 필요한 데이터가 있으면 추가 전달
                        bno : bno,
                        cost : cost,
                        id_saler : id_saler,
                        id_buyer : id_buyer
                    }
                });
                //성공시 이동할 페이지
                location.href='/poom/rehome/paySuccess';            
            } else {
	            msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            //실패시 이동할 페이지
				location.href='/poom/rehome/payFail'; //alert창 확인 후 이동할 url 설정
	            alert(msg);
            }
        });
        
    });
    </script>
    
</head>
<jsp:include page="../include/header.jsp"></jsp:include>


	<div style="display:none;">
		게시글 번호 : <p id="bno" value=>${bno}</p>
		판매자 : <p id="id_saler" value=>${id_saler}</p>
		구매자 : <p id="id_buyer">${id_buyer}</p>
		분양가 : <p id="cost">${cost}</p>
	</div>

 
 <jsp:include page="../include/footer.jsp"></jsp:include>
