<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>最新消息．Flower Forever</title>
<base href="<%=basePath %>">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- 以下是詳情頁面參數 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

<!-- -------- 和豐的外掛連結 -------- -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="js/adminShowOrHidden.js"></script>

<script src="js/DateFormate.js"></script>

<link href="css/adminNews.css" rel="stylesheet" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/Pagination.js"></script>


	<script src="http://localhost:8080/IIIProject/js/checkLoginCookie.js"></script>
    
    <link rel="icon" href="pics/logo/Icon_Logo.png" />


<script src="../js/checkLoginCookie.js"></script>
<script type="text/javascript">

	$(function(){
		//bootstrap與Jquery UI 按鈕樣式衝突的解決辦法/
		bootstrapButton = $.fn.button.noConflict(); 
		$.fn.bootstrapBtn = bootstrapButton;	
	});
    
    $(function () {
        let loginAccount = getCookie("account");
        let loginStatus = getCookie("status");
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

    })
</script>

<!-- ------------------------- 和豐的 JavaScript-------------------------  -->

<script>

        function sortTableByDate(bool,col) {
            let tableSortarr = [];
            $("table tbody tr").each(function () {
                tableSortarr.push(this);
            })
            // console.log(tableSortarr);
            let sortby = bool;//true:遞減；false:遞增。自訂調整*****************************************
            if (sortby) {
                tableSortarr.sort(function (o1, o2) {
                    // console.log(o1);
                    let d1 = new Date(o1.cells[col].innerText);//轉日期String變成New Date物件，後續才能比較日期大於or小於
                    let d2 = new Date(o2.cells[col].innerText);//cells[2]是在抓Date的欄位

                    if (d1 < d2) return -1;
                    else if (d1 > d2) return 1;
                    else return 0;
                });
            } else {
                tableSortarr.sort(function (o1, o2) {
                    // console.log(o1);
                    let d1 = new Date(o1.cells[col].innerText);//轉日期String變成New Date物件，後續才能比較日期大於or小於
                    let d2 = new Date(o2.cells[col].innerText);

                    if (d1 < d2) return 1;
                    else if (d1 > d2) return -1;
                    else return 0;
                });
            }

            // console.log(tableSortarr);
            let ln = tableSortarr.length;
            for (i = 0; i < ln; i++) {
                document.querySelector("tbody").appendChild(tableSortarr[i]);
            }
        }

        function cancelAllSelect() {
            $('tbody tr td input[type="checkbox"]:checked').each(function () {
                this.checked = false;
            })
        }


        function resetDialog() {
            $("#NewsId").val("");
            $("#Date").val("");
            $("#Title").val("");
            $("#Content").val("");

            fixNewsIdField();
        }

        function fixNewsIdField() {
            let bool = $("#NewsId")[0].disabled;
            if (bool) {
                bool = false;
            }
        }

        function updateCell() {
            let ln = $("input:checked").length;
            if (ln > 1) {
                alert("一次只能更新一筆資料!!!");
            } else if (ln < 1) {
                alert("請選取一筆資料");
            } else {
                resetDialog();
                document.querySelector("#ui-id-1").innerText = "更新消息";


                let updateList = ['NewsId', 'Date', 'Title', 'Content'];
                var dataJSON = {};

                for (i = 1; i < 5; i++) {
                    dataJSON[updateList[i - 1]] = $("input:checked").parent().parent().children().eq(i)[0].innerText;
                }

                $("#NewsId").val(dataJSON["NewsId"]);
                $("#Date").val(dataJSON["Date"]);
                $("#Title").val(dataJSON["Title"]);
                $("#Content").val(dataJSON["Content"]);

                $("#newsIdLable").show();

                $("#NewsId")[0].disabled = true;

                $("#dialog").dialog("open");


            }

        }

        function deleteCell() {
            let ln = $("input:checked").length;
            for (i = 0; i < ln; i++) {
                let newsId = $("input:checked").parent().parent().eq(i).children().eq(1)[0].innerText;


                console.log("刪除NewsID:" + newsId);


                let url = "http://localhost:8080/IIIProject/NewsAPI/Delete";

                $.ajax({
                    type: "POST",
                    url: url,
                    data: { NewsId: newsId },
                    success: function () {

                    }
                });
            }
            alert("執行刪除!!");
            updateTable();//重新更新表格內容
        }


        function updateTable() {
            fetch("http://localhost:8080/IIIProject/NewsAPI").then(e => e.json()).then(
                function (res) {
                    // console.log(res);
                    let ln = res.length;
                    let tableString = "";
                    let checkbox = '<input type="checkbox" onclick="" style="height:30px;width:30px">';

                    for (i = 0; i < ln; i++) {
                        tableString += `<tr><td class="text-center">${checkbox}</td><td>${res[i].newsId}</td><td>${res[i].date}</td><td>${res[i].title}</td><td class="d-none">${res[i].content}</td></tr>`;
                    }
                    $("tbody").html(tableString);
                    $("#myInput").val("");

                    $("#myTable tr").addClass("ShowPage");//目前應該要呈現的所有資料，全部頁面的資料。如果有使用過濾，則會移除不符合條件的tr的class - ShowPage(做分頁籤用)
                    paginationCreate();//更新分頁籤

                }).then(function(){
                    sortTableByDate(false,2);//遞減排序，第三欄
                })
        }

        $(function () {
        	
        	$(".header").load("header.jsp");
        	
            let status = getCookie("status");
            if (status != 'admin') {
                console.log("非管理員!");
            } else {
                updateTable();
                resetDialog();
            }
        })


        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                modal: true,
// -------------修改彈出視窗寬度 width 700 的地方 ---------------------
                width: 540,	
                show: {
                    effect: "blind",
                    duration: 500
                },
                hide: {
                    effect: "blind",
                    duration: 500
                },
                open: function () {


                },
                close: function () {
                    resetDialog();
                },
                buttons: {
                    "確認": function () {
                        let date = $("#Date").val();
                        let title = $("#Title").val();
                        let content = $("#Content").val();



                        let actionStatus = document.querySelector("#ui-id-1").innerText;
                        if (actionStatus == "新增消息") {
                            $('#hiddenForm').attr("action", "http://localhost:8080/IIIProject/NewsAPI/Insert");
                        } else if (actionStatus == "更新消息") {
                            $('#hiddenForm').attr("action", "http://localhost:8080/IIIProject/NewsAPI/Update");
                        }

                        if (date != "" && title != "" && content != "") {
                            $("#hiddenForm").submit(function (event) {
                                //阻止表單提交
                                event.preventDefault();
                            });

                            $("#NewsId")[0].disabled = false;
                            $.ajax({
                                url: $("#hiddenForm").attr("action"),
                                method: "POST",
                                data: $("#hiddenForm").serialize()
                            }).then(function () {
                                window.location.reload();
                            })

                        } else {
                            alert("必填項目:所有內容不得為空!");
                        }




                    },
                    "取消": function () {
                        resetDialog();
                        $(this).dialog("close");
                    }
                }
            });

//  ---------------控制新增 彈出視窗屬性 和 CSS "輸入關鍵字" 欄位長度修改區---------------
            
            $("label").css("width", "500px")
            $("label").addClass("text-left");
            $(".dialogbox").css("width", "500px");	//控制最上方的 "輸入關鍵字" 和 "彈出視窗" 欄位長度修改區


        })

        function createNews() {
            resetDialog();
            document.querySelector("#ui-id-1").innerText = "新增消息";
            $("#Date").val((new Date()).format("yyyy-MM-dd hh:mm"));
            $("#newsIdLable").hide();
            $("#dialog").dialog("open");
        }


// 解決 Query 和 Bootstrap 衝突  bootstrap與Jquery UI 按鈕樣式衝突的解決辦法
		  $(function(){
			  bootstrapButton = $.fn.button.noConflict(); 
              $.fn.bootstrapBtn = bootstrapButton;  
			  
		  });

    </script>

</head>


<body style="background: #ecf0f1;">
	<!-- Header Area -->
    <div class="header"></div>
    
	<!-- Body Area -->
	<div class="content">
		<div class="content-left">
			<div class="left-title">
				<a href="#">管理員介面</a>
			</div>
			<!-- 分割線 -->
			<div class="seg"></div>
			<!-- 菜單欄導航 -->
			<div class="nav2">
				<!-- 單個菜單項 -->
				<div class="nav2-menu">
					<!-- 子標題 -->
					<div class="nav2-content">
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminIndex.jsp" id="allprods2" class="navtext">管理首頁</a>
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminMember.jsp" id="allflowers" class="navtext">會員管理</a>
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminNews.jsp" id="allgifts" class="navtext">最新消息</a>
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminProduct.jsp" id="allgifts" class="navtext">商品管理</a>
						<a href="<%=path %>:8080/MyFlower2.0/pages/adminOrders.jsp" id="allgifts" class="navtext">訂單管理</a>
					</div>
					<!-- 分割線 -->
					<div class="seg"></div>
				</div>
			</div>
		</div>
		<!-- -----------------------------------------------------右邊內容區---------------------------------------------------------------------------- -->
		<div class="content-right">

			<div id='notAdmin' style="display: none;">
				<h1 class="text-danger">非管理員!!!</h1>
				<h3 class="text-danger">無權限瀏覽</h3>
				<a href="../login.jsp" class="btn btn-success">重新登入</a>
			</div>

			<div id="isAdmin" class="">

				<div class="container-fluid mt-3">

					<div class="btnbox">
						<h2>最新消息系統</h2>
						<div class="btnbox2">
							<button class="btn btn-success btn-lg" onclick='createNews();'>新增</button>
							<button class="btn btn-info btn-lg" onclick='updateCell();'>更新</button>
							<button class="btn btn-danger btn-lg" onclick="deleteCell();">刪除</button>
							<button class="btn btn-secondary btn-lg" onclick='cancelAllSelect();'>取消選取</button>
							<!-- 						<a class="btn btn-primary btn-lg" href="AdminHome.html">回管理首頁</a> -->
						</div>
						<input class="form-control searchbox" id="myInput" type="text" placeholder="請輸入關鍵字 ...">
					</div>


<!-- 				<table class="table table-bordered"> -->
					<table class="table">
						<thead>
							<tr>
								<th width="10%" align="center">勾選</th>
								<th width="10%">編號</th>
								<th width="30%">日期</th>
								<th>標題</th>
								<th class="d-none">Content</th>
							</tr>
						</thead>
						<tbody id="myTable">
					<!-- <tr>
                      <td>John</td>
                      <td>Doe</td>
                      <td>john@example.com</td>
                    </tr> -->

						</tbody>
					</table>

					<nav aria-label="Search results pages">
						<ul class="pagination justify-content-center" id="paginationArea">
							<!-- <li class="page-item ">
                        <a class="page-link" id="Previous" href="#" >上一頁</a>
                    </li>

                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>

                    <li class="page-item">
                        <a class="page-link" id="Next" href="#">下一頁</a>
                    </li> -->
						</ul>
					</nav>

					<!-- <p>Note that we start the search in tbody, to prevent filtering the table headers.</p> -->
				</div>
			</div>


				<script>
            $(document).ready(function () {

                $("#myInput").on("keyup", function () {

                    var len = $(this).val().length;
                    var firstWord = $(this).val()[0];
                    var lastWord = $(this).val()[len - 1];
                    if (firstWord == "\"" && lastWord == "\"" && len >= 2) {//如果使用雙引號將會變成絕對搜尋
                        var value = $(this).val();
                        $("#myTable tr").toggle(false);
                        $("#myTable tr").each(function () {

                            $(this).children().each(function (i, v) {

                                if (value.indexOf("\"" + $(this).text() + "\"") > -1) {
                                    $(this).parent().toggle(true);
                                    // console.log("change!!");
                                    $(this).parent().addClass("ShowPage");
                                } else {
                                    $(this).parent().removeClass("ShowPage");
                                }
                            })
                        })
                    } else {
                        var value = $(this).val().toLowerCase();
                        $("#myTable tr").each(function () {//這裡可以把filter改成each，因為這只是單純的為了要在後面逐個執行判斷
                            if ($(this).text().toLowerCase().indexOf(value) > -1) {
                                $(this).toggle(true)    //注意這裡一定要this.toggle
                                $(this).addClass("ShowPage");
                            } else {
                                $(this).toggle(false);
                                $(this).removeClass("ShowPage");
                            }

                        });//如果直接選div.toggle這樣toggle裡面的this判斷為真時，影響效果的是選取的整個div，但我們只要當前的，所以選用this

                    }

                    // $("#myTable tr").each(function () {//這裡可以把filter改成each，因為這只是單純的為了要在後面逐個執行判斷
                    //     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)//注意這裡一定要this.toggle
                    //   });//如果直接選div.toggle這樣toggle裡面的this判斷為真時，影響效果的是選取的整個div，但我們只要當前的，所以選用this


                    paginationCreate();//重新製作頁面標籤



                });
            });

// 參考 toggle https://www.w3school.com.cn/jquery/effect_toggle.asp
//當toggle內為真時，會讓當前的物件或顯示；反之為假時，就會隱藏物件

// 透過indexOf去讀取輸入視窗的內容來判斷要讓什麼物件顯示(true)或隱藏(false)，當使用者輸入欄位為空的時候，所有資料都會為true，也就都會顯示。

// ref: https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_filters_table&stacked=h
        </script>



			</div>

			<div id="dialog" title="更動訂單">
				<form id="hiddenForm" action="" method="POST" style="width: 100%;">
					<label id="newsIdLable">
						NewsId
						<input type="text" id="NewsId" name="NewsId" value="" class="dialogbox" required>
					</label>
					<br>
					<label>
						日期
						<input type="datetime" id="Date" name="Date" value="" class="dialogbox" required>
					</label>
					<br>
					<label>
						標題
						<input type="text" id="Title" name="Title" class="dialogbox" value="">
					</label>
					<br>
<!-- 				<label class="d-flex align-items-start"> -->
					<label class="">
						內容
						<textarea class="" name="Content" id="Content" cols="60" rows="10" value="" style="overflow: scroll;"></textarea>
					</label>
					<br>

				</form>
			</div>
		</div>
</body>
</html>