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
<title>商品詳情頁面．Flower Forever</title>
<base href="<%=basePath%>">
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

<link href="css/product_details.css" rel="stylesheet" />
<link rel="icon" href="pics/logo/Icon_Logo.png" />

<script type="text/javascript">

    $(function () {
    	$(".header").load("header.jsp");
    	$(".footer").load("footer.jsp");
    	
    	
    	$(".btn-addcart").click(function(){
    		//label 標籤取值使用 .html()   span 標籤使用.text() or html() 取值
    		var quantity = $("#quantity").text(); 
    		quantity = parseInt(quantity);
    		
    		/* alert($.type(quantity)+" quantity = "+quantity); */
    		
    	   if(quantity <= 0 ){
    			alert("庫存不足，補貨中")
    			return false;
    			
    		} else {
    			
    			var productId = $(this).attr("productId");
        		location.href = "<%=path%>:8080/MyFlower2.0/cartServlet?action=addItem&id="+ productId;
								alert("已加入购物车，感謝您的購買")
							} 
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
				<a href="#">Flower Forever</a>
			</div>
			<!-- 分割線 -->
			<div class="seg"></div>
			<!-- 菜單欄導航 -->
			<div class="nav2">
				<!-- 單個菜單項 -->
				<div class="nav2-menu">
					<!-- 主標題 -->
					<div class="nav2-title" id="allprods">購物商城</div>
					<!-- 子標題 -->
					<div class="nav2-content">
						<a href="<%=path%>:8080/MyFlower2.0/pages/product_index.jsp"
							id="allprods2">所有商品</a> <a
							href="<%=path%>:8080/MyFlower2.0/pages/product_index_flower.jsp"
							id="allflowers">鮮花花束</a> <a
							href="<%=path%>:8080/MyFlower2.0/pages/product_index_gift.jsp"
							id="allgifts">周邊禮品</a>
					</div>
					<div class="seg"></div>
				</div>
				<!--  <div class="nav2-menu"> -->
			</div>
			<!--  <div class="nav2"> -->
		</div>
		<!--  <div class="content-left"> -->
		<div class="content-right">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div id="" class="">
							<div class="imgdiv">
								<img src="${requestScope.product.imgPath}" class="imgbox"
									alt="#">
							</div>
						</div>
					</div>
					<!--------      商品頁面從此開始     ----------->
					<div class="col-md-6 infobox">
						<div class="product-dtl">
							<div class="product-info">
								<div class="product-name">${requestScope.product.name}</div>
								<div class="reviews-counter">
									<span>商品編號: ${requestScope.product.id}</span><span>分類:${requestScope.product.subtype}</span><span>優惠價</span>
									<span class="product-price-discount">NT
										${requestScope.product.price} 元</span>
								</div>
								<p class="info1">${requestScope.product.info1}</p>
								<p class="info2">${requestScope.product.info2}</p>
								<div class="product-count">
									<label for="size" class="qtytext1">剩餘數量：<span id="quantity">${requestScope.product.quantity}</span></label>

									<!-- <div class="display-flex">
										<label for="size" class="qtytext2">數量</label>
										<div class="qtyminus">-</div>
										<input type="text" name="product_quantity" value="1"
											class="qty">
										<div class="qtyplus">+</div>
									</div> -->
									<div class="display-flex">
										<%-- <input type="submit" class="round-black-btn btn-addcart" value="加入購物車"/> --%>
										<button class="round-black-btn btn-addcart insertBtn"
											productId="${requestScope.product.id}">加入購物車</button>
										<!-- <button  class="round-black-btn btn-addcart" onclick="insert()" value="">加入購物車</button> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 				-----------------運送說明-------------------                    -->
			<div class="warnning">
				<dl>
					<dt></dt>
					<dd></dd>
					<dt>送貨方式：</dt>
					<dd>
						透過宅配送達。除網頁另有特別標示外，均為常溫配送。<br>消費者訂購之商品若經配送兩次無法送達，再經本公司以電話與Email均無法聯繫逾三天者，本公司將取消該筆訂單，並且全額退款。
					</dd>
					<dt>送貨範圍：</dt>
					<dd>
						限台灣本島與離島地區<span class="s_parenthesis">註</span>，部分離島地區<span
							class="s_parenthesis">包括連江<span class="s_parenthesis">馬祖</span>、綠島、蘭嶼、琉球鄉等貨件。
						</span>注意！收件地址請勿為郵政信箱。<br> <span class="s_parenthesis">註：離島地區將送至到岸船公司碼頭，需請收貨人自行至碼頭取貨。</span>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<hr />
	<div class="footer"></div>
</body>
</html>