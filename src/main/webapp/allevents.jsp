<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Events</title>
</head>
<body>
<h1>All Events</h1>
<table border="5" cellspacing="10" cellpadding="10" style="border-collapse:collapse;margin:auto;">
<tr>
<th>id</th>
<th>title</th>
<th>location</th>
<th>date</th>
<th>chief guest</th>
<th colspan="2">Action</th>
</tr>
<%ResultSet rs=(ResultSet) request.getAttribute("rs");
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><a href="delete?id=<%=rs.getInt(1)%>"><button>Delete</button></a></td>
<td><a href="updatepage?id=<%=rs.getInt(1)%>"><button>Update</button></a></td>
</tr>
<%
} 
%>
</table>
</body>
</html>