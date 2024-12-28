<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update page</title>
</head>
<body>
<%
ResultSet rs=(ResultSet) request.getAttribute("rs");
%>
<h1>Update page</h1>
<form action="update">
	<input type="text" name="id" value="<%=rs.getInt(1) %>" readonly="readonly" placeholder="Enter Event id"><br><br>
	<input type="text" name="title" value="<%=rs.getString(2) %>" placeholder="Enter Event title"><br><br>
	<input type="text" name="loc" value="<%=rs.getString(3) %>" placeholder="Enter Event location"><br><br>
	<input type="text" name="date" value="<%=rs.getString(4) %>" placeholder="Enter Event date"><br><br>
	<input type="text" name="guest" value="<%=rs.getString(5) %>" placeholder="Enter Event Chief guest name"><br><br>
	<button type="submit">Submit</button>
</form>
</body>
</html>