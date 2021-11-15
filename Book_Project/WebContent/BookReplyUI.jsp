<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK</title>
<link href="css/Style.css" rel="stylesheet" type="text/css" />
<style>
</style>
</head>
<body>
	<div class="container">
		<h3><span>리뷰 작성</span> 페이지</h3>
		<hr width="700px" color="black">
		<p>
		<form action="Reply.do" method="post">
			<input type="hidden" name="bnum" value="${rdata.bnum }">
			<input type="hidden" name="bname" value="${rdata.bname }">
			<input type="hidden" name="bauthor" value="${rdata.bauthor }">
			<input type="hidden" name="bpublisher" value="${rdata.bpublisher }">
			<input type="hidden" name="bprice" value="${rdata.bprice }">
			<input type="hidden" name="breproot" value="${rdata.breproot }">
			<input type="hidden" name="brepstep" value="${rdata.brepstep }">
			<input type="hidden" name="brepindent" value="${rdata.brepindent }">
			<table>
				<tr><th>No</th><td>${rdata.bnum }</td></tr>
				<tr><th>책이름</th><td>${rdata.bname }</td></tr>
				<tr><th>작성자</th><td><input type="text" name="r_bauthor"></td></tr>
				<tr><th>후기</th><td><textarea cols="50" rows="10" name="r_bstory"></textarea></td></tr>
			</table>
			<p>
			<input type="submit" value="등록">
			<input type="button" value="취소" onclick="location.href='BookOutput.jsp'">
		</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>