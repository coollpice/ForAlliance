<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// ajax로 가입된 아이디인지 확인
		$("#c_id").blur(function(){
			$.ajax({
				type : "GET",
				url : "/member/joinIdCheck.do",
				data : {c_id : $("#c_id").val()},
				success : function(data) {
					if ("2" == data) {
						$("#chk_id").show();
						$("#chk_id").text("사용 가능한 아이디입니다.");
					} else {
						$("#chk_id").show();
						$("#chk_id").text("이미 가입된 아이디입니다.");
						$("#c_id").val("");
						$("#c_id").focus();
					}
				},
				error : function(xhr, status, error) {
					alert("대상이 없습니다");
				}
			});
		});
		
		// 입력한 비밀번호가 동일한지 체크
		$("#c_pwd").blur(function(){
			if ($("#c_pwd").val() != $("#check_pwd").val()) {
				$("#chk_pwd").show();
				$("#chk_pwd").text("입력된 비밀번호가 서로 틀립니다.");
			} else {
				$("#chk_pwd").show();
				$("#chk_pwd").text("");
			}
		});
		$("#check_pwd").blur(function(){
			if ($("#c_pwd").val() != $("#check_pwd").val()) {
				$("#chk_pwd").show();
				$("#chk_pwd").text("입력된 비밀번호가 서로 틀립니다.");
			} else {
				$("#chk_pwd").show();
				$("#chk_pwd").text("");
			}
		});
		
		// 이메일 중복 확인 버튼 클릭시 팝업
		$("#btn_email").click(function(){
			window.open("/member/joinEmailCheckForm.do", "_blank", "width=800, height=400");
		});
		
		// 회원정보 입력 후 가입하기 버튼
		$("#btn_success").click(function(){
			$("#f_join").attr({
				"method":"POST",
				"action":"/member/joinSubmit.do"
			});
			$("#f_join").submit();
		});
		
		/* 돌아가기 버튼 클릭 시 처리 이벤트 */
		$("#btn_cancel").click(function(){
			if (confirm("로그인 페이지로 돌아갑니까?")) {
				location.href="/member/loginForm.do";
			}
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<form id="f_join">
				<input type="hidden" id="c_email" name="c_email">
				
				<div>
					<label>아이디</label>
					<input type="text" id="c_id" name="c_id" placeholder="ex) gnomeworrier">
					<span id="chk_id" style="display: none;"></span>
				</div>
				<div>
					<label>비밀번호</label>
					<input type="password" id="c_pwd" name="c_pwd" placeholder="비밀번호">
				</div>
				<div>
					<label>비밀번호 확인</label>
					<input type="password" id="check_pwd" placeholder="비밀번호 확인">
					<span id="chk_pwd" style="display: none;"></span>
				</div>
				<div>
					<label>이름</label>
					<input type="text" id="c_name" name="c_name" placeholder="ex) 김노움">
				</div>
				<div>
					<label>연락처</label>
					<input type="text" id="c_phone" name="c_phone" placeholder="ex) 01011112222 '-'제외한 숫자만 입력">
				</div>
				<div>
					<label>이메일</label>
					<input type="text" id="s1_email" disabled> 
					<span>@</span>
					<input type="text" id="s2_email" disabled>
					<input type="button" id="btn_email" value="이메일 중복 확인">
				</div>
				<div>
					<label>진영</label>
					<input type="radio" name="c_position" value="얼라" checked>얼라이언스
					<input type="radio" name="c_position" value="호드">호드
					<input type="radio" name="c_position" value="미정">미정
				</div>
				<div>
					<label>생년월일</label>
					<input type="text" id="c_birth" name="c_birth" placeholder="ex) 200522">
				</div>
				<div>
					<label>성별</label>
					<input type="radio" name="c_gender" checked>남자
					<input type="radio" name="c_gender">여자
				</div>
				<div>
					<label>메모</label>
					<textarea id="c_memo" name="c_memo"></textarea>
				</div>
			</form>
		</div>
		<div>
			<input type="button" id="btn_success" value="가입하기">
			<input type="button" id="btn_cancel" value="돌아가기">
		</div>
	</div>
</body>
</html>