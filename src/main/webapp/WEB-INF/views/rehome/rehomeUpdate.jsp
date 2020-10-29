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

<form id='update' action='update' method='post' enctype="multipart/form-data">
<br>
  게시판번호 <input type="text" name="bno" value='${rehomeGetOne.bno }' readonly><br>
<%--   분양글번호(읽기만)<input type="text" name="rno" value='${rehomeGetOne.rno }'readonly><br> --%>
  회원번호 <input type="text" name="mno" value='${rehomeGetOne.mno }'readonly><br>
  성별<select form='update' name="gender" ><br>
    <option value="0">암컷</option>
    <option value="1">수컷</option>
    <option value="2">모름</option>
  </select><br>
  접종여부<select name="neut" form='update'><br>
    <option value="0">했음</option>
    <option value="1">안했음</option>
    <option value="2">모름</option>
  </select><br>
  중성화여부<select name="vac" form='update'><br>
    <option value="0">했음</option>
    <option value="1">안했음</option>
    <option value="2">모름</option>
  </select><br>
  분양가<input type="text" name="cost" value='${rehomeGetOne.cost }'><br>

 나이 <input id='age' type="text" name='age' value='${rehomeGetOne.age }'>

  회원상태<input type="text" name="stmt_b" value='${rehomeGetOne.stmt_b }'><br>
  제목<input type="text" name="title" value='${rehomeGetOne.title }'><br>
  글쓴이<input type="text" name="id_writer" value='${rehomeGetOne.id_writer }'><br>
  내용<br><textarea id="cont_b" name="cont_b" rows="20" cols="100" >
	 ${rehomeGetOne.cont_b}
  </textarea><br>
  							<div>등록된 사진: <img src="/resources/img/rehome/${rehomeGetOne.img_r1 }" onerror="this.style.display='/recources/img/none.png'" width="200" height="200" /><input type="hidden" name="img_r1" value="${rehomeGetOne.img_r1 }"><input type="file" name="file1" /></div>
							<div>등록된 사진: <img src="/resources/img/rehome/${rehomeGetOne.img_r2 }" onerror="this.style.display='/recources/img/none.png'" width="200" height="200" /><input type="hidden" name="img_r2" value="${rehomeGetOne.img_r2 }"><input type="file" name="file2" /></div>
							<div>등록된 사진: <img src="/resources/img/rehome/${rehomeGetOne.img_r3 }" onerror="this.style.display='/recources/img/none.png'" width="200" height="200" /><input type="hidden" name="img_r3" value="${rehomeGetOne.img_r3 }"><input type="file" name="file3" /></div>
							<div>등록된 사진: <img src="/resources/img/rehome/${rehomeGetOne.img_r4 }" onerror="this.style.display='/recources/img/none.png'" width="200" height="200" /><input type="hidden" name="img_r4" value="${rehomeGetOne.img_r4 }"><input type="file" name="file4" /></div>
							<div>등록된 사진: <img src="/resources/img/rehome/${rehomeGetOne.img_r5 }" onerror="this.style.display='/recources/img/none.png'" width="200" height="200" /><input type="hidden" name="img_r5" value="${rehomeGetOne.img_r5 }"><input type="file" name="file5" /></div>
  
<input type='submit' value='수정'>
<input type='reset' value='취소'>
<input type='button' onclick='location.href="list"' value='리스트로'>









</form><jsp:include page="../include/footer.jsp"></jsp:include>