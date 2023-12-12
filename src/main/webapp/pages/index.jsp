<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Flower Forever</title>
    <base href="<%=basePath %>">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> 

    <link href="css/index.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width,user-scalable=no">
    
	<link rel="icon" href="pics/logo/Icon_Logo.png" />
	

    <script>      
        $(function () {	
        	$(".header").load("header.jsp");
        	$(".footer").load("footer.jsp");
        	
        	$(".coupleClick").click(function(){
    			window.location=`<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=getProduct2&id=1011`
    		});
    		
    		$(".giftClick").click(function(){
    			window.location=`<%=path %>:8080/MyFlower2.0/manager/ProductServlet?action=getProduct2&id=1015`
    		});

    		$(".flowerClick").click(function(){
    			window.location= `<%=path %>:8080/MyFlower2.0/pages/product_index_flower.jsp`
    		});
    		
    		$(".presentClick").click(function(){
    			window.location= `<%=path %>:8080/MyFlower2.0/pages/product_index_gift.jsp`
    		});
        	
        });  
        
    </script>
</head> 

<body>
<!-- Header -->
    <div class="header"></div>
    <div class="homebg">
        <div id="homebgBlockTop"></div>
        <img src="pics/indexPics/StoreName_NoBackGround.png" class="rounded mx-auto d-block" style="width:60vw;max-height:60vh" />
        <a href="https://instagram.com/iiiflowerforever?utm_medium=copy_link" class="text-decoration-none" target="_blank">
        	<img class="igLogo" src="pics/indexPics/instagram.png" />
        </a>
        <a href="https://www.facebook.com/Flower-Forever-%E8%8A%B1%E9%96%8B%E4%B8%8D%E6%95%97-108098771615167/" class="text-decoration-none" target="_blank">
        	<img class="fbLogo" src="pics/indexPics/facebook.png" />
        </a>
        <div id="homebgBlockMiddle"></div>            

  				  <span class="col text-center h5 fst-italic titleWord" style="color:#585858">
           			 我們為您準備浪漫，您準備好了嗎？
   				 </span>
        <img src="pics/indexPics/arrow down icon.png" class="scrollArrow" style="height:1vh" />
    </div>

 
	<div class="p-3">
		<div class="coupleClick couple">
	       	 <div class="productBlockTop"></div>
		 	 <div class="row m-0 p-0" style="background-color: rgb(0 0 0 / 0.55);color:white">
		  	 	<div class="col-md-2 m-0 p-0" style="height:10vh">
					 <input class="buyBtn fw-bold border-0 h5 m-0 p-0 w-100 h-100" type="button" value="立即選購">	
		  		</div>
		  		<div class="col-md-1 m-0 p-0"></div>		  				  
		  		<div class="col-md-2 m-0 p-0 d-flex align-items-center h5 text-center" style="height:10vh">
		  			<div class="ellipsis text-center">
						情人花束推薦
		  			</div>
		   		</div>
		   		<div class="col-md-7 m-0 p-0 d-flex align-items-center h5" style="height:10vh">
		   			 <div class="ellipsis">
						戀愛從收到一束花和正式的告白開始
		   			 </div>
		   		</div>
		 	</div>
		</div>
    </div>
    
    
    <div class="p-3">
		<div class="giftClick gift">
	       	 <div class="productBlockTop"></div>
		 	 <div class="row m-0 p-0" style="background-color: rgb(0 0 0 / 0.55);color:white">
		  	 	<div class="col-md-2 m-0 p-0" style="height:10vh">
					 <input class="buyBtn fw-bold border-0 h5 m-0 p-0 w-100 h-100" type="button" value="立即選購">	
		  		</div>
		  		<div class="col-md-1 m-0 p-0"></div>		  				  
		  		<div class="col-md-2 m-0 p-0 d-flex align-items-center h5 text-center" style="height:10vh">
		  			<div class="ellipsis text-center">
						日常花束推薦
		  			</div>
		   		</div>
		   		<div class="col-md-7 m-0 p-0 d-flex align-items-center h5" style="height:10vh">
		   			 <div class="ellipsis">
						鮮花從來就不只是物品，而是一種生活方式
		   			 </div>
		   		</div>
		 	</div>
		</div>
    </div>
    
    <div class="p-3">
		 	<div class="row m-0 p-0">
		  	 	<div class="col-md-6 m-0 " style="height:60vh">
		  	 		<div class="flowerClick flower">
					  	 <div class="ItemsBlockTop"></div>
					 	 <div class="row m-0 p-0" style="background-color: rgb(0 0 0 / 0.55);color:white">
					  	 	<div class="col-md-6 m-0 p-0" style="height:10vh">
								 <input class="buyBtn fw-bold border-0 h5 m-0 p-0 w-100 h-100" type="button" value="立即選購">	
					  		</div>		  				  
					  		<div class="col-md-6 m-0 p-0 d-flex align-items-center h5 d-flex justify-content-center" style="height:10vh">
					  			<div class="text-center">
									花束系列
					  			</div>
					   		</div>
					 	</div>
		  	 		</div>
		  		</div>
		  	 	<div class="col-md-6 m-0 " style="height:60vh">
		  	 		<div class="presentClick present">
					  	 <div class="ItemsBlockTop"></div>
					 	 <div class="row m-0 p-0" style="background-color: rgb(0 0 0 / 0.55);color:white">
					  	 	<div class="col-md-6 m-0 p-0" style="height:10vh">
								 <input class="buyBtn fw-bold border-0 h5 m-0 p-0 w-100 h-100" type="button" value="立即選購">	
					  		</div>		  				  
					  		<div class="col-md-6 m-0 p-0 d-flex align-items-center h5 d-flex justify-content-center" style="height:10vh">
					  			<div class="text-center">
									禮品系列
					  			</div>
					   		</div>
					 	</div>
		  	 		</div>
		  		</div>
		    </div>
    </div>
   <!--  Footer -->
   <hr />
   <div class="footer"></div>
</body>
</html>