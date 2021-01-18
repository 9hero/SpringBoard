<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="js/bootstrap.js"></script>
<style>
#tableContents{
width: 80%;
margin: auto;
height: 500px;
}
</style>
</head>
<body>
<h1>보드 리스트</h1>
	<div id="tableContents">
	<table class="table table-striped">
		<tr>
			<th>게시판번호</th>
			<th>작성자</th>
			<th>제목</th>			
			<th>작성일</th>
			<th>조회수</th>			
		</tr>
			<c:forEach items="${BoardList}" var ="list">
			<tr>				
				<td>${list.BNUMBER}</td>
				<td>${list.BWRITER}</td>
				<td><a href="boardView?bnum=${list.BNUMBER}">${list.BTITLES}</a></td>
				<td>${list.BDATE}</td>
				<td>${list.BHITS}</td>			
			</tr>
			</c:forEach>	
	</table>
	<a href="goWriteForm" class="button">글쓰기</a>
	</div>
	<c:choose>
		<c:when test="${page.page eq 1}">
			[이전]&nbsp;
		</c:when>
		<c:otherwise>
			<a href="BoardPage?page=${page.page-1 }">[이전]</a>&nbsp;
		</c:otherwise>
	</c:choose>
	
	<c:forEach var = "i" begin="${page.pageBtnStart}" end="${page.pageBtnEnd }" step="1">
		<c:choose>
			<c:when test="${i eq page.page}">
			${i}
			</c:when>
			<c:otherwise>
			<a href="BoardPage?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:choose>
		<c:when test="${page.page eq page.lastPage}">
			[다음]
		</c:when>
		<c:otherwise>
			<a href="BoardPage?page=${page.page+1 }">[다음]</a>
		</c:otherwise>
	</c:choose>
</body>

</html>