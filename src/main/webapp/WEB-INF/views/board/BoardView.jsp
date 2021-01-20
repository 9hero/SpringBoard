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
	.tableContents{
	width: 60%;
	margin: auto;
	height: 500px;
	}
	.cont{
		width : 500px;
		height: 500px;
		margin: auto;
	}
</style>
</head>
<body>
<h1>상세보기</h1>
	<div class="tableContents">
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
		
		<div class="tableContents">
		${BoardInfo.BCONTENTS }	
		<img src="${BoardInfo.BFILENAME }">
		<a href="boardDel?bnum=${BoardInfo.BNUMBER}">삭제</a>
		</div>
	</div>
	<div class="replyContent">
		<div class="wrtieReple">
		<span>작성자: ${BoardInfo.BWRITER}</span>
		<textarea id="Comtext" rows="20" cols="10"></textarea>
		<button onclick="writeComment()">댓글작성</button>		
		</div>
		<div id="Comment">
<!-- 		<div class="writer"></div>
			<p class="contents"></p>
			<div class="date"></div> -->
		</div>		
	</div>	
</body>
<script>
	$(document).ready(function(){		
		$.ajax({
			type: "get",
			url: "comment/getComment",
			data: {"bnum" : ${BoardInfo.BNUMBER}},
			dataType: "json",
			success:function(result){
				var output = "";
				for(var i in result){
					output += "<span class=\"writer\">"+result[i].cWriter+"</span>";
					output += "<p class=\"contents\">"+result[i].cContents+"</p>";
					output += "<span class=\"date\">"+result[i].cDate+"</span>";
					output += "<button onclick=\"delComment("+result[i].cNumber+")\">댓글삭제</button>";					
				}
				$("#Comment").html(output);				
			},
			error: function(){
				alert('댓글 불러오기 실패');
			}
		});
		
	})


	function writeComment(){
		var cContents = $("#Comtext").val();
		console.log(cContents);
		var cWriter = '${BoardInfo.BWRITER}';
		var cbNumber = '${BoardInfo.BNUMBER}';
		var Comment = document.getElementById("Comment");
		$.ajax({
			type: "post",
			url: "comment/write",
			data: {
				"cWriter" : cWriter,
				"cContents" : cContents,
				"cbNumber" : cbNumber
			},
			dataType: "json",
			success: function(result){
				var output = "";
				for(var i in result){
					output += "<span class=\"writer\">"+result[i].cWriter+"</span>";
					output += "<p class=\"contents\">"+result[i].cContents+"</p>";
					output += "<span class=\"date\">"+result[i].cDate+"</span>";
					output += "<button onclick=\"delComment("+result[i].cNumber+")\">댓글삭제</button>";					
				}
				$("#Comment").html(output);
				
			},
			error: function(){
				console.log("댓글등록실패");
			}			
		});		
	}
	function delComment(cNum){
		$.ajax({
			type: "post",
			url: "comment/deleteComment",
			data: {"cNum" : cNum},
			dataType: "text",
			success: function(result){
				alert(result);
			},
			error: function(){
				cosolo.log("ajax실패");
			}
		});
		$.ajax({
			type: "get",
			url: "comment/getComment",
			data: {"bnum" : ${BoardInfo.BNUMBER}},
			dataType: "json",
			success:function(result){
				var output = "";
				for(var i in result){
					output += "<span class=\"writer\">"+result[i].cWriter+"</span>";
					output += "<p class=\"contents\">"+result[i].cContents+"</p>";
					output += "<span class=\"date\">"+result[i].cDate+"</span>";
					output += "<button onclick=\"delComment("+result[i].cNumber+")\">댓글삭제</button>";					
				}
				$("#Comment").html(output);				
			},
			error: function(){
				alert('댓글 불러오기 실패');
			}
		});
	}
	
	
</script>
</html>