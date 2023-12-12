<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增資料．Flower Forever</title>
<base href="<%=basePath %>">

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
<link rel="icon" href="pics/logo/Icon_Logo.png" />  
<style>
/*---------- Header Area 此處有改原稿的43------------*/
.navbar-brand img {
	width: 42px;
}

.main {
	width: 1200px;
	margin: 60px auto;
}
/* ------------- */
.prodId {
	float: left;
}

.prodName {
	float: right;
}
/* ------------- */
.prodType {
	float: left;
}

.prodType #type{
width:300px;
height:36px;
}

.prodSubtype {
	float: left;
	margin-left: 150px;
}
.prodSubtype #subtype{
width:300px;
height:36px;
}
.prodPlace {
	float: left;
	margin-left: 150px;
}

.prodPlace #place{
width:300px;
height:36px;
}
/* ------------- */
.prodPrice {
	float: left;
}

.prodQuantity {
	float: left;
	margin-left: 150px;
}

.prodInventory {
	float: left;
	margin-left: 150px;
}
/* ------------- */
.prodDescription1 {
	float: left;
}

.prodDescription2 {
	float: left;
}
/* ------------- */
.btn-group {
	margin-left: 500px;
	margin-top: 30px;
	float: left;
}

.btn {
	margin-right: 20px;
}
.image p {
margin:20px 0 10px 0;
}

#form-insert>div {
	margin-top: 15px;
}

.input-error{
color:red;
display:none; 
}
</style>

<script>

$(function(){
	
	$(".header").load("header.jsp");
	$(".footer").load("footer.jsp");
	
	// 表單驗證
	$("#insertBtn").click(function(){
		
		// 驗證id
		var id = $("#id").val(); 
	 	var idPatt = /^[1-9]\d*$/;
		// 正則.test方法
		if(!idPatt.test(id)){	
			$("#idError").show();
			return false; // 頁面不要跳轉
		};
		$("#idError").hide();  
		
		if (!id && id != 0) { // 如果id為空，則賦值null
			id = null;
		}; 
		
		// 驗證商品名稱
		var name = $("#name").val();
		var namePatt = /^.{2,20}$/;
		// 正則.test方法
		if(!namePatt.test(name)){	
			$("#nameError").show();
			return false; // 頁面不要跳轉
		};
		$("#nameError").hide();
		
	});


	$("#info1").on('blur', function() { // info1
		var val = $(this).val();
		var real = $.trim(val);

		if (!real && real !== 0) {
			$("#product_info1-input-error").show();
			$("#insertBtn").attr("disabled", true);
		}

		else {
			$("#product_info1-input-error").hide();
			$("#insertBtn").attr("disabled", false);
		}

	});

	$("#info2").on('blur', function() { // info2
		var val = $(this).val();
		var real = $.trim(val);

		if (!real && real !== 0) {
			$("#product_info2-input-error").show();
			$("#insertBtn").attr("disabled", true);
		}

		else {
			$("#product_info2-input-error").hide();
			$("#insertBtn").attr("disabled", false);
		}
	});
});
</script>

</head>

<body style="background-color: #f5f6fa">
   <div class="header"></div>

	<br />
	<h1>111</h1>
	<!-- 調整跳板 -->

	<div class="main">
		<h2>商品管理</h2>
		<hr>
		<h2 style="color: blue;">新增商品</h2>
		<!-- 隱藏向servlet提交請求 -->
		<form id="form-insert" action="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=insert"
			method="post" enctype="multipart/form-data">
		 <!-- 	<input type="hidden" name="action" value="insert" />  -->
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-5 prodId">
				<label for="id" class="form-label">商品編號</label> 
				<input type="number" class="form-control" id="id" name="id">
			  <!--   <div id="product_id-input-error" class="input-error">不能為空且只能為數字</div>	 -->
			<span class="input-group" id="idError" style="color:red; display:none;">請輸入非零的數字</span> 
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-5 prodName">
				<label for="name" class="form-label">商品名稱</label> 
				<input type="text" class="form-control" id="name" name="name" required>
				<!-- <div id="product_name-input-error"  class="input-error">商品名稱不能為空</div>	 -->
			<span class="input-group" id="nameError" style="color:red; display:none;">名稱需由2～20位任意字符組成</span>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodType">
				<label for="type" class="form-label" style="display:block;">分類</label> 				
				<select id="type" name="type">
				  <option selected="selected" value="flower">鮮花花束</option>
				  <option value="gift">周邊禮品</option>
				</select>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->			
			<div class="col-md-3 prodSubtype">
				<label for="subtype" class="form-label" style="display:block;">子分類</label> 
				<select id="subtype" name="subtype">
				  <option selected="selected" value="玫瑰">玫瑰</option>
				  <option value="向日葵">向日葵</option>
				  <option value="滿天星">滿天星</option>
				   <option value="百合">百合</option>
				  <option value="巧克力">巧克力</option>
				  <option value="鮮奶蛋糕">鮮奶蛋糕</option>
				  <option value="精美禮品">精美禮品</option>
				</select>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->			
			<div class="col-md-3 prodPlace">
				<label for="place" class="form-label" style="display:block;">產地</label> 
				<select id="place" name="place">
				  <option selected="selected" value="台北市">台北市</option>
				  <option value="新北市">新北市</option>
				  <option value="桃園市">桃園市</option>
				  <option value="臺中市">臺中市</option>
				  <option value="臺南市">臺南市</option>
				  <option value="高雄市">高雄市</option>
				  <option value="基隆市">基隆市</option>
				  <option value="新竹市">新竹市</option>
				  <option value="嘉義市">嘉義市</option>
				</select>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodPrice">
				<label for="price" class="form-label">售價</label> 
				<input type="number" min="0" class="form-control" id="price" name="price" required>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodQuantity">
				<label for="quantity" class="form-label">數量</label> 
				<input type="number" min="0" class="form-control" id="quantity" name="quantity" required>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodInventory">
				<label for="inventory" class="form-label">庫存</label> 
				<input type="number" min="0" class="form-control" id="inventory" name="inventory" required>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-12 prodDescription1">
				<label class="form-label">描述1</label>
				<textarea class="form-control" rows="3" name="info1" id="info1"></textarea>
				<div id="product_info1-input-error"  class="input-error">商品描述不能為空</div>	
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-12 prodDescription2">
				<label class="form-label">描述2</label>
				<textarea class="form-control" rows="3" name="info2" id="info2"></textarea>
				<div id="product_info2-input-error"  class="input-error">商品描述不能為空</div>	
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 image">
				<p>圖片</p>
			    <input type="file" name="imgPath" >
				<span style="color: red;">請上傳圖片</span>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="btn-group">
				<button type="submit" id="insertBtn" class="btn btn-primary">新增</button>
				<button type="reset" class="btn btn-primary">重置</button>
				<a class="btn btn-primary" href="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=list">取消</a>
			</div>
		</form>
	</div>
	<br />
	<hr />
	<div class="footer"></div>
</body>
</html>