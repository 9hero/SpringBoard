<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글작성</title>
</head>
<body>
	<form action="boardWrite" method="post" enctype="multipart/form-data">
		<div id="forms">
		<p>작성자 <input type="text" name="BWRITER" value="${userID }" readonly><p>		
		<p>제목 <input type="text" name="BTITLES"><p>
		<p>글내용 <textarea rows="10" cols="20" name="BCONTENTS"></textarea><p>
		<p>파일첨부 <input type="file" name="BFILE"><p>
		<button type="submit">제출</button>
		</div>
	</form>
</body>
</html>