<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
<link rel="stylesheet" href="css/Style.css" type="text/css" />
<script type="text/javascript" src="jscript/jscript.js"></script>
</head>
<body>
	<div class="container">
	<h3><span>학생 검색</span> 페이지</h3>
	<hr width="500px" align="left">
	<form name="fname" action="Search.jsp" method="post">
		검색하고자 하는 학생의 이름을 입력하세요<p>
		<table>
		<tr><td>이름</td><td><input type="text" name="s_name"></td></tr>
		</table>
		<p><p>
		&emsp;<input type="button" value="검색" onClick="checkname()">
		<input type="button" value="취소" onClick="location.href='Section.jsp'">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>