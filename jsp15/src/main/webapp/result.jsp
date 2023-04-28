<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 성공</h1>
<button type="button" class="btn btn-primary" onclick="javascript:kakaoLogout('11ab0f94d1016b12aece92ced88081ba')">Kakao UnLink</button>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>

<script>
function kakaoLogout(kakaoKey) {
    Kakao.init(kakaoKey); // 초기화
    Kakao.isInitialized();

    if (!Kakao.Auth.getAccessToken()) { // 토큰이 있는지 확인 (토큰 가져와보기)
      //console.log('Not logged in.');
      alert('로그아웃되었습니다.');
      return;
    }

    Kakao.Auth.logout(function() { // 카카오 로그아웃
      console.log(Kakao.Auth.getAccessToken());
    });
  };
</script>
</body>
</html>