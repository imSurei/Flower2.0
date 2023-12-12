<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <sql:setDataSource url="jdbc:mysql://localhost:3306/myflower" 
user="root" password="wahaha" driver="com.mysql.cj.jdbc.Driver"/> --%>

<sql:setDataSource dataSource="jdbc/mysql"/>  

<sql:query var="result">
select * from person
</sql:query>

<!-- result 是sortedMap格式 -->
<table border="1">
<c:forEach var="row" items="${result.rows}">
<tr>

<td>${row.name}</td>
</tr>
</c:forEach>
</table>
</body>
</html>