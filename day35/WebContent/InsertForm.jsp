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
	<h3><span>성적 입력</span> 페이지</h3>
	<hr width="500px" align="left">
	<form name="fname" action="Insert.do" method="get">
		<table>
			<tr><td>학생이름</td><td><input type="text" name="name"></td></tr>
			<tr><td>국어점수</td><td><input type="number" name="kor"></td></tr>
			<tr><td>영어점수</td><td><input type="number" name="eng"></td></tr>
			<tr><td>수학점수</td><td><input type="number" name="mat"></td></tr>
		</table>
		<p><p>
		<input type="button" value="저장" onClick="check()">
		<input type="button" value="취소" onClick="location.href='Section.jsp'">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>