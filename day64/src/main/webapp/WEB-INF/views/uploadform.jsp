<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>Member</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}
</script>
</head>
<body>
	<h3><span id="title">IMAGE</span> PAGE</h3>
	<hr style="border: 2px solid #6E637A">
	<form method="post" action="${contextPath}/upload" enctype="multipart/form-data">
	<label>IMAGE:</label>
    <input type="text" name="name"><p>
	<input type="button"  value="파일 추가" onClick="fn_addFile()"/><br>
	<div id="d_file"></div> <!-- 파일이 여러개일 때 -->
	<input type="submit"  value="업로드"/>
</form>
</body>
</html>