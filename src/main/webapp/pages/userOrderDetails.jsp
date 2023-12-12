<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
StringBuffer basePath = request.getRequestURL();
%>
<%
String path = request.getScheme() + "://" + request.getServerName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>訂單詳情．Flower Forever</title>
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

<!-- 第一步: 導包 DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<!--第三步：初始化Datatables-->
<script type="text/javascript">
	$(function() {
		$(".header").load("header.jsp");
		
		// 激活DataTable
		$('#myTable').DataTable();
	});
</script>

<link href="css/adminProduct.css" rel="stylesheet" />

</head>
<body style="background: #ecf0f1;">

	<!-- Header Area -->
	<div class="header"></div>

	<!-- Body Area -->
	<div class="content">

		<div class="content-left">
			<div class="left-title">
				<a href="#">會員中心</a>
			</div>
			<!-- 分割線 -->
			<div class="seg"></div>
			<!-- 菜單欄導航 -->
			<div class="nav2">
				<!-- 單個菜單項 -->
				<div class="nav2-menu">
					<!-- 子標題 -->
					<div class="nav2-content" style="height:60px;">
						<a
							href="<%=path %>:8080/MyFlower2.0/pages/member_data.jsp"
							id="allprods2" class="navtext">變更資料</a> <a
							href="<%=path%>:8080/MyFlower2.0/orderServlet?action=showMyOrders&userId=${ sessionScope.member.id }"
							id="allflowers" class="navtext">我的訂單</a>
					</div>
					<!-- 分割線 -->
					<div class="seg"></div>
				</div>
			</div>
		</div>
		<!-- -----------------------------------------------------內容區---------------------------------------------------------------------------- -->
		<div class="content-right">
			<div class="header_insert">
				<div id="title">訂單詳情</div>
			</div>
			<hr>
			<table id="myTable" class="display">
				<thead>
					<tr>
						<th>商品名稱</th>
						<th>商品數量</th>
						<th>商品單價</th>
						<th>商品總價</th>
						<th>所屬訂單號</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.orderItems}" var="item">
						<tr>
							<td>${item.name}</td>
							<td>${item.count}</td>
							<td>${item.price}</td>
							<td>${item.totalPrice}</td>							
							<td>${item.orderNo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>