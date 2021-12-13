<%@ include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.data.DTO" %>
<%@ page import="com.data.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Score</title>
</head>
<body>
	<%!
		String no,name;
		int kor, eng, mat, tec;
		int tot;
		double avg;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		no = request.getParameter("no");
		name = request.getParameter("name");
		kor = Integer.parseInt(request.getParameter("kor"));
		eng = Integer.parseInt(request.getParameter("eng"));
		mat = Integer.parseInt(request.getParameter("mat"));
		tec = Integer.parseInt(request.getParameter("tec"));
		tot = kor + eng + mat + tec;
		avg = (double)tot/4;
		
		DTO dto = new DTO(no, name, kor, eng, mat, tec);
		DAO dao = new DAO();
		dao.input(dto);
		response.sendRedirect("Output.jsp");
		
	%>
</body>
</html>