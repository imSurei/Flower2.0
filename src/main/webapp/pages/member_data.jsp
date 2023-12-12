<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
StringBuffer basePath = request.getRequestURL();
String path = request.getScheme() + "://" + request.getServerName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員基本資料．Flower Forever</title>
<base href="<%=basePath%>">

<link rel="icon" href="pics/logo/Icon_Logo.png" />
<!-- Bootstrap -->
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

<link href="css/memberData.css" rel="stylesheet" />

<script>
$(function () {
	$(".header").load("header.jsp");
	$(".footer").load("footer.jsp");
	
	$(".submitBtn").click(function() {
		
		// 驗證姓名
		var name = $("#name").val();
		var namePatt = /^\w{2,15}$/;
		// 正則.test方法
		if(!namePatt.test(name)){	
			$("#nameError").show();
			return false; // 頁面不要跳轉
		};
		$("#nameError").hide();
		
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
		
		alert("修改成功！")
	});
});
</script>

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
					<div class="nav2-content">
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
			<div class="container">
			<h3 class="mx-auto text-center titleinfo">變更個人資料</h3>
				<div class="d-flex justify-content-center">
					<form id="dataform"
						action="<%=path %>:8080/MyFlower2.0/manager/UserServlet?action=updateData"
						method="post">
						<input type="hidden" name="id" value="${ sessionScope.member.id }">
						<label> 姓名 <input type="text" id="name" class="inputbox"
							name="name" value="${ sessionScope.member.name }" required>
							<span class="input-group" id="nameError" style="color:red;display:none;">姓名需由2～15位字母、數字或下畫線組成</span>	
						</label> <br>
							
						 <label> 帳號 <input type="text" id="account"
							class="inputbox" name="account" value="${ sessionScope.member.account }" required>
							<span class="input-group" id="accountError" style="color:red; display:none;">帳號需由3～15位字母、數字或下畫線組成</span>
						</label> <br> 
						
						<label> 密碼 <input type="password" id="password"
							class="inputbox" name="password" value="${ sessionScope.member.password }" required>
							<span class="input-group" id="passwordError" style="color:red;display:none;">密碼需由3～15位字母、數字或下畫線組成</span>
						</label> <br> 
						
						<label> 信箱 <input type="email" id="email"
							class="inputbox" name="email" value="${ sessionScope.member.email }" required>
							<span class="input-group" id="emailError" style="color:red;display:none;">email格式不合法</span>
						</label> <br> 
						
						<label> 生日 <input type="date" id="birthDate"
							class="inputbox" name="birthDate" value="${ sessionScope.member.birthDate }" required>
						</label> <br> 
						
						<label class="genderlabel"> 性別 <input
							type="radio" name="gender" class="gender" value="man"> 男
							<input type="radio" name="gender" class="gender" value="woman">
							女
						</label> <br> 
						
						<label> 地址 <input type="text" id="address"
							class="inputbox" name="address" value="${ sessionScope.member.address }" required>
							<span class="input-group" id="addressError" style="color:red;display:none;">住址需由3～20位任意字符組成</span>
						</label> <br> 
						
						<label> 電話 <input type="text" id="phone"
							class="inputbox" name="phone" value="${ sessionScope.member.phone }" required>
							<span class="input-group" id="phoneError" style="color:red;display:none;">手機號碼需為09開頭的10位數字</span>
						</label> <br> 
						<input type="hidden" name="status" value="member">
					<!-- 	<input type="submit" class="submit-btn" > -->
						<div style="text-align:center"><button type="submit" class="btn btn-primary submitBtn">提交</button></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<hr>
<div class="footer"></div>
</body>
</html>