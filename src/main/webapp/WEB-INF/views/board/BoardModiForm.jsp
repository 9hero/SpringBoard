<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style>
	#ContentsHead{
	width: 50%;
	margin: auto;
	height: 500px;
	}
	.cont{
		width : 50%;
		margin: auto;
		height: 500px;
	}
</style>
</head>
<body>
<h1>상세보기</h1>
	<div id="ContentsHead">
		<table class="table table-striped">
			<tr style="text-align: center;">
				<th>게시판번호</th>
				<th>작성자</th>
				<th>제목</th>			
				<th>작성일</th>
			</tr>				
			<tr style="text-align: center;">
				<td>${BoardInfo.BNUMBER}</td>
				<td>${BoardInfo.BWRITER}</td>
				<td>${BoardInfo.BTITLES}</td>
				<td>${BoardInfo.BDATE}</td>
			</tr>
		</table>
		
		<form class="cont" action="boardModify" method="post">
		<input type="hidden" name="BNUMBER" value="${BoardInfo.BNUMBER}">
		<input type="text" name="BTITLES" value="${BoardInfo.BTITLES}">
		<textarea rows="30" cols="20" name="BCONTENTS">${BoardInfo.BCONTENTS}</textarea>	
		<img src="${BoardInfo.BFILENAME }">
		<input type="submit" value="수정하기">
		</form>>
	</div>

</body>
</html>