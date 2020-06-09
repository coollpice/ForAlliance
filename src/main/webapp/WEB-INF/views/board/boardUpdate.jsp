<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	 
	 //파일첨부 버튼 클릭시 실행
	 $("#fileBtn").click(function(){
		 $(".imagehide").hide(); 
		$(".filehide").show(); 
	 });
	 
	 //이미지첨부 버튼 클릭시 실행
	 $("#imageBtn").click(function(){
		 $(".filehide").hide(); 
			$(".imagehide").show(); 
		 });
	 
	 //목옥으로
	 $("#golist").click(function(){
		location.href="/board/boardList.do"; 
	 });
	 
	 
	 $(".hov").hover(function(){
		$("#image").show();
	 },function(){
		$("#image").hide();
	 });
	 
	 
	 //수정버튼 클릭시 실행
	 $("#updateBtn").click(function(){
		 let formData = new FormData($("#updateForm")[0]);
		 if($("#board_title").val()==''){
			 alert("제목을 입력하세요");
			 $("#board_title").focus();
			 return;
		 }else if($("#board_content").val()==''){
			 alert("내용을 입력하세요");
			 $("#board_content").focus();
			 return;
		 }else{
			$.ajax({
				url:"/board/boardUpdate.do",
				type : "POST",
				processData : false,
				contentType : false,
				data : formData,
				success : function(data){
					if(data == 1){
						alert("게시글이 수정 되었습니다");
						location.href="/board/boardList.do";
					}else{
						alert("게시글 수정에 실패하였습니다.");
						loaction.reload(true);
					}
				}
			}); //ajax종료			 
		 }
	 });
	 
});
</script>
</head>
<body>
 <h1>수정하기</h1>
 <form id="updateForm" name="updateForm" enctype="multipart/form-data">
		<input type="hidden" name="board_writer" id="board_writer" value="${update.board_writer}" />
		<input type="hidden" name="board_num" id="board_num" value="${update.board_num }"/>
		<input type="hidden" name="board_image" id="board_image" value="${update.board_image }"/>
		<div>
			<table>
				<tbody>
					<tr>
						<td colspan="2"><span>제목</span><input type="text"
							name="board_title" id="board_title" value="${update.board_title}" /></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="20" cols="50"
								name="board_content" id="board_content" style="resize: none;">${update.board_content}</textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" name="imageBtn"
							id="imageBtn" value="이미지 첨부" /> <input type="button"
							name="fileBtn" id="fileBtn" value="파일 첨부" /></td>
					</tr>
					<tr class="filehide" style="display: none;">
						<td style="color: red;">다운받기를 위한 파일첨부 입니다.</td>
					</tr>
					<tr class="filehide" style="display: none;">
						<td><input type="file" id="file1" name="file1" /></td>
						<td><input type="file" id="file2" name="file2" /></td>
					</tr>
					<c:if test="${not empty update.board_file1 }">
					<tr>
						<td>현재 등록된 파일 : ${update.board_file1}</td>
					</tr>
						</c:if>
						<c:if test="${not empty update.board_file2 }">
					<tr>
						<td>현재 등록된 파일 : ${update.board_file2} </td>
					</tr>
						</c:if>
					<tr class="imagehide" style="display: none;">
						<td style="color: red;">*본문에 보이게될 이미지 입니다.</td>
					</tr> 
					<tr class="imagehide" style="display: none;">
						<td><input type="file" id="file3" name="file3" /></td>
					</tr>
					<c:if test="${not empty update.board_image }">
					<tr  class="imagehide" style="display: none;">
						<td class="hov">현재 등록된 이미지 : ${update.board_image}</td>
					</tr>
						</c:if>
				</tbody>
			</table>
			<div style="position: absolute; left:250px; top:100px;" ><img id="image" src="/uploadStorage/guild/${update.board_image}" style="display: none; width: 250px; height: 250px;"/></div>
			<div>
				<input type="button" name="updateBtn" id="updateBtn" value="수정완료" />
				<input type="button" name="golist" id="golist" value="목록으로"/>
			</div>
		</div>
	</form>
</body>
</html>