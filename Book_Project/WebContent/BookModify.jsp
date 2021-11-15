<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK</title>
<link href="css/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		HttpSession hs = request.getSession();
		hs.setAttribute("bnum", bnum);
	%>
	<div class="container">
		<h3><span>도서 수정</span> 페이지</h3>
		<hr width="700px" color="black">
		<p>
		<form action="Modify.do" method="post">
			<table>
				<tr><th>책번호</th><td>${param.bnum }</td></tr>
				<tr><th>책이름</th><td><input type="text" name="m_bname" size=48></td></tr>
				<tr><th>저자</th><td><input type="text" name="m_bauthor" size=48></td></tr>
				<tr><th>줄거리</th><td><textarea rows="10" cols="50" name="m_bstory"></textarea></td></tr>
				<tr><th>출판사</th><td><input type="text" name="m_bpublisher" size=48></td></tr>
				<tr><th>가격</th><td><input type="text" name="m_bprice" size=48></td></tr>
			</table>
			<p>
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="location.href='Delete.do?bnum=${param.bnum }'">
		</form>
	</div>
</body>
<%@ include file="Footer.jsp" %>
</html>