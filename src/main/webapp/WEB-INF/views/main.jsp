<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script type="text/javascript">

	let num = "010-2732-3411";
	
	console.log(num);
	
	
	let splitnum = num.split("-");
	
	console.log(splitnum[2]);

	var wsUri = "ws://echo.websocket.org/";
	var output;

	function init() {
		output = document.getElementById("output");
		testWebSocket();
	}

	function testWebSocket() {
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(evt) {
			onOpen(evt);
		};
		websocket.onclose = function(evt) {
			onClose(evt);
		};
		websocket.onmessage = function(evt) {
			onMessage(evt);
		};
		websocket.onerror = function(evt) {
			onError(evt);
		};

	}

	function onOpen(evt) {
		writeToScreen("연결완료");
		doSend("테스트 메세지입니다.");
	}
	function onClose(evt) {
		writeToScreen("연결해제입니다.");
	}
	function onMessage(evt) {
		writeToScreen('<span style="color:blue;">수신:' + evt.data + '</span>');
		websocket.close();
	}
	function onError(evt) {
		writeToScreen('<span style="color:red;">에러:</span>' + evt.data);
	}
	function doSend(message) {
		writeToScreen("발신:" + message);
		websocket.send(message);
	}
	function writeToScreen(message) {
		var pre = document.createElement("p");
		pre.style.wordWrap = "break-word";
		pre.innerHTML = message;
		output.appendChild(pre);
	}

	window.addEventListener("load", init, false);
</script>
</head>
<body>
	<div id="output"></div>
	<a href="/board/boardList.do">[게시판 보기]</a>
	<a href="/member/joinForm.do">[회원가입]</a>
	<a href="/member/loginForm.do">[로그인]</a>
</body>
</html>