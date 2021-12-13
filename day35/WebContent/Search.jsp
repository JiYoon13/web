
<%@ include file="dbconnect.jsp" %>
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
	<%! %>
	<%
		request.setCharacterEncoding("utf-8");
		String s_name = request.getParameter("s_name");
		String sql = "select * from score30 where name=?";
		psmt=con.prepareStatement(sql);
		psmt.setString(1, s_name);
		res=psmt.executeQuery();
	%>
	
	<h3><span>성적 조회</span> 페이지</h3>
	<hr width="500px" align="left">
	<table border="1" width="500px">
		<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th><th>학점</th><th>비고</th></tr>
	<%
		if(!res.next()){
	%>
		<script>checkname2();</script>
	<%
		}else{
		do{
			String name = res.getString("name");
			int kor = res.getInt("kor");
			int eng = res.getInt("eng");
			int mat = res.getInt("mat");
			int tot = res.getInt("tot");
			double avg = res.getDouble("avg");
			String grade = res.getString("grade");
	%>
		<tr><td><%=name %></td><td><%=kor %></td><td><%=eng %></td><td><%=mat %></td><td><%=tot %></td><td><%=avg %></td><td><%=grade %></td>
		<td><a href="UpdateForm.jsp?u_name=<%=name %>">수정</a></td>
		</tr>
	<%
		}while(res.next());
		}
	%>
	</table>
</body>
<%@ include file="Footer.jsp" %>
</html>