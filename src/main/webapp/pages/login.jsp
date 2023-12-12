<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
StringBuffer basePath = request.getRequestURL();
String path = request.getScheme() + "://" + request.getServerName();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員登入．Flower Forever</title>
<base href="<%=basePath%>">

<link rel="icon" href="pics/logo/Icon_Logo.png" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!-- Google Login API-Start -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="1030132111174-it3lsbndt9981bcucrt2hi2e613hekj6.apps.googleusercontent.com">

<script>
	$(function() {

		$("#loginBtn").click(function() {

			// 驗證帳號
			var account = $("#account").val();
			var accountPatt = /^\w{3,15}$/;
			// 正則.test方法
			if (!accountPatt.test(account)) {
				$("#accountError").show();
				return false; // 頁面不要跳轉
			};
			$("#accountError").hide();

			// 驗證密碼
			var pwd = $("#password").val();
			var pwdPatt = /^\w{3,15}$/;
			// 正則.test方法
			if (!pwdPatt.test(pwd)) {
				$("#passwordError").show();
				return false; // 頁面不要跳轉
			};
			$("#passwordError").hide();

		});
	})
</script>

<style>
.container, .container-lg, .container-md, .container-sm, .container-xl {
	max-width: 100%;
}

.container {
	background-image: url("pics/loginPics/loginbg.jpg");
	background-position: 90% 5%;
	height: 800px;
	display: flex;
	justify-content: center;
}

.row1 {
	display: flex;
	justify-content: flex-end;
}

.loginbox {
	width: 500px;
	height: 500px;
	margin-left: 900px;
}

.btn .btn-primary {
	width: 10px;
	margin: 0 10px 0 10px;
}

.btn {
	background: #ebece6;
	border: 1px #b2bec3 solid;
	font-size: 18px;
	font-weight: bold;
}

.btn:hover {
	background: #95a5a6;
	color: #ecf0f1;
}

.row {
	justify-content: space-evenly;
}

.forget {
	display: flex;
	justify-content: center;
	font-size: 20px;
	color: black;
	background-color: rgba(255, 255, 255, 0.5);
	text-decoration: none;
	width: 100%;
}

label {
	font-size: 20px;
	margin: 10px 0px 10px;
}

/* 會員登入和頁面頂不的間距 */
.text-center {
	padding-top: 200px;
	font-weight: bold;
}

/* 會員登入和輸入欄的間距 */
.form-group {
	margin-top: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="loginbox">
			<h1 class="text-center">會員登入</h1>
			<form action="<%=path%>:8080/MyFlower2.0/manager/UserServlet" method="POST">
				<input type="hidden" name="action" value="login">
				<div class="form-group">
					<label for="account">帳號</label> 
					<input type="text" name="account" id="account" class="form-control"
						value="${ requestScope.account }"required> 
						<span class="input-group" id="accountError"
						style="color: red; display: none;">帳號需由3～15位字母、數字或下畫線組成</span> <label
						for="password">密碼</label> <input type="password" name="password"
						id="password" class="form-control" required> <span
						class="input-group" id="passwordError"
						style="color: red; display: none;">帳號需由3～15位字母、數字或下畫線組成</span> <span
						class="input-group" style="color: red;">${ requestScope.msg }</span>
				</div>

				<div class="row p-3 ">
					<button id="loginBtn" class="btn col-3 " type="submit">登入</button>
					<a href="register.jsp" class="btn col-3">註冊</a> 
				    <!-- <a href="forgetPassword.jsp" class="btn col-3">忘記密碼</a> -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>