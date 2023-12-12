<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員註冊．Flower Forever</title>
<base href="<%=basePath %>">

<link rel="icon" href="pics/logo/Icon_Logo.png" />

<!-- 相對路徑是正確的，但web-inf這個文件夾不公開？ -->
<!--  <script src="../WEB-INF/lib/jquery-3.6.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

<script>

	$(function() {
		
		$("#sub_btn").click(function() {
			
			// 驗證帳號
			var account = $("#account").val();
			var accountPatt = /^\w{3,15}$/;
			// 正則.test方法
			if(!accountPatt.test(account)){	
				$("#accountError").show();
				return false; // 頁面不要跳轉
			};
			$("#accountError").hide();
			
			// 驗證密碼
			var pwd = $("#password").val();
			var pwdPatt = /^\w{3,15}$/;
			// 正則.test方法
			if(!pwdPatt.test(pwd)){	
				$("#passwordError").show();
				return false; // 頁面不要跳轉
			};
			$("#passwordError").hide();
			
			// 驗證姓名
			var name = $("#name").val();
			var namePatt = /^\w{2,15}$/;
			// 正則.test方法
			if(!namePatt.test(name)){	
				$("#nameError").show();
				return false; // 頁面不要跳轉
			};
			$("#nameError").hide();
			
			// 驗證郵箱
			var email = $("#email").val();
			var emailPatt = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			// 正則.test方法
			if(!emailPatt.test(email)){	
				$("#emailError").show();
				return false; // 頁面不要跳轉
			};
			$("#emailError").hide();
			
			// 驗證住址
			var address = $("#address").val();
			var addressPatt = /^.{3,20}$/;
			// 正則.test方法
			if(!addressPatt.test(address)){	
				$("#addressError").show();
				return false; // 頁面不要跳轉
			};
			$("#addressError").hide();
			
			// 驗證手機
			var phone = $("#phone").val();
			var phonePatt = /^09[0-9]{8}$/;
			// 正則.test方法
			if(!phonePatt.test(phone)){	
				$("#phoneError").show();
				return false; // 頁面不要跳轉
			};
			$("#phoneError").hide();
		});
	});
</script>
</head>

<body>
	 <header>
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light fixed-top ps-3">
			<div class="container-fluid">
				<a class="navbar-brand"
					href="<%=path %>:8080/MyFlower2.0/pages/index.jsp"><img
					style="width: 70px" src="/MyFlower2.0/pages/pics/indexPics/Logo.png"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							href="<%=path %>:8080/MyFlower2.0/pages/index.jsp">首頁</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							href="<%=path %>:8080/MyFlower2.0/pages/news.jsp">最新消息</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-dark" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> 商品 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/product_index.jsp">所有商品</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/product_index_flower.jsp">花束系列</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/product_index_gift.jsp">禮品系列</a>
								</li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-dark" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> 聯絡我們 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/contact.jsp">客服</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/contactInfo.jsp">聯絡資訊</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/contactReturned.jsp">退換貨政策</a>
								</li>
								<li><a class="dropdown-item"
									href="<%=path %>:8080/MyFlower2.0/pages/contactPrivacy.jsp">隱私權政策</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="container mt-5">
		<div class="row">
			<div class="col-10">
				<div style="width: 60%; margin: 0 auto; padding:0">
					<h2 class="text-center">新增會員</h2>

					<!-- 用絕對路徑  -->
					<form action="<%=path %>:8080/MyFlower2.0/manager/UserServlet" class="mb-5" method="POST">
					<input type="hidden" name="action" value="insert">

						<div class="form-group">
							<label for="account">帳號</label> 
							<input type="text" name="account" id="account" class="form-control" required>
							<span class="input-group" id="accountError" style="color:red; display:none;">帳號需由3～15位字母、數字或下畫線組成</span>
							<span class="input-group" style="color:red;">${ requestScope.msg }</span>
											
							<label for="password">密碼</label> 
							<input type="password" name="password" id="password" class="form-control" required>
							<span class="input-group" id="passwordError" style="color:red;display:none;">密碼需由3～15位字母、數字或下畫線組成</span>
						</div>

						<div class="form-group">
							<label for="name">姓名</label> 
							<input type="text" name="name" id="name" class="form-control" 
							value="${ requestScope.name }"required>
							<span class="input-group" id="nameError" style="color:red;display:none;">姓名需由2～15位字母、數字或下畫線組成</span>
						</div>

						<div class="form-group">
							<label for="birthDate">出生日期</label><br> <input type="Date"
								name="birthDate" id="birthDate" class="form-control" 
								value="${ requestScope.birthDate }"required>
						</div>

						<div class="form-group">
							<div class="form-check-inline">
								<h6 class="inline">性別</h6>
							</div>
							<div class="form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="gender" value="male">男
								</label>
							</div>

							<div class="form-group form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="gender" value="female">女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="email">電子信箱</label> <input type="email" name="email"
								id="email" class="form-control" 
								value="${ requestScope.email }"required>
							<span class="input-group" id="emailError" style="color:red;display:none;">email格式不合法</span>
						</div>

						<div class="form-group">
							<label for="address">住址</label> <input type="text" name="address"
								id="address" class="form-control" 
								value="${ requestScope.address }"required>
							<span class="input-group" id="addressError" style="color:red;display:none;">住址需由3～20位任意字符組成</span>
						</div>

						<div class="form-group">
							<label for="phone">手機號碼</label> <input type="text" name="phone"
								id="phone" class="form-control" 
								value="${ requestScope.phone }"required>
							<span class="input-group" id="phoneError" style="color:red;display:none;">手機號碼需為09開頭的10位數字</span>
						</div>

						<input type="hidden" name="status" value="member">
						
						<div class="btn-group">
							<button type="submit" id="insertBtn" class="btn btn-primary">新增</button>
							<button type="reset" class="btn btn-primary">重置</button>
							<a class="btn btn-primary" href="<%=path %>:8080/MyFlower2.0/manager/UserServlet?action=list">取消</a>
			            </div>
					</form>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>
