<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
<link rel="stylesheet" href="css/Style.css" type="text/css" />
</head>
<body>
	<%
		String u_name = request.getParameter("u_name");
		
	%>
	<div class="container">
	<h3><span>성적 수정</span> 페이지</h3>
	<hr width="500px" align="left">
	<form action="Update.do" method="post">
		<table>
			<tr><td>학생이름</td><td><%=u_name %></td></tr>
			<tr><td>국어점수</td><td><input type="number" name="u_kor"></td></tr>
			<tr><td>영어점수</td><td><input type="number" name="u_eng"></td></tr>
			<tr><td>수학점수</td><td><input type="number" name="u_mat"></td></tr>
		</table>
	<%
		HttpSession hs = request.getSession();
		hs.setAttribute("u_name", u_name);
	%>
		<p><p>&emsp;
		<input type="submit" value="저장">
		<input type="button" value="삭제" Onclick="location.href='Delete.do?u_name=<%=u_name%>'">
		<input type="button" value="취소" Onclick="location.href='Section.jsp'">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>