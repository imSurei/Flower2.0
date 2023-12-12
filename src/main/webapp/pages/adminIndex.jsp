<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>管理員首頁．Flower Forever</title>
<base href="<%=basePath %>">
<!-- AdminHome CSS ��Ч -->
<link href="css/adminIndex.css" rel="stylesheet" />

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery UI ��ʽ�� and jQuery and jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="icon" href="pics/logo/Icon_Logo.png" />


<script type="text/javascript">

$(function () {
	
	$(".header").load("header.jsp");
	$(".footer").load("footer.jsp");

})
</script>
</head>
<body style="background: #ecf0f1;">

	<!-- Header Area -->
   <div class="header"></div>

	<!-- Body Area -->
	<div class="content">

		<div class="content-left">
			<div class="left-title">
				<a style="text-decoration: none;" href="<%=path %>:8080/MyFlower2.0/pages/adminIndex.jsp">管理員介面</a>
			</div>
			<!-- �ָ -->
			<div class="seg"></div>
			<!-- �ˆΙڌ��� -->
			<div class="nav2">
				<!-- �΂��ˆ�� -->
				<div class="nav2-menu">
					<!-- �Ә��} -->
					<div class="nav2-content">
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminIndex.jsp" id="allprods2" class="navtext">管理首頁</a>
						<a href="<%=path %>:8080/MyFlower2.0/manager/UserServlet?action=list" id="allflowers" class="navtext">會員管理</a>
						<a href="<%=path %>:8080/MyFlower2.0/manager/NewsServlet?action=list" id="allgifts" class="navtext">最新消息</a>
						<a href="<%=path%>:8080/MyFlower2.0/manager/ProductServlet?action=list" id="allgifts" class="navtext">商品管理</a>
						<a href="<%=path %>:8080/MyFlower2.0/orderServlet?action=list" id="allgifts" class="navtext">訂單管理</a>
					</div>
					
					<!-- �ָ -->
					<div class="seg"></div>

				</div>
			</div>
		</div>

		<!-- -----------------------------------------------------���݅^---------------------------------------------------------------------------- -->
		<div class="content-right">
			<div class="section">
				<div class="footer-social-media">
					<div class="link-github link-div">
						<div class="circle"></div>
						<a href="<%=path %>:8080/MyFlower2.0/manager/UserServlet?action=list" class="link-undercircle">會員管理</a>
					</div>
					<div class="link-twitter link-div">
						<div class="circle"></div>
						<a href="<%=path %>:8080/MyFlower2.0/manager/NewsServlet?action=list" class="link-undercircle">最新消息</a>
					</div>
					<div class="link-whatsapp link-div">
						<div class="circle"></div>
						<a href="<%=path%>:8080/MyFlower2.0/manager/ProductServlet?action=list" class="link-undercircle">商品管理</a>
					</div>
					<div class="link-linkedin link-div">
						<div class="circle"></div>
						<a href="<%=path %>:8080/MyFlower2.0/orderServlet?action=list" class="link-undercircle">訂單管理</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Area -->
	<div class="footer"></div>
</body>
</html>