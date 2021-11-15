<%@page import="com.book.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK</title>
</head>
<body>
	<%
		PageDTO pdto = (PageDTO)request.getAttribute("page");
		int curpage = pdto.getCurpage();
		int perpage = pdto.getPerpage();
		int totalcnt = pdto.getTotalcnt();
		int totalpage = totalcnt / perpage;
		//out.print(curpage);
		//out.print(perpage);
		//out.print(totalpage);
		if(totalcnt % perpage != 0)
			totalpage++;
		for(int i=1; i<=totalpage; i++){
			if(curpage==i)
				out.print("<font color='#DDBEBE'>" + i + "</font>&emsp;");
			else
				out.print("<a href='Output.do?curpage=" + i + "'>" + i + "</a>&emsp;");
		}
	%>
</body>
</html>