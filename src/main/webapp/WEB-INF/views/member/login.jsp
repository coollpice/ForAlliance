<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 로그인정보 입력 후 로그인하기 버튼
		$("#btn_success").click(function(){
			$("#f_login").attr({
				"method":"POST",
				"action":"/member/loginSubmit.do"
			});
			$("#f_login").submit();
		});
		
		/* 돌아가기 버튼 클릭 시 처리 이벤트 */
		$("#btn_cancel").click(function(){
			if (confirm("홈페이지로 돌아갑니까?")) {
				location.href="/";
			}
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<form id="f_login">
				<div>
					<label>아이디</label>
					<input type="text" id="c_id" name="c_id" placeholder="ex) gnomeworrier">
				</div>
				<div>
					<label>비밀번호</label>
					<input type="password" id="c_pwd" name="c_pwd" placeholder="비밀번호">
				</div>
			</form>
		</div>
		<div>
			<input type="button" id="btn_success" value="로그인하기">
			<input type="button" id="btn_cancel" value="돌아가기">
		</div>
		<div>
			<h4>여긴 다 미구현</h4>
			<a href="#">ID 찾기</a>
			<a href="#">PW 찾기</a>
			<a href="#">회원가입</a>
		</div>
	</div>
</body>
</html>