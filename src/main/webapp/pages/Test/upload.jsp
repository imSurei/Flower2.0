<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<style>
form{
margin: 76px 100px;
}

</style>
</head>

<body>

<%-- 	<form action="<%=path%>:8080/MyFlower2.0/UploadServlet" method="post"
		encType="multipart/form-data">
		userName :<input type="text" name="username"><br> photo:<input
			type="file" name="photo"> <br> <input type="submit"
			value="upload">
	</form> --%>
	
	
	<form id="form-insert" action="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=insert"
			method="post" enctype="multipart/form-data">
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-5 prodId">
				<label for="id" class="form-label">商品編號</label> 
				<input type="text"class="form-control" id="id" name="id"
				value="${requestScope.product.id}" >
			<span class="input-group" id="idError" style="color:red; display:none;">請輸入非零的數字</span> 
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-5 prodName">
				<label for="name" class="form-label">商品名稱</label> <input type="text"
					class="form-control" id="name" name="name"
					value="${requestScope.product.name}" required>
			<span class="input-group" id="nameError" style="color:red; display:none;">名稱需由2～20位任意字符組成</span>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodType">
				<label for="type" class="form-label" style="display:block;">分類</label> 				
				<select id="type" name="type" value="${requestScope.product.type}">
				  <option selected="selected" value="flower">鮮花花束</option>
				  <option value="gift">周邊禮品</option>
				</select>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->			
			<div class="col-md-3 prodSubtype">
				<label for="subtype" class="form-label" style="display:block;">子分類</label> 
				<select id="subtype" name="subtype" value="${requestScope.product.subtype}">
				  <option selected="selected" value="玫瑰">玫瑰</option>
				  <option value="向日葵">向日葵</option>
				  <option value="滿天星">滿天星</option>
				  <option value="巧克力">巧克力</option>
				  <option value="鮮奶蛋糕">鮮奶蛋糕</option>
				  <option value="精美禮品">精美禮品</option>
				</select>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->			
			<div class="col-md-3 prodPlace">
				<label for="place" class="form-label" style="display:block;">產地</label> 
				<select id="place" name="place" value="${requestScope.product.place}">
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
				<label for="price" class="form-label">售價</label> <input type="number" min="0"
					class="form-control" id="price" name="price"
					value="${requestScope.product.price}" required>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodQuantity">
				<label for="quantity" class="form-label">數量</label> 
				<input type="number" min="0" class="form-control" id="quantity" name="quantity"
					value="${requestScope.product.quantity}" required>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodInventory">
				<label for="inventory" class="form-label">庫存</label> 
				<input type="number" min="0" class="form-control" id="inventory" name="inventory"
					value="${requestScope.product.inventory}" required>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-12 prodDescription1">
				<label class="form-label">描述1</label>
				<textarea class="form-control" rows="3" name="info1" id="info1"
					>${requestScope.product.info1}</textarea>
				<div id="product_info1-input-error"  class="input-error">商品描述不能為空</div>	
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-12 prodDescription2">
				<label class="form-label">描述2</label>
				<textarea class="form-control" rows="3" name="info2" id="info2"
					>${requestScope.product.info2}</textarea>
				<div id="product_info2-input-error"  class="input-error">商品描述不能為空</div>	
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 image">
				<p>圖片</p>
				<input type="text" name="imgPath" value="pics/logo/default.jpg"> <span
					style="color: red;">請上傳圖片</span>
			</div>
<!--    ---------------------------------------------------------------------------------------  -->
			<div class="btn-group">
				<button type="submit" id="insertBtn" class="btn btn-primary">新增</button>
				<button type="reset" class="btn btn-primary">重置</button>
				<a class="btn btn-primary" href="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=list">取消</a>
			</div>
		</form>
	
	
	
</body>
</html>