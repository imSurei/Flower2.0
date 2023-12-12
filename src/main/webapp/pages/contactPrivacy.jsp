<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>隱私權政策．Flower Forever</title>
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
<!-- Header Area -->
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
            <div class="text-center text-7vh offset-1 col-10 mb-3">隱私權政策</div>
	            <div>
					  <div class="offset-1 mt-2 mb-2">
						  	<table  style="border-collapse:separate; border-spacing:0px 10px;">
		                    	<tr>
		                    		<td>我們將保護您的隱私權並保證您所提供的個人資料的保密性。我們所收集的個人資料僅用於為您提供服務，及滿足您的訂單要求。除此之外，我們只在您允許的情況下才使用您的個人資料。除非為了滿足您訂單的需要，否則決不會出售或與第三方共享您的個人資料。本網站僅在下列為顧客服務的情況下使用我們所收集的信息:
									</td>
		                    	</tr>
		                    	<tr>
		                    		<td></td>
		                    		<td></td>
		                    	</tr>
		                    	<tr>
		                    		<td>為了給您創造在花禮網購物時的獨特體驗，我們會在徵得您同意的情況下保留您的個人資料，訂單信息和服務信息，這樣我們能為您設置針對您的個性化服務， 並向您推薦您可能會感興趣的產品. 如果您允許， 我們會通過您所提供的聯絡方式， 及時通知您有關新產品動態，促銷的信息. 如果您不希望收到這些信息， 您可以隨時通過發郵件的方式來通知我們。
		                    		</td>
		                    	</tr>
		                    	<tr>
		                    		<td></td>
		                    		<td></td>
		                    	</tr>
		                    	<tr>
		                    		<td>如果您想建立個人檔案，我們將在我們的安全服務器上為您保存好個人資料。在您的帳戶中，我們為您保存的資料包括您的姓名、聯繫方式，電子郵箱地址、送貨和付款的地址，付款方式及收貨人的信息。
		                    		</td>
		                    	</tr>
		                    	<tr>
		                    		<td></td>
		                    		<td></td>
		                    	</tr>
		                    	<tr>
		                    		<td>如果您有興趣參加我們的競賽/促銷/市場調查等活動，我們將詢問您的姓名、電子郵箱的地址和聯繫地址。這樣我們就能及時通報競賽的進程，完成促銷並追踪有關活動的受歡迎程度。
		                    		</td>
		                    	</tr>
		                    	<tr>
		                    		<td></td>
		                    		<td></td>
		                    	</tr>
		                    	<tr>
		                    		<td>如果您不希望收花人知道您的個人信息（請務必在填寫訂單時，在訂單的"備註"欄內註明）。
		                    		</td>
		                    	</tr>
		                    	<tr>
		                    		<td></td>
		                    		<td></td>
		                    	</tr>
		                    </table>
					  </div>
				</div>
    	</div>
    </div>

    <div class="clearfix"></div>
   <!--  Footer Area -->
    <hr />
    <div class="footer"></div>
</body>
</html>