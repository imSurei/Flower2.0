<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>客服．Flower Forever</title>
    <base href="<%=basePath %>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        
    <link href="css/contact.css" rel="stylesheet" />

    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    <meta name="google-signin-client_id"
        content="1030132111174-it3lsbndt9981bcucrt2hi2e613hekj6.apps.googleusercontent.com">
    
    <link rel="icon" href="pics/logo/Icon_Logo.png" />
    
 
 <script>   
    $(function () {
    	$(".header").load("header.jsp");
    	$(".footer").load("footer.jsp");
    });
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
                    <li>
                        <a href="<%=path %>:8080/MyFlower2.0/pages/contact.jsp">客服</a>
                    </li> 
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
        <div class="w-75 d-inline sameHeight ">
            <div class="text-center text-7vh offset-1 col-10">客服</div>
            <div class="text-center offset-1 col-10 mb-3 mt-3"><strong>Flower Forever花開不敗</strong> 客戶關懷服務中心於每週二至週日上午9時至下午5時 (國定假日除外) 為您提供服務。</div>

            <form class="row g-3 offset-1 col-10 mb-3 mt-3">
                <div class="col-md-6">
                    <label for="lastName" class="form-label">姓</label>
                    <input type="text" class="form-control" id="lastName">
                </div>
                <div class="col-md-6">
                    <label for="firstName" class="form-label">名</label>
                    <input type="text" class="form-control" id="firstName">
                </div>
                <div class="col-12">
                    <label for="email" class="form-label">電子郵件信箱</label>
                    <input type="email" class="form-control" id="email" placeholder="@example.com">
                </div>
                <div class="col-12">
                    <label for="cellphone" class="form-label">手機號碼</label>
                    <input type="text" class="form-control" id="cellphone" placeholder="09XXXXXXXX">
                </div>
                <div class="col-12">
                    <label for="content" class="form-label">內容</label>
                    <textarea class="form-control" id="content" rows="3"></textarea>
                </div>
                <div class="col-12">
                    <button id="sendConnectBtn" type="submit" class="btn btn-secondary">送出</button>
                </div>
            </form>

        </div>


    </div>

    <div class="clearfix"></div>
   <!--Footer-->
    <hr />
    <div class="footer"></div>
</body>

</html>