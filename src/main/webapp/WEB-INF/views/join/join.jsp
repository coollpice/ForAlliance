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
		$("#c_id").blur(function(){
			$.ajax({
				type : "GET",
				url : "/login/joinIdCheck.do",
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
	});
</script>
</head>
<body>
	<div>
		<div>
			<form>
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
					<input type="text" id="s1_email" placeholder="ex) wow1234"> @ 
					<select id="s2_email">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option>직접 입력</option>
					</select>
					<input type="text" id="s3_email" placeholder="직접 입력" disabled>
				</div>
				<div>
					<label>진영</label>
					<input type="radio" name="c_position">얼라이언스
					<input type="radio" name="c_position">호드
					<input type="radio" name="c_position">미정
				</div>
				<div>
					<label>생년월일</label>
					<input type="text" id="c_name" name="c_name" placeholder="ex) 200522">
				</div>
				<div>
					<label>성별</label>
					<input type="radio" name="c_gender">남자
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