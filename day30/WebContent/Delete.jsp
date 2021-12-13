<%@ include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Style.css"/>
<title>Student Score</title>
</head>
<body>
	<%! 
		String d_no;
	%>
	
	<%
		request.setCharacterEncoding("utf-8");
		d_no = request.getParameter("d_no");
		String sql = "delete from score where no=?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, d_no);
		
		int k = psmt.executeUpdate();
		if(k==1)
			response.sendRedirect("Output.jsp");
	%>
</body>
</html>