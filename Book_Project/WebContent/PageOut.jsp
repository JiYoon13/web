<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK</title>
<link href="css/Style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	td{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		text-align:left;
	}
	.page{
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container">
		<h3><span>도서 목록</span> 페이지</h3>
		<hr width="700px" color="black">
		<p>
		<table>
		<tr>
			<th colspan="3">
				<form action="Search.do" method="post">
					<select name="sname">
						<option value="bname">책이름</option>
						<option value="bauthor">저자</option>
						<option value="bpublisher">출판사</option>
					</select>
					<input type="text" name="svalue" placeholder="검색어를 입력하세요">
					<input type="submit" value="검색">
				</form>
			</th>
		</tr>
		</table>
		<br>
		<table>
		<thead>
			<tr><td>No</td><td>책이름</td><td>저자/작성자</td><td>출판사</td><td>가격</td><td>조회수</td><td>비고</td></tr>
		</thead>
		<c:forEach items="${alist }" var="my" >
		<tbody>
			<tr>
				<td>${my.bnum }</td>
				<td>
					<c:forEach begin="1" end="${my.brepindent }"><%="&emsp;ㄴ" %></c:forEach>
					<c:choose>
						<c:when test="${my.brepindent == 0 }"><a href="Retrieve.do?bnum=${my.bnum }">${my.bname }</a></c:when>
						<c:when test="${my.brepindent != 0 }"><a href="Review.do?bnum=${my.bnum }">${my.bname }</a></c:when>
					</c:choose>
					
				</td>
				<td>${my.bauthor }</td>
				<td>${my.bpublisher }</td>
				<td><fmt:formatNumber value="${my.bprice }" type="number"/></td>
				<td>${my.breadcnt }</td>
				<td>
					<c:if test="${my.brepindent == 0 }"><a href="BookModify.jsp?bnum=${my.bnum }">수정</a></c:if>
				<!-- <a href="BookModify.jsp?bnum=${my.bnum }">수정</a> -->
				</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	<br>
	<div class="page">
		<jsp:include page="Page.jsp" flush="true"></jsp:include>
	</div>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>