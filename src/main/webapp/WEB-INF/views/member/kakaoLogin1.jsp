<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Login</title>
</head>
<body>
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
	</a>
	
	<a id="login-form-btn" href="javascript:loginFormWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<p id="login-form-result"></p>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		//var client_email = null;
		
		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('ef974df3af8acda7ed3f3983cb387a81');

// 		Kakao.Auth.authorize({
// 			redirectUri: "http://localhost:9999/kakaoRedirectForm.jsp";
// 		})	
		
// 		function loginWithKakao() {
// 			Kakao.Auth.authorize({
// 				redirectUri: "http://localhost:9999/kakaoRedirectForm.jsp";
// 			})
// 		}

		// 아래는 데모를 위한 UI 코드입니다.
		getToken()
		function getToken() {
			const token = getCookie('authorize-access-token');
			if(token) {
				Kakao.Auth.setAccessToken(token);
				document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken();
			}
		}
		function getCookie(name) {
			const value = "; " + document.cookie;
			const parts = value.split("; " + name + "=");
			if (parts.length === 2) return parts.pop().split(";").shift();
		}
		  
// 		Kakao.Auth.login({
// 			success: function(authObj) {
// 				Kakao.API.request({
//       				url:'/v2/user/me',
//     				success: function(res) {
//     					console.log(res);
//     					var email = res.kakao_account.email;
//     					var name = res.properties.nickname;

//     					location.href="kakaoRedirectForm.jsp?email="+email+"&name="+name;
//               	});
// 				console.log(authObj);
// 				var token = authObj.access.token;
// 			},
// 			fail: function(err) {
				
// 			}
// 		});

		// 팝업으로
		function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj))
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  }

		  // 새 계정으로 로그인
		  function loginFormWithKakao() {
    Kakao.Auth.loginForm({
      success: function(authObj) {
        showResult(JSON.stringify(authObj))
      },
      fail: function(err) {
        showResult(JSON.stringify(err))
      },
    })
  }
  function showResult(result) {
    document.getElementById('login-form-result').innerText = result
  }
	</script>
</body>
</html>