<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>


<p>로그인이 실패 하였습니다. 다시 아이디와 비밀번호를 확인해주세요.</p>
	<p>5초후 로그인 페이지로 이동됩니다.</p>
<script>
setTimeout( function() { window.location='/poom/login'; } ,5000);
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
