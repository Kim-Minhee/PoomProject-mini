<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
$().ready{
	// 뒤로 갈 히스토리가 있는 경우 및 우리 시스템에서 링크를 통해 유입된 경우
	if (document.referrer && document.referrer.indexOf("/poom") !== -1) {
	    history.back();    // 뒤로가기
	}
	// 히스토리가 없는 경우 (URL을 직접 입력하여 유입된 경우)
	else {
	    location.href = "/poom";    // 메인페이지로 
	}
}
</script>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>

<jsp:include page="../include/footer.jsp"></jsp:include>