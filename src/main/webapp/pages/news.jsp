<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
StringBuffer basePath = request.getRequestURL();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>最新消息．Flower Forever</title>
<base href="<%=basePath%>">

<!-- Bootstrap -->
<link rel="icon" href="pics/logo/Icon_Logo.png" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="icon" href="pics/logo/Icon_Logo.png" />

<!-- 第一步: 導包 DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


<style type="text/css">
.content {
	margin: 80px auto 0 auto;
	width: 1500px;
	height: 900px;
	background-color: grey;
}

.newstr {
	color: black;
	text-decoration: none;
}
</style>

<script>
	$(function() {

		$(".header").load("header.jsp");
		$(".footer").load("footer.jsp");

		// 激活DataTable
		$('#myTable').DataTable();

	})
</script>
</head>

<body style="background-color: #f5f6fa">
	<!-- Header -->
	<div class="header"></div>

	<div style="height: 100px;"></div>
	<div class="container">
		<h2 class="mb-4">最新消息</h2>
		<%-- <table id="newsDataTable" class="display " style="width: 100%">
			<thead class="">
				<tr>
					<th class="col-2 text-start">標題</th>
					<th class="col-3 text-start">發布日期</th>
					<th class="col-7 text-start">內容</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.news}" var="news">
					<tr>
						<td>${news.title}</td>
						<td>${news.date}</td>
						<td>${news.content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table> --%>
		 <table id="myTable" class="display">
			<thead>
				<tr>
					<th>ID</th>
					<th>發布日期</th>
					<th>標題</th>
					<th>內容</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.news}" var="news">
					<tr>
						<td>${news.id}</td>
						<td>${news.date}</td>
						<td>${news.title}</td>
						<td>${news.content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table> 
	</div>
	<!--Footer-->
	<hr class="mt-4" />
	<div class="footer"></div>
</body>
</html>
