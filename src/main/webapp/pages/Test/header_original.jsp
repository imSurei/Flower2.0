<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<%-- <script src="<%=path %>:8080/MyFlower2.0/pages/checkLoginCookie.js"></script> --%>
<%--  <script>
 $(function(){
	 
	var loginAccount = '<%=session.getAttribute("member") %>';
	var loginStatus  = '<%=session.getAttribute("admin") %>';
		 
/* let loginAccount = getSeesion("account");
let loginStatus = getCookie("status"); */
	 
 if (loginAccount == '') {//未登入
     $("#memberLogin").hide();
     $("#adminLogin").hide();
     $("#cartLogin").show();
     $(".logoutState").hide();
     $("#loginState").show();
     
 } else if(loginStatus == 'admin'){
     $("#welecomeName").text("管理員，您好");
     $("#memberLogin").hide();
     $("#adminLogin").show();
     $("#cartLogin").hide();
     $(".logoutState").show();
     $("#loginState").hide();
     
 } else {
     $("#welecomeName").text(getCookie("username")+"，您好");
     $("#memberLogin").show();
     $("#adminLogin").hide();
     $("#cartLogin").show();
     $(".logoutState").show();
     $("#loginState").hide();
 }
 });
</script>  --%>
<div>
 <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top ps-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="<%=path %>:8080/MyFlower2.0/pages/index.jsp"><img style="width:70px" src="pics/indexPics/Logo.png"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=path %>:8080/MyFlower2.0/pages/index.jsp">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=path %>:8080/MyFlower2.0/pages/news.jsp">最新消息</a>
                        </li>
                        <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        	商品
	                        </a>
	                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/product_index.jsp">所有商品</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/product_index_flower.jsp">花束系列</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/product_index_gift.jsp">禮品系列</a>
			                    </li>
	                        </ul>
	                      </li>
                        <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        	聯絡我們
	                        </a>
	                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/contact.jsp">客服</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/contactInfo.jsp">聯絡資訊</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/contactReturned.jsp">退換貨政策</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="<%=path %>:8080/MyFlower2.0/pages/contactPrivacy.jsp">隱私權政策</a>
			                    </li>
	                        </ul>
	                      </li>
                    </ul>
                    <div class="d-flex ">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                         <c:choose>
                           <c:when test=${empty sessionScope.member.account}>
                           
                           </c:when>
                         </c:choose>
                            <li class="nav-item">
                                <div id="cartLogin" class="nav-link active ">
                                    <a class="nav-link text-dark" href="<%=path %>:8080/Finalproject/CartStep1.jsp">購物車</a>
                                </div>
                            </li>
                            <li class="nav-item" id="loginState">
                                <div class="nav-link active ">
                                	<a class="btn btn-secondary" href="<%=path %>:8080/MyFlower2.0/pages/login.jsp">登入</a>
                                   <!--  <button onclick="goToLogin();" class="btn btn-secondary">登入</button> -->
                                </div>
                            </li>
                            
                            
                            <li class="nav-item logoutState">
                            
                                <div class="nav-link active ">
                                    <span id="welecomeName" class="nav-link fw-bold text-decoration-underline" href="<%=path %>:8080/IIIProject/MemberCenter/MemberCenterHome.html" style="cursor:context-menu"></span>
                                </div>
                             </li>       
							<li id="memberLogin" class="nav-item dropdown">
                                <div class="nav-link active ">
                                    <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">會員中心</a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					                    <li>
					                        <a class="dropdown-item" href="<%=path %>:8080/IIIProject/MemberCenter/MemberData.html">基本資料</a>
					                    </li>
					                    <li>
					                        <a class="dropdown-item" href="<%=path %>:8080/IIIProject/MemberCenter/OrdersMember.html">訂單管理</a>
					                    </li>
			                        </ul>
                                </div>
                            </li>
                            <li id="adminLogin" class="nav-item dropdown">
                                <div class="nav-link active ">
                                    <a class="nav-link text-dark" href="<%=path %>:8080/MyFlower2.0/pages/adminIndex.jsp">管理員介面</a>
                                </div>
                            </li>
                            <li class="nav-item logoutState">        
                                <div class="nav-link active ">
                                   <!--  <button onclick="signOutCookie();signOut();" class="btn btn-secondary">登出</button> -->
                                    <a class="btn btn-secondary" href="<%=path %>:8080/MyFlower2.0/pages/index.jsp">登出</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</div>
