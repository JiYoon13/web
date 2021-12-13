<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score</title>
<style type="text/css">
	#container{
		width: 1000px;
		height: 500px;
		text-align: center;
		background-color: #F1F6F6;
	}
	#header{
		width: 1000px;
		height: 100px;
		line-height: 100px;
		text-align: center;
		background-color: #95B3B3;
		color: #2C1205;
	}
	#side{
		width: 20%;
		height: 330px;
		text-align: center;
		margin-top: 20px;
		float: left;
		background-color: #F1F6F6;
	}
	#content{
		padding: 5px;
	}
	#footer{
		width: 1000px;
		height: 70px;
		clear: both;
		background-color: #1B123D;
		text-align: center;
		color: gray;
		font-size: small;
	}
	#sp{
		color: #8E5276;
	}
	table{
		width: 750px;
		margin: 20px auto;
		border-collapse: collapse;
	}
	td{
		padding: 4px;
	}
	a:link{color:black; text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
	a:hover{color: #8E5276; text-decoration: none;}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="side">
			<tiles:insertAttribute name="side" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>