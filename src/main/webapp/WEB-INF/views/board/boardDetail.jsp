<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		//목록으로
		$("#golist").click(function(){
			location.href="/board/boardList.do";
		});
		
		//수정하기
		$("#updateBtn").click(function(){
			 location.href="/board/boardUpdateForm.do?board_num="+${detail.board_num};
		});
	});
</script>
</head>
<body>
	<h1>상세보기</h1>
	<div>
		<div class="head">
			<div class="writer">${detail.board_writer}</div>
			<div class="date">${detail.board_regdate}</div>
			<div class="other">
				<span>조회수 : ${detail.board_history}</span> <span>추천 :
					${detail.board_recommendation }</span>
			</div>
		</div>
		<div class="title">${detail.board_title}</div>
		<div class="content">${detail.board_content}</div>
		<div class="image">
		<c:if test="${not empty detail.board_file1}">
		 <img src="/uploadStorage/guild/${detail.board_file1}" style="width: 200px; height: 250px;"/>
		</c:if>
		<c:if test="${not empty detail.board_file2}">
		 <img src="/uploadStorage/guild/${detail.board_file2}" style="width: 200px; height: 250px;"/>
		</c:if>
		<c:if test="${not empty detail.board_image}">
		 <img src="/uploadStorage/guild/${detail.board_image}" style="width: 200px; height: 250px;"/>
		</c:if>
		</div>
		<div>
			<input type="button" id="updateBtn" name="updateBtn" value="수정"/>
			<input type="button" id="deleteBtn" name="deleteBtn" value="삭제"/>
			<input type="button" id="golist" name="golist" value="목록으로"/>
		</div>
	</div>
</body>
</html>