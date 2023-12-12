<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<div>
<footer>
        <div class="container offset-2 col-md-9" style="height: 150px">
            <div class="row align-items-start">
                <div class="col-lg-3">
                    <div class="fw-bolder">客戶服務</div>
                    <a class="text-start text-decoration-none link-secondary" href="<%=path %>:8080/MyFlower2.0/pages/contactReturned.jsp">退換貨政策</a>
                    <br>
                    <a class="text-start text-decoration-none link-secondary" href="<%=path %>:8080/MyFlower2.0/pages/contactPrivacy.jsp">隱私權政策</a>
                </div>
                <div class="col-lg-5">
                    <div class="fw-bolder">聯絡我們</div>
                    <table>
                    	<tr>
                    		<td>服務時間</td>
                    		<td>：</td>
                    		<td>周二至周日 09:00-17:00</td>
                    	</tr>
                    	<tr>
                    		<td>電話</td>
                    		<td>：</td>
                    		<td>(07)9699885</td>
                    	</tr>
                    	<tr>
                    		<td>地址</td>
                    		<td>：</td>
                    		<td>高雄市前金區中正四路211號8號樓之10</td>
                    	</tr>
                    	<tr>
                    		<td>客服信箱</td>
                    		<td>：</td>
                    		<td>iiiflowerforever@gmail.com</td>
                    	</tr>
                    </table>
                </div>
                <div class="col-lg-3">
                	<div class="fw-bolder">社群媒體</div>
                    <a href="https://instagram.com/iiiflowerforever?utm_medium=copy_link" class="text-decoration-none link-secondary" target="_blank">
                    	<img class="mt-1 mb-1" src="pics/indexPics/instagram.png" style="width:5vh" />
                    	<span class="">iiiflowerforever</span>
                    </a>
                    <br>
                    <a href="https://www.facebook.com/Flower-Forever-%E8%8A%B1%E9%96%8B%E4%B8%8D%E6%95%97-108098771615167/" class="text-decoration-none link-secondary" target="_blank">
                    	<img class="mt-1 mb-1" src="pics/indexPics/facebook.png" style="width:5vh" />
                    	<span class="">Flower Forever 花開不敗</span>
                    </a>
                </div>
            </div>
        </div>
    </footer>
</div>
