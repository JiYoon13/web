<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H BookStore</title>
<link href="css/Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String m_bno = request.getParameter("m_bno");
		String m_bname = request.getParameter("m_bname");
	%>
	<div class="container">
	<h3><span>도서 수정</span> 페이지</h3>
	<hr>
	<p>
	<form action="Modify.do" method="post">
		<table>
			<tr><td>도서번호</td><td><%=m_bno %></td></tr>
			<tr><td>도서명</td><td><%=m_bname %></td></tr>
			<tr><td>저자</td><td><input type="text" name="m_author"></td></tr>
			<tr><td>출판사</td><td><input type="text" name="m_publisher"></td></tr>
			<tr><td>가격</td><td><input type="text" name="m_price"></td></tr>
			<tr><td>수량</td><td><input type="text" name="m_cnt"></td></tr>
		</table>
		<p><p>
		
		<%
			HttpSession hs = request.getSession();
			hs.setAttribute("m_bno", m_bno);
			hs.setAttribute("m_bname", m_bname);
		%>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>