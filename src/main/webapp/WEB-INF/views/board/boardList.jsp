<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길드 홍보 게시판</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//글쓰기 버튼 클릭
		$("#writeBtn").click(function(){
			location.href="/board/writeForm.do";
		});
		
		//상세보기
		$(".detail").click(function(){
			let num = $(this).attr("data-num");
			location.href="/board/boardDetail.do?board_num="+num;
		});
	});
</script>
</head>
<body>

	<form id="detailForm" name="detailForm">
		<input type="hidden" id="board_num" name="board_num" />
	</form>

	<div class="mainContainer">
		<div class="mainHead">
			<h1>확장팩 - 길드 홍보 게시판</h1>
			<div>
				<span>길드 주간 BEST 5</span>
				<!-- ForEach문 사용하여 5개의 주간 BEST리스트를 불러올 자리입니다 -->
			</div>
			<div>
				<span>길드 일간 BEST 5</span>
				<!-- ForEach문 사용하여 5개의 일간 BEST리스트를 불러올 자리입니다 -->
			</div>
		</div>
		<div class="mainBody">
			<form id="categoryForm" name="categoryForm">
				<div class="categoryContainer">
					<select>
						<option value="all">전체</option>
						<option value="얼라">얼라</option>
						<option value="호드">호드</option>
					</select>
					<input type="button" id="writeBtn" name="writeBtn" value="글쓰기"/>
				</div>
			</form>
			<div class="board">
				<table>
					<thead>
						<tr>
							<td>글번호</td>
							<td>제목</td>
							<td>글쓴이</td>
							<td>등록일</td>
							<td>조회</td>
							<td>추천</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty boardList }">
								<tr>
									<td colspan="6">등록된 게시글이 없습니다</td>
								</tr>
							</c:when>
							<c:when test="${not empty boardList }">
								<c:forEach var="list" items="${boardList }">
									<tr class="detail" data-num="${list.board_num}">
										<td>${list.board_num}</td>
										<td>${list.board_title}</td>
										<td>${list.board_writer}</td>
										<td>${list.board_regdate}</td>
										<td>${list.board_history}</td>
										<td>${list.board_recommendation}
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
			<form name="f_search" id="f_search">
				<div class="optionContainer">
					<input type="hidden" id="page" name="page" value="1" />
					<table>
						<colgroup>
							<col width="70%">
							<col width="30%">
						</colgroup>
						<tr>
							<td><select id="search" name="search">
									<option value="all">전체</option>
									<option value="title">제목</option>
									<option value="writer">글쓴이</option>
							</select> <input type="text" name="keyword" id="keyword" /> <input
								type="button" id="searchData" value="검색" class="btn" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>