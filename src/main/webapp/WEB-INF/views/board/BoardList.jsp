<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
</head>
<body>
<h1>보드 리스트</h1>
	
	<table class="table table-striped">
		<tr style="text-align: center;">
			<th>게시판번호</th>
			<th>작성자</th>
			<th>제목</th>			
			<th>작성일</th>
			<th>조회수</th>			
		</tr>
			<c:forEach items="${BoardList}" var ="list">
			<tr style="text-align: center;">
				
				<td>${list.BNUMBER}</td>
				<td>${list.BWRITER}</td>
				<td><a href="boardView?bnum=${list.BNUMBER}">${list.BTITLES}</a></td>
				<td>${list.BDATE}</td>
				<td>${list.BHITS}</td>			
			</tr>
			</c:forEach>	
	</table>
	<h2>검색</h2>
	<form action="bsearch">
		<select name="selectbox">
		<option value="title">제목 검색</option>
		<option value="context">내용 검색</option>
	</select>
	<input type="text" name="serach">
	<button type="submit">검색</button>
	</form>
	
</body>

</html>