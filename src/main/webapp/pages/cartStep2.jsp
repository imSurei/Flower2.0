<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%StringBuffer basePath = request.getRequestURL();
String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>填寫資料．Flower Forever</title>
    <base href="<%=basePath %>">
    <%-- 網站圖標 --%>
	<link rel="icon" href="pics/logo/Icon_Logo.png" />
	    
   <!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <%--bootstrap連結--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <%--加入shopping_cart樣式表--%>
    <link href="css/shopping_cart.css" rel="stylesheet" />

	<%--日期選擇器 --%>
	<script src="../js/jquery.ui.datepicker-zh-TW.js"></script>
	
	<%--時間選擇器 --%>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

    <script>
		
		$(function () {
			
			$(".header").load("header.jsp");
			$(".footer").load("footer.jsp");

        	<%--回到上一頁--%>
        	$(".previousBtn").click(function(){     		
        		window.location="<%= path%>:8080/MyFlower2.0/pages/cartStep1.jsp"
        	});
        	
        	 <%--預計取貨日期--%>
        	 <%--  	$( "#datepicker" ).datepicker({
          		dateFormat: 'yy-mm-dd',
                  minDate: "-1+2d",
                  maxDate: "-1+1m",    
                  showAnim: "slideDown",
                  beforeShowDay: noMondays 
                  會將每個日期當成參數，丟入noMondays function中       		
          	});      	
          	function noMondays(a) {
          		  a=a.getDay();
          		  a.getDay()=>星期天為0，星期六為6
          		  if(a==1){
          			  return [false,""];
          			  beforeShowDay的接收格式[0]=true/false、[1]=""或CSS，詳細要參考官方文件
          		  }
          		  return [true,""];
          	}

              預計取貨時間
  			$('#timepicker').timepicker({				
      			timeFormat: 'HH:mm',
      			interval: 30,
      			minTime: '09',
   		 		maxTime: '17:00',
  		  		startTime: '09',
    				dynamic: false,
  		  		dropdown: true,
  				scrollbar: true
  			});
 --%>

		});
</script>
</head>
<body>
<div class="header"></div>

    <div class="offset-1 col-10">
        <!--購物車進度條-->
        <div class="container mt-100 mb-5 text-center">
            <div class="row">
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">購物</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 fw-bold">填寫資料</div>
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

        <!--購物車 文字-->
        <div class="container mb-4">

            <div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 bg-secondary text-light w-100">
                <div class="h4 m-0">
                    購物車
                </div>
            </div>

            <%--購物車清單 欄位列--%>
            <div id="shoppingCartName" class="row align-items-center pt-2 pb-2 w-100">
                <div class="w-35 d-inline-block text-center h5 m-0">
                    商品
                </div>
                <div class="w-35 d-inline-block text-center h5 m-0">
                    描述
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    單價
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    數量
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    小計
                </div>
            </div>
            <hr />


            <%--購物車清單--%>
				<c:forEach items="${sessionScope.cart.cartItemsMap}" var="entry">
			
					<%--商品列表 --%>
					<div id="${entry.value.id}"
						class="productItem row align-items-center m-0 mb-2">
						<%-- 圖片位置 --%>
<%-- *****合併更改********************************************************************************************************** --%>
						<div class="w-10 d-inline-block  mh-100" style="overflow: hidden;">
							<img src="${entry.value.imgPath}"
								style="height: 100px; object-fit: cover" />
						</div>
						<%-- 產品名稱 --%>
						<div class="w-25 d-inline-block mh-100"
							style="word-break: break-all;">
							<div class="text-left ellipsis">
								${entry.value.name}</div>
						</div>
						<%-- 商品資訊1 --%>
						<div class="w-35 d-inline-block mh-100"	style="word-break: break-all;">
							<div class="text-left ellipsis">${entry.value.info}</div>
						</div>
						<%-- 單價 --%>
						<div class="w-10 d-inline-block text-center mh-100 unitprice"
							style="word-break: break-all">${entry.value.price}
						</div>
						<%-- 數量 --%>
						<div class="w-10 d-inline-block text-center mh-100 amount">
							${entry.value.count}</div>
						<%-- 小計 --%>
						<div class="w-10 d-inline-block text-center mh-100 totalNums">
							 ${entry.value.totalPrice}
						</div>
					</div>
					<%-- 送給綠界的參數 --%>
					<!-- <script>
						ItemName += "${entry.value.name}"+"_"+"${entry.value.price}"+"元x"+"${entry.value.totalPrice}"+"#";
					</script> -->
				</c:forEach>
      
            <hr />

			<%--小提醒文字+合計文字--%>
			<div id="discount" class="row align-items-center pt-2 m-0">
				<div class="w-10 d-inline-block h5 m-0 text-center p-2 fw-bold" style="background-color: rgb(255 227 243/ 0.90)">小提醒</div>
				<div class="w-60 d-inline-block h5 m-0">本店亦提供店取服務，請來電告知取貨時間</div>
				<div id="total" class="w-10 d-inline-block h5 m-0 text-center">
					合計
				</div>
				<div id="totalMoney" class="w-20 d-inline-block h5 m-0 text-end">
					<span>NT$ </span>
					<span id="totalMoneyNum">${ sessionScope.cart.totalPrice }</span>
				</div>
			</div>
			<div id="discount" class="row align-items-center pb-2 m-0">
				<div class="w-10 d-inline-block m-0 p-2"></div>
				<div class="w-60 d-inline-block h5 m-0">為確保花材新鮮，取貨日期僅提供未來一個月</div>
			</div>


            <%--取貨資料 標題--%>
            <div id="cusDataTitle" class="row align-items-center pt-2 pb-2 m-0 mt-5 mb-5 bg-secondary text-light w-100">
                <div class=" h4 m-0">
                    配送資料
                </div>
            </div>

            <%--取貨人姓名--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">姓名</label>
                </div>
                <div class="col-10">
                    <input id="Picker_name" style="display: inline" type="text" name="Picker_name" class="contact_input" placeholder="必填" value=" ${sessionScope.member.name}" required/>                    
                </div>
            </div>
            
            <%--取貨人電話--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">電話</label>
                </div>
                <div class="col-10">
                    <input id="Phone" style="display: inline" type="tel" name="Phone" class="contact_input" placeholder="必填" value=" ${sessionScope.member.phone}" required/>                    
                </div>
            </div>
            
            <%--取貨人信箱--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">信箱</label>
                </div>
                <div class="col-10">
                    <input id="Email" style="display: inline" type="email" name="Email" class="contact_input" value=" ${sessionScope.member.email}"/>                    
                </div>
            </div>

			 <%--取貨人地址--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">地址</label>
                </div>
                <div class="col-10">
                    <input id="Email" style="display: inline" type="email" name="Email" class="contact_input" value=" ${sessionScope.member.address}"/>                    
                </div>
            </div>

            <%--預計取貨日期--%>
            <!-- <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">預計取貨日期</label>
                </div>
                <div class="col-10">
                    <input id="datepicker" style="display: inline" type="text" name="date" class="contact_input" readonly="readonly" placeholder="必填" required/> 
                    <label class=" fw-bold">（營業日：每周二~周日）</label>                   
                </div>
            </div> -->
            
			<%--預計取貨時間--%>
			<!-- <div class="form_row mt-5 row">
				<div class="col-2 h5 m-0 fw-bold">
					<label class=" ms-4">預計取貨時間</label>
				</div>
				<div class="col-10">
					<input id="timepicker" type="text" class="text-center timeExample" readonly="readonly" placeholder="必填" required/>
					<label class=" fw-bold">（營業時間：09:00-17:00）</label>
				</div>
			</div> -->


			<%--訂單備註--%>
           <!--  <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">訂單備註</label>
                    <label class=" ms-4" style="font-size:15px">(限100個字)</label>
                </div>
                <div class="col-10">
                    <textarea id="Remark" name="name" class="contact_textarea " maxlength="100"></textarea>
                </div>
            </div> -->

            <%--回去購物頁面 和 到訂單成立頁面--%>
            <div class="row justify-content-end pt-2 pb-2 m-0 ">
                <div class="w-15 text-center">
                    <button class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100 ">上一步</button>
                </div>
                <div class="w-15 text-end">
                	<!--  <form id="form1" method="post" action="../../ecpay/ECPayServer">  -->
                		<input class="nextBtn fw-bold border-0 h4 m-0 p-0 w-100" type="button" value="付款" onclick=location.href="<%=path %>:8080/MyFlower2.0/orderServlet?action=createOrder">				
                   <!--   </form>  -->
                     <!--  onclick=location.href="<%=path %>:8080/MyFlower2.0/pages/ECPayClient.jsp"   orderServlet?action=createOrder-->
                </div>                					
            </div>
        </div>
</div>
	<%-- footer --%>
    <hr />
   <div class="footer"></div>
</body>
</html>