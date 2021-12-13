<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<style type="text/css">
	#container{
		width: 1000px;
		margin: 0 auto;
		text-align: center;
	}
	#header{
		width: 1000px;
		height: 30px;
		text-align: center;
		border-bottom: 1px solid #B6B6B6;
	}
	#side{
		width: 1000px;
		height: 60px;
		line-height: 60px;
		border-bottom: 1px solid #B6B6B6;
	}
	#content{
		width: 990px;
		padding: 5px;
		height: 400px;
	}
	#footer{
		width: 1000px;
		height: 40px;
		clear: both;
		border-top: 1px solid #B6B6B6;
		text-align: center;
		font-size: x-small;
	}
	#title{
		color: #6E637A;
	}
	table{
		width: 900px;
		margin: 0 auto;
		border-collapse: collapse;
		
	}
	a:link{color: black; text-decoration: none;}
	a:hover{color: blue; text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		
		<div id="side">
			<tiles:insertAttribute name="side"/>
		</div>
		
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>
		
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>