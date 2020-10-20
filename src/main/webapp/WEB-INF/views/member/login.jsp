<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('ef974df3af8acda7ed3f3983cb387a81');
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
	
	// 새 계정으로 로그인
	function loginFormWithKakao() {
		console.log('loginFormWithKakao() 실행');
		Kakao.Auth.loginForm({
			success: function(authObj) {
				showResult(JSON.stringify(authObj));
			},
			fail: function(err) {
 				showResult(JSON.stringify(err));
			},
		})
		// 아래는 데모를 위한 UI 코드입니다.
		getToken();
		function getToken() {
			console.log('getToken() 실행');
			const token = getCookie('authorize-access-token');
			if ( token ) {
				Kakao.Auth.setAccessToken(token);
					document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken();
			}
		}
		function getCookie( name ) {
			console.log('getCookie() 실행');
			const value = "; " + document.cookie;
			const parts = value.split("; " + name + "=");
			if ( parts.length===2) return parts.pop().split(";").shift();
		}
		// 사용자 정보 요청
//	 	function getInfoKakao() {
			console.log('getInfoKakao() 실행');
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
	 				console.log( JSON.stringify(res) );
	 				// 사용자 회원번호 (재로그인시 사용)
	 				$('#login').innerHTML.remove();
	 				$('#login').innerHTML('회원번호 : <input type="text" name="mno" value="' + mno + '">');
				},
				fail: function(error) {
					alert( 'login success, but failed to request user information: ' + JSON.stringify(error) );
				},
			})
//	 	}
		// 로그인 성공시 돌아가는 페이지
		Kakao.Auth.authorize({
			redirectUri: 'http://localhost:9999/poom/login'
		})
	}

	
// 	// 로그 아웃
// 	function kakaoLogout() {
// 		console.log('kakaoLogout() 실행');
// 		if (!Kakao.Auth.getAccessToken()) {
// 			alert('Not logged in.');
// 			return
// 		}
// 		Kakao.Auth.logout(function() {
// 			alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
// 		})
// 	}

// 	// 연결 끊기
// 	function unlinkApp() {
// 		console.log('unlinkApp() 실행');
// 		Kakao.API.request({
// 			url: '/v1/user/unlink',
// 			success: function(res) {
// 				alert('success: ' + JSON.stringify(res));
// 			},
// 			fail: function(err) {
// 				alert('fail: ' + JSON.stringify(err));
// 			},
// 		})
// 	}

</script>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>

	<form id="login" action="login" method="post">
		아이디 : <input type="text" name="id"><br />
		비밀번호 : <input type="password" name="pwd"><br />
		<input type="submit" value="로그인">
	</form>
	<div>
			<!-- 새 계정으로 로그인 -->
			<a id="login-form-btn" href="javascript:loginFormWithKakao()">
	  			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
			</a>
			<p id="login-form-result"></p>
		</div>
	<a href="find/id">아이디</a> / <a href="find/pwd">비밀번호</a> 찾기

<jsp:include page="../include/footer.jsp"></jsp:include>