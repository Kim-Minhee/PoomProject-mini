<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rehome Update</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>

회원 수정

<form id='update' action='update' method='post'
	enctype="multipart/form-data">
	<br> 게시판번호(읽기만)<input type="text" name="bno"
		value='${communityGetOne.bno }' readonly><br> 제목<input
		type="text" name="title" value='${communityGetOne.title }'><br>
	글쓴이<input type="text" name="id_writer" value='${communityGetOne.id_writer }'><br> 
	내용<br>
	<textarea id="cont_b" name="cont_b" rows="20" cols="100">
	 ${communityGetOne.cont_b}
  </textarea>
	<br>
	<div>
		등록된 사진: <img src="/resources/img/community/${communityGetOne.img_c1 }"
			onerror="this.style.display='/recources/img/none.png'" width="200"
			height="200" /><input type="hidden" name="img_c1"
			value="${communityGetOne.img_c1 }"><input type="file"
			name="file1" />
	</div>
	<div>
		등록된 사진: <img src="/resources/img/community/${communityGetOne.img_c2 }"
			onerror="this.style.display='/recources/img/none.png'" width="200"
			height="200" /><input type="hidden" name="img_c2"
			value="${communityGetOne.img_c2 }"><input type="file"
			name="file2" />
	</div>
	<div>
		등록된 사진: <img src="/resources/img/community/${communityGetOne.img_c3 }"
			onerror="this.style.display='/recources/img/none.png'" width="200"
			height="200" /><input type="hidden" name="img_c3"
			value="${communityGetOne.img_c3 }"><input type="file"
			name="file3" />
	</div>
	<div>
		등록된 사진: <img src="/resources/img/community/${communityGetOne.img_c4 }"
			onerror="this.style.display='/recources/img/none.png'" width="200"
			height="200" /><input type="hidden" name="img_c4"
			value="${communityGetOne.img_c4 }"><input type="file"
			name="file4" />
	</div>
	<div>
		등록된 사진: <img src="/resources/img/community/${communityGetOne.img_c5 }"
			onerror="this.style.display='/recources/img/none.png'" width="200"
			height="200" /><input type="hidden" name="img_c5"
			value="${communityGetOne.img_c5 }"><input type="file"
			name="file5" />
	</div>

	<input type='submit' value='수정'> <input type='reset' value='취소'>
	<input type='button' onclick='location.href="list"' value='리스트로'>









</form><jsp:include page="../include/footer.jsp"></jsp:include>