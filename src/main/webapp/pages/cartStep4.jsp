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
    <title>訂單成立．Flower Forever</title>
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
    
<script>
    
        $(function () {
        	
        	$(".header").load("header.jsp");
			$(".footer").load("footer.jsp");


			
        });
    
    </script>
</head>
<body>
	<div class="header"></div>
    <div class="offset-1 col-10">
        <%--購物車進度條--%>
        <div class="container mt-100 mb-5 text-center">
            <div class="row">
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">購物</div>
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
                    <div class="d-inline-block h5 fw-bold">訂單成立</div>
                </div>
            </div>
        </div>




        <%--購物車 文字--%>
        <div class="container mb-4">
            <div id="finishedPayment" class="row align-items-center pt-2 pb-2 m-0 mb-1 bg-primary bg-gradient text-light w-90">
                <div class="h3 m-0 pt-3 pb-3">
                    已完成付款
                </div>
            </div>

            <div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 bg-secondary text-light w-100">
                <div class="h4 m-0">
                    訂單編號：${ sessionScope.order.orderNo }
                </div>
            </div>
            <%--購物車清單 欄位--%>
            <div id="shoppingCartName" class="row align-items-center pt-2 pb-2 w-100">
               <!--  <div class="w-35 d-inline-block text-center h5 m-0">
                    訂單編號
                </div> 
                <div class="w-35 d-inline-block text-center h5 m-0">
                    下單時間
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    訂單總額
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    發貨狀態
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    所屬用戶
                </div> -->
                <table>
				<thead>
					<tr>
						<th>訂單編號</th>
						<th>下單時間</th>
						<th>訂單總額</th>
						<th>發貨狀態</th>
						<th>所屬用戶ID</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${order.orderNo}</td>
							<td>${order.orderDate}</td>
							<td>${order.orderMoney}</td>
							<td><c:if test="${order.orderStatus==0}">未發貨</c:if> 
							<c:if test="${order.orderStatus==1}">已發貨</c:if> 
							<c:if test="${order.orderStatus==2}">已簽收</c:if></td>
							<td>${order.orderUser}</td></tr>
				</tbody>
			</table>
            </div>

            <hr />

            <%--小提醒文字+合計文字--%>
            <div id="discount" class="row align-items-center pt-2 pb-2 m-0">
				<div class="w-10 d-inline-block h5 m-0 text-center p-2 fw-bold" style="background-color: rgb(255 227 243/ 0.90)">小提醒</div>
				<div class="w-60 d-inline-block h5 m-0">請再次確認以下配送地址，謝謝</div>
				<div id="total" class="w-10 d-inline-block h5 m-0 text-center">
					訂單總額
				</div>
              	<div id="totalMoney" class="w-20 d-inline-block h5 m-0 text-end">${sessionScope.order.orderMoney }</div>
            </div>

            <%--取貨資料--%>
            <div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 mt-5 bg-secondary text-light w-100">
                <div class="h4 m-0">
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
            <%--繼續購物頁面 和 回首頁--%>
<%-- *****合併更改********************************************************************************************************** --%>
            <div class="row justify-content-end pt-2 pb-2 m-0 mt-5 ">
                <div class="w-15 text-center">
<%-- 要修改onclick=location.href 的位置 --%>
                    <input type="submit" name="submit" class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="繼續購物" onclick=location.href="<%=path %>:8080/MyFlower2.0/pages/product_index.jsp">
                </div>
                <div class="w-15 text-end">
<%-- 要修改onclick=location.href 的位置 --%>
                    <input type="submit" name="submit"  class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="查看所有訂單" onclick=location.href="<%=path%>:8080/MyFlower2.0/orderServlet?action=showMyOrders&userId=${ sessionScope.member.id }">
                </div>
            </div>
        </div>
    </div>
    <%--footer--%>
   	<hr />
   <div class="footer"></div>
</body>
</html>