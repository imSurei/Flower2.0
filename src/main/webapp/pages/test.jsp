<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String param = request.getParameter("param");
%>
<body>
<a href="test.jsp?param='中文'">click</a>
您提交的參數為：<%=param %>

</body>
</html>