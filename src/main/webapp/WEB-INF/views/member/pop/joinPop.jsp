<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 확인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 직접입력 선택시
		$("#s2_email").change(function(){
			$("#s3_email").val("");
			if ($("#s2_email").val() == "") {
				$("#s3_email").prop("disabled", false);
			} else {
				$("#s3_email").prop("disabled", true);
			}
		});
		
		// 중복 확인 버튼 클릭시 email 중복 체크
		$("#chk_email").click(function(){
			// 중복 체크시 비교할 이메일
			let s1_email = $("#s1_email").val();
			let s2_email = $("#s2_email option:selected").val();
			let s3_email = $("#s3_email").val();
			
			$("#c_email").val(s1_email + "@" + s2_email + s3_email);
			
			if (((s2_email + s3_email) == "") || s1_email == "") {
				alert("메일을 입력해주세요.");
			} else {
				// 중복 체크
				$.ajax({
					type : "GET",
					url : "/member/joinEmailCheck.do",
					data : {c_email : $("#c_email").val()},
					success : function(data) {
						if ("2" == data) {
							alert("사용 가능한 이메일입니다.")
							$("#chk_submit").val("1");
							$("#s1_email").prop("disabled", true);
							$("#s2_email").prop("disabled", true);
							$("#s3_email").prop("disabled", true);
						} else {
							alert("이미 사용중인 이메일입니다.")
							$("#s1_email").val("");
							$("c_email").val("");
							$("#s1_email").focus();
						}
					},
					error : function(xhr, status, error) {
						alert("대상이 없습니다");
					}
				});
			}
		});
		
		// 확인 버튼 클릭시 부모페이지에 email값 전송
		$("#btn_success").click(function(){
			if ($("#chk_submit").val() == "") {
				alert("이메일 중복체크를 해주세요.");
			} else {
				opener.document.getElementById("s1_email").value = document.getElementById("s1_email").value;
				if ($("#s3_email").val() == "") {
					opener.document.getElementById("s2_email").value = document.getElementById("s2_email").value;
				} else {
					opener.document.getElementById("s2_email").value = document.getElementById("s3_email").value;
				}
				opener.document.getElementById("c_email").value = document.getElementById("c_email").value;
				$("#chk_submit").val("");
				window.close();
			}
		});
		
		// 닫기 버튼 클릭시 팝업창 닫기
		$("#btn_cancel").click(function(){
			window.close();
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<input type="hidden" id="c_email">
			<input type="hidden" id="chk_submit" value="">
			<form id="f_emailChk">
				<input type="text" id="s1_email">
				<span>@</span>
				<select id="s2_email">
					<option value="naver.com">naver.com</option>
					<option value="gamil.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="">직접 입력</option>
				</select>
				<input type="text" id="s3_email" disabled>
				<input type="button" id="chk_email" value="중복 확인">
			</form>
		</div>
		<div>
			<input type="button" id="btn_success" value="확인">
			<input type="button" id="btn_cancel" value="닫기">
		</div>
	</div>
</body>
</html>