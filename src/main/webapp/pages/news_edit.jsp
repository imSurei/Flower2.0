<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
StringBuffer basePath = request.getRequestURL();
%>
<%
String path = request.getScheme() + "://" + request.getServerName();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改消息．Flower Forever</title>
<base href="<%=basePath%>">

<link rel="icon" href="pics/logo/Icon_Logo.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
body {
	background-color: rgb(255, 255, 255);
	margin: 0;
}

* {
	box-sizing: border-box;
}

.form-group {
	margin-bottom: 10px;
}

.form-control {
	margin: 0px 0px 10px;
}

.text-center {
	padding-bottom: 20px;
}

.btn {
	margin-right: 20px;
}

.btn-group {
	margin-left: 160px;
	margin-top: 30px;
	margin-bottom: 50px;
}

.form-check-inline {
	display: inline-block;
	margin: 15px 0 15px;
	padding-right: 65px;
}

header {
	margin-bottom: 90px;
}
</style>
</head>

<body>
	<header>
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light fixed-top ps-3">
			<div class="container-fluid">
				<a class="navbar-brand"
					href="<%=path%>:8080/MyFlower2.0/pages/index.jsp"><img
					style="width: 70px"
					src="/MyFlower2.0/pages/pics/indexPics/Logo.png"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							href="<%=path%>:8080/MyFlower2.0/pages/index.jsp">首頁</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="<%=path%>:8080/MyFlower2.0/pages/news.jsp">最新消息</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-dark" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> 商品 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/product_index.jsp">所有商品</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/product_index_flower.jsp">花束系列</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/product_index_gift.jsp">禮品系列</a>
								</li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-dark" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> 聯絡我們 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/contact.jsp">客服</a></li>
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/contactInfo.jsp">聯絡資訊</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/contactReturned.jsp">退換貨政策</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path%>:8080/MyFlower2.0/pages/contactPrivacy.jsp">隱私權政策</a>
								</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="container mt-5">
		<div class="row">
			<div class="col-10">
				<div style="width: 60%; margin: 20px auto; padding: 0">
					<h2 class="text-center">修改消息</h2>

					<!-- 用絕對路徑  -->
					<form action="<%=path%>:8080/MyFlower2.0/manager/NewsServlet" class="mb-5" method="POST">
						<input type="hidden" name="action" value="update">
						
						<input type="hidden" name="id" value="${ requestScope.news.id }">

						<div class="form-group">
							<label for="title">標題</label> 
							<input type="text" name="title"
								id="title" class="form-control" value="${ requestScope.news.title }" required>
						</div>

						<div class="form-group">
							<label for="date">發布日期</label><br> <input type="Date"
								name="date" id="date" class="form-control"
								value="${ requestScope.news.date }" required>
						</div>

						<div class="form-group">
							<label class="form-label">內容</label>
							<textarea class="form-control" rows="6" name="content" id="content" 
							required>${ requestScope.news.content }</textarea>
						</div>

						<div class="btn-group">
							<button type="submit" id="insertBtn" class="btn btn-primary">修改</button>
							<button type="reset" class="btn btn-primary">重置</button>
							<a class="btn btn-primary"
								href="<%=path%>:8080/MyFlower2.0/manager/NewsServlet?action=list">取消</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
