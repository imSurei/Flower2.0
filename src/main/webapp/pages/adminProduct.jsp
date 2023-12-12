<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>商品管理．Flower Forever</title>
<base href="<%=basePath %>">
<!-- Bootstrap -->
<link rel="icon" href="pics/logo/Icon_Logo.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 第一步: 導包 DataTables CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<!--第三步：初始化Datatables-->
<script type="text/javascript">
	$(function() {
		
		$(".header").load("header.jsp");
		
		// 激活DataTable
		$('#myTable').DataTable();

		// 給刪除的a標籤綁定單擊事件，用於刪除的確認提示操作
		$('body').delegate(
				".delete",
				"click",
				function() {
					// confirm確認提示框函數，參數是提示內容，有確認和取消兩按鈕
					// 返回ture表示點擊確認，返回false表示點擊取消
					// 使用function裡的this屬性，得到當前要刪除的商品名
					return confirm("確定刪除【"
							+ $(this).parent().parent().find("td:eq(2)").text()
							+ "】?");
					// return false;  阻止元素默認提交請求的動作，交由上面confirm統一return
				});
	});
</script>

<link href="css/adminProduct.css" rel="stylesheet" />

</head>
<!-- <body style="background: #ecf0f1;"> -->
<body style="background: #ecf0f1;">

	<!-- Header Area -->
   <div class="header"></div>
    
	<!-- Body Area -->
	<div class="content">

		<div class="content-left">
			<div class="left-title">
				<a href="#">管理員介面</a>
			</div>
			<!-- 分割線 -->
			<div class="seg"></div>
			<!-- 菜單欄導航 -->
			<div class="nav2">
				<!-- 單個菜單項 -->
				<div class="nav2-menu">
					<!-- 子標題 -->
					<div class="nav2-content">
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminIndex.jsp" id="allprods2" class="navtext">管理首頁</a>
						<a href="<%=path %>:8080/MyFlower2.0/manager/UserServlet?action=list" id="allflowers" class="navtext">會員管理</a>
						<a href="<%=path %>:8080/MyFlower2.0/manager/NewsServlet?action=list" id="allgifts" class="navtext">最新消息</a>
						<a href="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=list" id="allgifts" class="navtext">商品管理</a>
						<a href="<%=path %>:8080/MyFlower2.0/orderServlet?action=list" id="allgifts" class="navtext">訂單管理</a>
					</div>

					<!-- 分割線 -->
					<div class="seg"></div>

				</div>
			</div>
		</div>

		<!-- -----------------------------------------------------內容區---------------------------------------------------------------------------- -->
		<div class="content-right">
			<!-- 調整跳板 -->

			<div class="header_insert">
				<div id="title">商品管理</div>
				<div id="add">
					<a href="<%=path %>:8080/MyFlower2.0/pages/product_insert.jsp">新增商品</a>
				</div>
			</div>
		<hr>
			<!--  <div class="list">  -->
				<table id="myTable" class="display">
					<thead>
						<tr>
							<th>編號</th>
							<th>圖片</th>
							<th>商品名稱</th>
							<th>分類</th>
							<th>子分類</th>
							<th>售價</th>
							<th>數量</th>
							<th>庫存</th>
							<th>產地</th>
							<th>功能</th>
							<th>功能</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.products}" var="product">
							<tr>
								<td>${product.id}</td>
								<td><img src="${product.imgPath}" height="50" width="50" /></td>
								<td>${product.name}</td>
								<td>${product.type}</td>
								<td>${product.subtype}</td>
								<td>${product.price}</td>
								<td>${product.quantity}</td>
								<td>${product.inventory}</td>
								<td>${product.place}</td>
								<td><a href="<%=path%>:8080/MyFlower2.0/manager/ProductServlet?action=getProduct&id=${product.id}">修改</a></td>
								<!-- 刪除鍵做防呆    &   此處id名可自定義，不用對應到哪個 -->
								<td><a class="delete" id="delete" href="<%=path%>:8080/MyFlower2.0/manager/ProductServlet?action=delete&id=${product.id}">刪除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	<!--  </div>  -->
</body>
</html>