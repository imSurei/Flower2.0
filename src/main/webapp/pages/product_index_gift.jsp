<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>周邊禮品．Flower Forever</title>
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

<script src="http://localhost:8080/IIIProject/js/checkLoginCookie.js"></script>
    
<link rel="icon" href="pics/logo/Icon_Logo.png" />

<link href="css/product_index_gift.css" rel="stylesheet" />


<script type="text/javascript">

	$(function() {
		
		$(".header").load("header.jsp");
		$(".footer").load("footer.jsp");
				
// ---------------------- 跳轉到index_flower首頁，即加載所有周邊禮品 ------------------------------  
		
	$("#prods-content").empty();
		$.ajax({url:"/MyFlower2.0/Allproducts"	
		}).done(function(json){
			console.log(json);
			 let ln = json.length;
           	 let tableString = "";
           	 
        		for (i = 0; i < ln; i++) {           			
           			if(json[i].type == "gift"){
           				tableString +=  '<a href="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=getProduct2&id='+ json[i].id +'">'
    	                +'<div class="prod-content-2" style="display: inline-block;width: 240px;height: 380px;background-color: #ecf0f1;margin:30px;">'
    	                +'<div class="prod-content-2-img"> <img style="width:240px;height:240px;"src="'+json[i].imgPath+'"></div>'
    	                +'<div class="prod-content-2-title" style="color:black; font-size:20px; font-weight:600; line-height:50px;margin-left:10px;">'+ json[i].name +'</div>'
    	                +'<div class="prod-content-2-price" style="color:red;font-size:20px; font-weight:600;margin-left:10px;">'+'$NT '+json[i].price +'</div>'
    	                +'<div class="prod-content-2-quantity" style="display:inline-block; color:#2c3e50; font-size:15px;line-height:50px;margin-left:10px;">'+'商品數量：'+json[i].quantity +'</div>'
    	                +'</div></a>';		          
           			}   
           		}
           	
           		let title = '<div class="prods-content-title"><p>周邊禮品</p><div class="seg2"></div></div>';
               	let totalString = title + tableString;
                     	
            $("#prods-content").append(totalString);
            console.log(tableString);
		});
		
// ---------------------- 點擊 購物商城 加載所有商品 ------------------------------ 		
		
		$("#allprods").click(function(){
 			$("#prods-content").empty();
			$.ajax({url:"/MyFlower2.0/Allproducts"
			}).done(function(json){
				console.log(json);
				 let ln = json.length;
	           	 let tableString = "";
	           	 
	           	for (i = 0; i < ln; i++) {
	                tableString += '<a href="<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=getProduct2&id='+ json[i].id +'">'
	                +'<div class="prod-content-2" style="display: inline-block;width: 240px;height: 380px;background-color: #ecf0f1;margin:30px;">'
	                +'<div class="prod-content-2-img"> <img style="width:240px;height:240px;"src="'+json[i].imgPath+'"></div>'
	                +'<div class="prod-content-2-title" style="color:black; font-size:20px; font-weight:600; line-height:50px;margin-left:10px;">'+ json[i].name +'</div>'
	                +'<div class="prod-content-2-price" style="color:red;font-size:20px; font-weight:600;margin-left:10px;">'+'$NT '+json[i].price +'</div>'
	                +'<div class="prod-content-2-quantity" style="display:inline-block; color:#2c3e50; font-size:15px;line-height:50px;margin-left:10px;">'+'商品數量：'+json[i].quantity +'</div>'
	                +'</div></a>';
	           }
	                     	
	        	let title = '<div class="prods-content-title"><p>所有商品</p><div class="seg2"></div></div>';
	           	let totalString = title + tableString;
	                     	
	            $("#prods-content").append(totalString);
	            console.log(tableString);
			})
		});
				
//		 	------------------ 點擊商品框 傳參 (jQuery类名选择器对非原始类名无法进行操作) -----------------
//			最後沒有使用ajax，直接使用<a>標籤的href跳轉傳參：）
//			$(".prods-content").delegate(".prod-content-2","click",function(){
			
				//var id = $("input[name='id']").val();
				//var id = $("input[name='id']").attr("value");
													
	}); 
	
</script>
</head>

<body style="background-color: #ecf0f1;">

	<!-- Header Area -->
    <div class="header"></div>
	
	<!-- Body Area -->
	<div class="content">

		<!-- Left_nav -->
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
						<a href="<%=path %>:8080/MyFlower2.0/pages/product_index.jsp" id="allprods2">所有商品</a> 
						<a href="<%=path %>:8080/MyFlower2.0/pages/product_index_flower.jsp" id="allflowers">鮮花花束</a> 
						<a href="<%=path %>:8080/MyFlower2.0/pages/product_index_gift.jsp" id="allgifts">周邊禮品</a>
					</div>
						<div class="seg"></div>
				</div>  <!--  <div class="nav2-menu"> -->
			</div>    <!--  <div class="nav2"> -->
		</div>     <!--  <div class="content-left"> -->

		<div class="content-right" id="content-right" >
			<div class="prods-imgs">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel"> 
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="pics/productPics/index1.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="pics/productPics/index2.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="pics/productPics/index3.jpg" class="d-block w-100"
								alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>


			<div class="prods-content" id="prods-content">  
			
<!-- 	-------------------   以下內容為自動帶入數據庫資料 復刻商品框   ---------------------- -->
			
<!-- 				<div class="prod-content-1" id="prod-content-1" style="display: inline-block;margin: 10px; -->
<!-- 					width: 240px;height: 380px;background-color: #dff9fb;"> -->
				
<!-- 					<div class="prod-content-1-img" > -->
<!-- 						<img id="prod-content-1-img" src="/test/test1.jpg" style="width:240px;height:240px;"> -->
<!-- 					</div> -->
					
<!-- 					<div class="prod-content-1-title" style="color:black; font-size:20px; font-weight:600; line-height:50px;"> -->
<!-- 					標題 -->
<!-- 					</div> -->
<!-- 					<div class="prod-content-1-price" style="color:red;font-size:20px; font-weight:600;"> -->
<!-- 					$NT 價格 -->
<!-- 					</div> -->
<!-- 					<div class="prod-content-1-quantity" style="color:#2c3e50; font-size:15px;line-height:50px;"> -->
<!-- 					商品數量: -->
<!-- 					</div> -->				
<!-- 				</div>     prod-content-1 -->
		 
			</div>  <!-- prods-content -->

		</div>  <!-- content-right -->

	</div>   <!-- content -->
	
	<!-- Footer Area -->
	<hr />
	<div class="footer"></div>
    
</body>
</html>