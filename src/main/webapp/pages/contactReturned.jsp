<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>退換貨政策．Flower Forever</title>
	<base href="<%=basePath %>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        
    <link href="css/contact.css" rel="stylesheet" />
	
	<link rel="icon" href="pics/logo/Icon_Logo.png" />    

<script>

    $(function () {
    	
    	$(".header").load("header.jsp");
    	$(".footer").load("footer.jsp");
       	
    })
    </script>
</head>

<body>
<!-- Header -->
   <div class="header"></div>

    <div class="title">
        <div id="titleBlockTop"></div>
        <div class="text-center">
            <img src="pics/indexPics/StoreName_NoBackGround.png" class="d-inline-block m-3" style="width:60vw;max-height:38vh" />
        </div>
    </div>

    <div class="offset-1 col-10 mt-3">
        <div class="w-23 d-inliney sameHeight">

            <nav id="sideMenu">
                <ul>
                   	<li>
                        <div class="active">聯絡我們</div>
                    </li>
                    <%-- <li>
                        <a href="<%=path %>:8080/MyFlower2.0/pages/contact.jsp">客服</a>
                    </li> --%>
                    <li>
                        <a href="<%=path %>:8080/MyFlower2.0/pages/contactInfo.jsp">聯絡資訊</a>
                    </li>
                    <li>
                        <a href="<%=path %>:8080/MyFlower2.0/pages/contactReturned.jsp">退換貨政策</a>
                    </li>
                    <li>
                        <a href="<%=path %>:8080/MyFlower2.0/pages/contactPrivacy.jsp">隱私權政策</a>
                    </li>
                </ul>
            </nav>


        </div>
        
        
        <div class="w-75 d-inline sameHeight">
            <div class="text-center text-7vh offset-1 col-10 mb-3">退換貨政策</div>
            <div>
				  <div class="offset-1 mt-2 mb-2">
					  	<table  style="border-collapse:separate; border-spacing:0px 10px;">
	                    	<tr>
	                    		<td>⦿</td>
	                    		<td>花類商品屬於時效性產品，不適用於相關法令之退換貨服務。故商品售出後，無法進行退款及更換花卉的服務。</td>
	                    	</tr>
	                    	<tr>
	                    		<td>⦿</td>
	                    		<td>客制化訂單屬於單一特製商品，無重複性，非本網站常售商品，故無法進行退貨服務。</td>
	                    	</tr>
	                    	<tr>
	                    		<td>⦿</td>
	                    		<td>商品售出後，若無重大瑕疵(如花器破損、發霉或花束散開)，不予退貨。</td>
	                    	</tr>
	                    	<tr>
	                    		<td>⦿</td>
	                    		<td>商品售出後，為保護您的權益，拆封過程中可錄影，以確保商品之完整性。</td>
	                    	</tr>
	                    	<tr>
	                    		<td>⦿</td>
	                    		<td>如有問題，可與本網站聯繫，我們將以最快速度與您回覆。</td>
	                    	</tr>
	                    </table>
				  </div>
			</div>

    	</div>
    </div>

    <div class="clearfix"></div>
    
   <!--  Footer -->
    <hr />
    <div class="footer"></div>
</body>
</html>
