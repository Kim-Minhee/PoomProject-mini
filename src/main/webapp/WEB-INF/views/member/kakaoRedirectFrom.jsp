<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">		
		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('ef974df3af8acda7ed3f3983cb387a81');

		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.login({
			success: function(authObj) {
				Kakao.API.request({
					url:'/v2/user/me',
					success: function(res) {
						console.log(res);
						var id = res.id;	// 데이터베이스의 Primary Key값 속성, 즉 기본키의 식별성
						var email = res.kakao_account.email;
						var name = res.properties.nickname;
						var html = "<br />" + email + "<br />" + name;
	
						$('body').append(html);
						}
				})
				console.log(authObj);
				var token = authObj.access_token;
			},
			fail: function(err) {
				alert(JSON.stringify(err));
			}
		});
	</script>
</body>
</html>