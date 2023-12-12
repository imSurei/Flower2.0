<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
StringBuffer basePath = request.getRequestURL();
String path = request.getScheme() + "://" + request.getServerName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>購物車．Flower Forever</title>
<base href="<%=basePath%>">
<%-- 網站圖標 --%>
<link rel="icon" href="pics/logo/Icon_Logo.png" />

<!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%--bootstrap連結--%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<%--加入shopping_cart樣式表--%>
<link href="css/shopping_cart.css" rel="stylesheet" />


<script>
	$(function() {
	
		$(".header").load("header.jsp");
		$(".footer").load("footer.jsp");
		
	
		$("a.deleteItem").click(function(){
			return confirm("確定要刪除該商品？");
		});
		
		$(".clearCart").click(function(){
		   if(confirm("確定要清空購物車？")){
			   location.href = "<%=path%>:8080/MyFlower2.0/cartServlet?action=clearCart";
		   }  else {
			   return false;
		   }
		}); 
		
		$(".updateCount").change(function(){
			var count = parseInt(this.value);
			var id = $(this).attr("productId");
			var quantity = parseInt($(this).attr("productQuantity"));
			/* alert(typeof(count )+typeof(quantity )+"quantity = "+quantity+"; count = "+count);  */
			
			if(count <= 0 ){
				alert("購買數量輸入無效，請重新輸入");
				this.value = this.defaultValue;	
			}else if(count > quantity){
				alert("該商品庫存不足，請重新修改購買數量");
				this.value = this.defaultValue;	
			}else if(confirm("確定要將數量修改為"+count+"?")){
				
				/* var unitprice = parseInt($(".unitprice").html());
				alert(typeof(unitprice)+" === "+unitprice);
				
				$(".totalNums").html(unitprice*count);
				$("#totalProdNum").html(count);
				$("#totalMoneyNum").html(22); */
				
			    location.href = "<%=path%>:8080/MyFlower2.0/cartServlet?action=updateCount&count="+count+"&id="+id; 
				}  else {
					this.value = this.defaultValue;	
			} 
		})
})			
</script>

</head>
<body>
	<div class="header"></div>

	<c:choose>
		<%--尚未登入會員，按購物車按鈕時 --%>
		<c:when test='${empty sessionScope.member }'>
			<div class="offset-1 col-10">
				<%--購物車進度條--%>
				<div class="container mt-100 mb-5 text-center">
					<div class="row">
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 fw-bold">購物</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 text-black-50">填寫資料</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 text-black-50">付款</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="d-inline-block h5 text-black-50">訂單成立</div>
						</div>
					</div>
				</div>

				<%--會員登入圖案--%>
				<div id="nullShopping">
					<img src="pics/cartPics/user.png" class="rounded mx-auto d-block"
						style="width: 11%;" />
				</div>

				<%--會員登入 文字--%>
				<div class="text-center h5 fw-bold m-1">
					<p>尚未登入會員</p>
				</div>


				<div class="container">
					<div class="row">
						<%-- 會員登入 按鈕 --%>
						<div class="offset-3 col-md-3">
							<div id="regeisterBtn" class="text-center">
								<input id="regeisterBtn1" type="submit" name="submit"
									class="w-100 text-center fw-bold border-0 h5 lh-base"
									value="會員登入" onclick=location.href="login.jsp">
							</div>
						</div>
						<%-- 立即註冊 按鈕 --%>
						<div class="col-md-3">
							<div id="loginBtn" class="text-center">
								<input id="loginBtn1" type="submit" name="submit"
									class="w-100 text-center fw-bold border-0 h5 lh-base"
									value="立即註冊" onclick=location.href="register.jsp">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:when>


		<%-- 若購物車是空的，則顯示此頁面 --%>
		<c:when test="${empty sessionScope.cart.cartItemsMap }">
			<div class="offset-1 col-10">
				<%--購物車進度條--%>
				<div class="container mt-100 mb-5 text-center">
					<div class="row">
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 fw-bold">購物</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 text-black-50">填寫資料</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 text-black-50">付款</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="d-inline-block h5 text-black-50">訂單成立</div>
						</div>
					</div>
				</div>


				<%--購物車圖案--%>
				<div id="nullShopping">
					<img src="pics/cartPics/nullShoppingCart.png"
						class="rounded mx-auto d-block" style="width: 10%;" />
				</div>

				<%--購物車是空的 文字--%>
				<div class="text-center h5 fw-bold m-3">
					<p>購物車是空的</p>
				</div>

				<%-- 繼續購物 按鈕 --%>
				<div id="continueShop" class="text-center p-3 mt-4 mb-4">
					<input id="continueShopBtn" type="submit" name="submit"
						class="w-50 fw-bold border-0 h5 lh-base" value="繼續購物"
						onclick=location.href="product_index.jsp">
				</div>
			</div>
		</c:when>


		<%-- 若購物車有東西，則顯示此頁面 --%>
		<c:when test="${ sessionScope.cart != null}">
			<div class="offset-1 col-10">

				<%--購物車進度條--%>
				<div class="container mt-100 mb-5 text-center">
					<div class="row">
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 fw-bold">購物</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 text-black-50">填寫資料</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 text-black-50">付款</div>
							<span class="col-6 ">></span>
						</div>
						<div class="col-md-3">
							<div class="d-inline-block h5 text-black-50">訂單成立</div>
						</div>
					</div>
				</div>



				<%--購物車 文字--%>
				<div class="container mb-4">
					<div id="shoppingCart"
						class="row align-items-center pt-2 pb-2 m-0 bg-secondary text-light w-100">
						<div class="w-10 d-inline-block text-center h4 m-0">購物車</div>
					</div>

					<%--購物車清單 欄位名稱--%>
					<div id="shoppingCartName"
						class="row align-items-center pt-2 pb-2 w-100">
						<div class="w-10 d-inline-block text-center h5 m-0">
							<!-- <input type="checkbox" id="selectAll" value="全選" style="width:15px; height:15px" /> -->
							商品編號
						</div>
						<div class="w-25 d-inline-block text-center h5 m-0">商品</div>
						<%-- *****合併更改********************************************************************************************************** --%>
						<div class="w-25 d-inline-block text-center h5 m-0">描述</div>
						<div class="w-10 d-inline-block text-center h5 m-0">單價</div>
						<div class="w-10 d-inline-block text-center h5 m-0">數量</div>
						<div class="w-10 d-inline-block text-center h5 m-0">小計</div>
						<div class="w-10 d-inline-block text-center h5 m-0"></div>
					</div>
					<hr />


					<%--購物車清單--%>
					<div id="proTotal">
						<c:forEach items="${sessionScope.cart.cartItemsMap}" var="entry">
							<div id="${entry.value.id}"
								class="productItem row align-items-center m-0 mb-2">
								<%-- 商品單選紐 --%>
								<div class="w-10 d-inline-block mh-100"
									style="word-break: break-all;">
									<div class="text-left ellipsis">${entry.value.id}</div>
									<!-- <input name='Checkbox[]' type="checkbox" class="selectItem " value="單選" style="width:15px; height:15px" /> -->
								</div>
								<%-- 圖片位置 --%>
								<%-- *****合併更改********************************************************************************************************** --%>
								<div class="w-10 d-inline-block  mh-100"
									style="overflow: hidden;">
									<img src="${entry.value.imgPath}"
										style="height: 100px; object-fit: cover" />
								</div>
								<%-- 產品名稱 --%>
								<div class="w-15 d-inline-block mh-100"
									style="word-break: break-all;">
									<div class="text-left ellipsis">${entry.value.name}</div>
								</div>
								<%-- 商品資訊1 --%>
								<%-- *****合併更改********************************************************************************************************** --%>
								<div class="w-25 d-inline-block mh-100"
									style="word-break: break-all;">
									<div class="text-left ellipsis">${entry.value.info}</div>
								</div>
								<%-- 單價 --%>
								<div class="w-10 d-inline-block text-center mh-100 unitprice"
									style="word-break: break-all">${entry.value.price}</div>
								<%-- 數量+選紐 --%>
								<div
									class="w-10 d-inline-block text-center mh-100 p-0 container">
									<div class="text-center row amountBtn">
										<!-- <div class="d-inline-block col-lg p-0 border border-secondary border-1 amountBox subBtn">-</div> -->
										<!-- <div class="d-inline-block col-lg p-0  border-secondary border-1"> -->
										<input type="text" value="${entry.value.count}"
											class="w-50 text-center border border-primary rounded updateCount"
											style="margin: 0 auto;" productId="${entry.value.id}"
											productQuantity="${entry.value.quantity}">
										<!-- </div> -->
										<!-- <div class="d-inline-block col-lg p-0 border border-secondary border-1 amountBox addBtn">+</div> -->
									</div>
								</div>

								<%-- 小計 --%>
								<div class="w-10 d-inline-block text-center mh-100 totalNums">
									${entry.value.totalPrice}</div>
								<%-- 移除商品 --%>
								<div class="w-10 d-inline-block text-center mh-100 removePro">
									<a class="deleteItem" style="text-decoration: none;"
										href="<%=path %>:8080/MyFlower2.0/cartServlet?action=deleteItem&id=${entry.value.id}&quantity=${entry.value.quantity}">移除</a>
								</div>
							</div>
						</c:forEach>
					</div>

					<%-- <span style="color:red;margin-left:750px;">${requestScope.msg }</span> --%>
					<hr />

					<%--小提醒文字+合計文字--%>
					<div id="discount" class="row align-items-center pt-2 m-0">
						<div class="w-10 d-inline-block h5 m-0 text-center p-2 fw-bold"
							style="background-color: rgb(255 227 243/ 0.90)">小提醒</div>
						<div class="w-60 d-inline-block h5 m-0">本店亦提供店取服務，請來電告知取貨時間</div>
						<div id="total" class="w-10 d-inline-block h5 m-0 text-center">
							合計</div>
						<div id="totalMoney" class="w-20 d-inline-block h5 m-0 text-end">
							<span id="totalProdNum">${ sessionScope.cart.totalCount }</span>件商品/ 
							NT$ <span id="totalMoneyNum"> ${ sessionScope.cart.totalPrice }</span>
						</div>
					</div>
					<div id="discount" class="row align-items-center pb-2 m-0">
						<div class="w-10 d-inline-block m-0 p-2"></div>
						<div class="w-60 d-inline-block h5 m-0">為確保花材新鮮，取貨日期僅提供未來一個月</div>
					</div>


					<%--繼續購物和結帳按鈕--%>

					<div class="row justify-content-end pt-2 pb-2 m-0 ">
						<div class="w-15 text-center">
							<%--  <a type="button" class="clearCart fw-bold border-0 h4 m-0 p-0 w-100" href="<%=path %>:8080/MyFlower2.0/cartServlet?action=clearCart">清空購物車</a> --%>
							<input type="button"
								class="clearCart fw-bold border-0 h4 m-0 p-0 w-100"
								value="清空購物車">
						</div>
						<div class="w-15 text-center">
							<input type="submit" name="submit"
								class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100"
								value="繼續購物" onclick=location.href="product_index.jsp">
						</div>
						<div class="w-15 text-end">
							<input class="nextBtn fw-bold border-0 h4 m-0 p-0 w-100"
								type="button" value="結帳" onclick=location.href="cartStep2.jsp">
						</div>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>

	<%--footer--%>
	<hr />
	<div class="footer"></div>
</body>
</html>