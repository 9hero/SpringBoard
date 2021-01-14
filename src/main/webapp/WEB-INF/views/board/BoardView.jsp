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
	#tableContents{
	width: 80%;
	margin: auto;
	height: 500px;
	}
	.cont{
		width : 500;
		height: 500;
	}
</style>
</head>
<body>
<h1>상세보기</h1>
	<div style="margin: auto;">
		<table class="table table-striped">
			<tr style="text-align: center;">
				<th>게시판번호</th>
				<th>작성자</th>
				<th>제목</th>			
				<th>작성일</th>
				<th>조회수</th>
				<th>수정</th>
			</tr>				
			<tr style="text-align: center;">
				<td>${BoardInfo.BNUMBER}</td>
				<td>${BoardInfo.BWRITER}</td>
				<td>${BoardInfo.BTITLES}</td>
				<td>${BoardInfo.BDATE}</td>
				<td>${BoardInfo.BHITS}</td>			
				<td><a href="boardModi?bnum=${BoardInfo.BNUMBER}">수정</a></td>
			</tr>
		</table>
		<div class="cont">
		${BoardInfo.BCONTENTS }	
		<img src="${BoardInfo.BFILENAME }">
		<a href="boardDel?bnum=${BoardInfo.BNUMBER}">삭제</a>
		</div>
	</div>

</body>
</html>