<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK</title>
<link href="css/Style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	th{
		width: 100px;
		background-color: #DDBEBE;
	}
</style>
</head>
<body>
	<div class="container">
		<h3><span>도서 목록</span> 페이지</h3>
		<hr width="700px" color="black">
		<p><p><p>
		<table border="1">
			<tr><th>No</th><td>${rdata.bnum }</td></tr>
			<tr><th>조회수</th><td>${rdata.breadcnt }</td></tr>
			<tr><th>책이름</th><td>${rdata.bname }</td></tr>
			<tr><th>저자</th><td>${rdata.bauthor }</td></tr>
			<tr><th>줄거리</th><td height="200">${rdata.bstory }</td></tr>
			<tr><th>출판사</th><td>${rdata.bpublisher }</td></tr>
			<tr><th>가격</th><td><fmt:formatNumber value="${rdata.bprice }" type="number"/></td></tr>
			<tr><th>비고</th><td><a href="ReplyUI.do?bnum=${rdata.bnum }"><img src="image/review.png" width="25px" height="25px"> 리뷰등록</a></td></tr>
		</table>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>