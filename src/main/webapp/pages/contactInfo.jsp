<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>聯絡資訊．Flower Forever</title>
	<base href="<%=basePath %>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        
    <link href="css/contact.css" rel="stylesheet" />
    
    <!-- 這是什麼？ -->
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    <meta name="google-signin-client_id"
        content="1030132111174-it3lsbndt9981bcucrt2hi2e613hekj6.apps.googleusercontent.com"> 
        
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
            <div class="text-center text-7vh offset-1 col-10 mb-3">聯絡資訊</div>
            <div class="container w-75">
				  <div class="row mb-2">
				    	<div class="col-md-2 offset-1">服務時間</div>
				    	<div class="col-md-1 fw-border">:</div>
				    	<div class="col-md-8">周二至周日 09:00-17:00</div>
				  </div>
				  <div class="row mt-2 mb-2">
				    	<div class="col-md-2 offset-1">電話</div>
				    	<div class="col-md-1 fw-border">:</div>
				    	<div class="col-md-8">(07)9699885</div>
				  </div>
				  <div class="row mt-2 mb-2">
				    	<div class="col-md-2 offset-1">客服信箱</div>
				    	<div class="col-md-1 fw-border">:</div>
				    	<div class="col-md-8">flowerforever@gmail.com</div>
				  </div>
				  <div class="row mt-2 mb-4">
				    	<div class="col-md-2 offset-1">地址</div>
				    	<div class="col-md-1 fw-border">:</div>
				    	<div class="col-md-8">高雄市前金區中正四路211號8號樓之1</div>
				  </div>
       	    <div class="text-center">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1593.7570691978678!2d120.2922603176893!3d22.627554638308563!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e047cb59c5ef1%3A0xeb0d3d3bee586e78!2z6LOH562W5pyDLeaVuOS9jeaVmeiCsueglOeptuaJgC3ljZfljYDoqJPnt7TkuK3lv4Mo6auY6ZuEKQ!5e0!3m2!1szh-TW!2stw!4v1631091521967!5m2!1szh-TW!2stw" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
		</div>
		
    </div>
 </div>

    <div class="clearfix"></div>
    
    <hr />
    <div class="footer"></div>
</body>
</html>