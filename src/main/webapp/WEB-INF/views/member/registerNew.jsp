<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>

	<form action="new" method="post" id="registerNewForm">
		회원 유형(나중에 히든으로 바꾸기) : <input type="text" value="1"><br />
		아이디 : <input type="text" name="id"><button>중복확인</button><br />
		비밀번호 : <input type="password"><br />
		비밀번호 확인 : <input type="password" name="pwd"><button>일치확인(ajax로 자동으로 바꿔!)</button><br />
		이름 : <input type="text" name="name"><br />
		이메일 : <input type="email" name="email"><button>중복확인</button><button>본인인증</button><br />
		주소 : <input type="text" name="address"><br />
		연락처 : <input type="tel" name="tel"><br />
		멘트 : <input type="text" name="ment"><br />
		프로필 사진(타입이 파일) : <input type="file" name="prof"><button>업로드?</button><br />
		프로필 사진(타입이 이미지) : <input type="image" name="prof"><button>업로드?</button><br />
		관심 분야 : <select form="registerNewForm" name="fav">
        			<option value="0">선택안함</option>
        			<option value="1">강아지</option>
        			<option value="2">고양이</option>
        			<option value="3">물고기</option>
        			<option value="4">새</option>
        			<option value="5">기타</option>
   				 </select><br />
		애완동물 유무 : <select form="registerNewForm" name="pet">
        				<option value="0">선택안함</option>
        				<option value="1">유</option>
        				<option value="2">무</option>
   				 	</select><br />
		<input type="submit" value="가입하기">
	</form>

<jsp:include page="../include/footer.jsp"></jsp:include>