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
	<div class="container">
	<h3><span>도서 구입</span> 페이지</h3>
	<hr width="100%">
	<p>
	<%
		request.setCharacterEncoding("utf-8");
		String bno = request.getParameter("bno");
		String bname = request.getParameter("bname");
		int price = Integer.parseInt(request.getParameter("price"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		HttpSession hs = request.getSession();
		hs.setAttribute("bno", bno);
		hs.setAttribute("bname", bname);
		hs.setAttribute("price", price);
		hs.setAttribute("cnt", cnt);
	%>
	<form action="Buy.do" method="post">
		<table>
			<tr><td>도서명</td><td><%=bname %></td></tr>
			<tr><td>가격</td><td><%=price %></td></tr>
			<tr><td>수량</td><td><input type="number" name="b_cnt"></td></tr>
		</table>
		<p><p>
		<input type="submit" value="구입">
		<input type="reset" value="취소">
	</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>