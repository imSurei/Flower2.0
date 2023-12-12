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
<title>忘記密碼．Flower Forever</title>
<base href="<%=basePath%>">

<link rel="icon" href="pics/logo/Icon_Logo.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<Script>
	function checkEmailRight() {

		let account = $("#account").val();
		let email = $("#email").val();
		alert(account+email);
		if (account == '' || email == '') {
			alert("請輸入完整帳號與信箱:)");
			return false;
		}
		if (!ValidateEmail(email)) {
			console.log("Email格式錯誤");
			return false;
		}
		
		const url = "<%=path%>:8080/MyFlower2.0/SendPasswordMail?&account="+ account + "&email=" + email;
		/* const url = `http://localhost:8080/IIIProject/SendPasswordMail?account=${account}&email=${email}`; */
		fetch(url, {
			method : 'GET'
		}).then(function(msg) {
			return msg.text();
		}).then(function(res) {
			if (res.includes('Success')) {
				let memberMail = res.split(",")[1];
				let memberPassword = res.split(",")[2];

				let mailTitil = "忘記密碼";
				let mailBody = "你的密碼是: " + memberPassword
				sendPassWordMail(memberMail, mailTitil, mailBody); //send mail
				return true;
			};
		}).then(function(e) {
			if (e == true) {
				// window.location = "login.html";
			} else {
				console.log("失敗!")
				alert("帳號與郵件驗證失敗!!!");
			}
		})

	}

	function ValidateEmail(mail) {
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
			return (true)
		}
		alert("Email格式錯誤!!!");
		return (false)
	}

	function sendPassWordMail(mailParameter, titleParameter, bodyParameter) {
		let url = "https://script.google.com/macros/s/AKfycbww7PuOIEu6FZjNxRQixLorSrN_Jq4prJ9TgloHnjGwSMcHw0t4wYMXDk23j5SIZuTR/exec";

		let mailText = mailParameter;
		let titleText = titleParameter;
		let bodyText = bodyParameter;
		$.post(url, {
			mail : mailText,
			title : titleText,
			body : bodyText
		});
		alert("密碼已寄送至您的信箱!");
		console.log("發送mail");
	}

	$(function() {
		// $("label").css("width", "300px")
		// $("label").addClass("text-right");
		// $("input").css("width", "300px");

		$("input[type='submit']").click(function() {
			checkEmailRight();
		})

	})
</Script>

<style>
h3 {
	margin-top: 20px;
}

.row {
	width: 400px;
	background: #74b9ff;
}

label {
	display: flex;
	align-items: center;
}

.inputbox {
	width: 300px;
}

.buttonbox {
	margin-top: 30px;
	display: flex;
	padding: 0 10px;
}

.d-flex {
	margin: 100px auto;
}
</style>
</head>

<body>
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<h3>忘記密碼</h3>
			<form id="hiddenForm" action="" method="POST" class="mt-4">
				<!-- <input type="hidden" name="action" value="forgetPwd"> -->
				<label> 帳號 <input type="text" id="account" name="account"
					style="margin-left: 10px;" class="inputbox" value="" required>
				</label> <label> 信箱 <input type="email" id="email" name="email"
					style="margin-left: 10px;" class="inputbox" value="" required>
				</label>
				<div class="buttonbox">
					<label for=""> <!-- <input type="submit" value="送出" style="margin:50px 0px 10px;" onclick="return false;"> -->
						<input type="submit" value="送出" style="margin-left: 115px;"
						onclick="return false;">
					</label> <label for=""> <!-- <input type="button" value="返回" style="margin:0 auto;" onclick="location.href='login.html'"> -->
						<input type="button" value="返回" style="margin-left: 20px;"
						onclick="location.href='login.jsp'">
					</label>
				</div>
			</form>
		</div>
	</div>
</body>
</html>