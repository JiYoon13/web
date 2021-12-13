<%@ include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Style.css"/>
<title>Student Score</title>
</head>
<body>

	<%
		String m_name = request.getParameter("m_name");
		String m_no = request.getParameter("m_no"); ;
	%>
	<div class="container">
	<h4><span>성적 수정 </span>페이지 입니다.</h4>
	<hr/>
	<form action="Modifysave.jsp" method="post" align="center">
			<table>
				<tr><td>번호 </td><td><input name="m_no" value=<%=m_no %>></td></tr>
				<tr><td>이름 </td><td><input name="m_name" value=<%=m_name %>></td></tr>
				<tr><td>국어 </td><td><input type="text" name="m_kor"></td></tr>
				<tr><td>영어 </td><td><input type="text" name="m_eng"></td></tr>
				<tr><td>수학 </td><td><input type="text" name="m_mat"></td></tr>
				<tr><td>과학 </td><td><input type="text" name="m_tec"></td></tr>
			</table>
		<p><p>
		<input type="submit" value="수정" class="submitbtn">
		<input type="reset" value="취소" onClick="location.href='Index.jsp'" class="submitbtn">
	</form>	
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>