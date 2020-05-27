<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
	 
	 //등록버튼 클릭시 실행
	 $("#insertBtn").click(function(){
		 let formData = new FormData($("#writeForm")[0]);
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
				url:"/board/boardWrite.do",
				type : "POST",
				processData : false,
				contentType : false,
				data : formData,
				success : function(data){
					if(data == 1){
						alert("게시글 등록이 되었습니다");
						location.href="/board/boardList.do";
					}else{
						alert("게시글 등록에 실패하였습니다.");
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
	<h1>게시글 쓰기</h1>
	<form id="writeForm" name="writeForm" enctype="multipart/form-data">
		<input type="hidden" name="board_writer" id="board_writer" value="임시" />
		<div>
			<table>
				<tbody>
					<tr>
						<td colspan="2"><span>제목</span><input type="text"
							name="board_title" id="board_title" /></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="20" cols="50"
								name="board_content" id="board_content" style="resize: none;"></textarea></td>
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
					<tr class="imagehide" style="display: none;">
						<td style="color: red;">*이미지를 업로드하신 후 클릭을 하셔야 본문에 첨부됩니다.</td>
					</tr>
					<tr class="imagehide" style="display: none;">
						<td><input type="file" id="file3" name="file3" /></td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="button" name="insertBtn" id="insertBtn" value="작성완료" />
				<input type="button" name="golist" id="golist" value="목록으로"/>
			</div>
		</div>
	</form>
</body>
</html>