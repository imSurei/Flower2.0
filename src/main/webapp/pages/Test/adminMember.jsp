<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% StringBuffer basePath = request.getRequestURL(); %>
<% String path = request.getScheme() + "://" + request.getServerName(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員管理．Flower Forever</title>
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

<!-- -------- 和豐的外掛連結 -------- -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<link href="css/adminMember.css" rel="stylesheet" />

<!-- 以下會顯現表格 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="icon" href="pics/logo/Icon_Logo.png" />


<script type="text/javascript">

$(function(){
	  $(".header").load("header.jsp");
	  //bootstrap與Jquery UI 按鈕樣式衝突的解決辦法/
	  bootstrapButton = $.fn.button.noConflict(); 
	  $.fn.bootstrapBtn = bootstrapButton; 
	 });


/* 和豐的 JavaScript */

        function accountAlreadyExists(account) {
            let array = [];
            $("tbody tr td:nth-child(2)").each(function () {
                let data = $(this).text();
                // console.log(data);
                array.push(data);
            })

            return array.indexOf(account) != -1;
        }
        function fixAccountField() {
            let bool = $("#account")[0].disabled;
            if (bool == true) {
                bool = false;
            }
        }
        function cancelAllSelect() {
            $('tbody tr td input[type="checkbox"]:checked').each(function () {
                this.checked = false;
            })
        }
        function ValidateEmail(mail) {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
                return (true)
            }
            alert("Email格式錯誤!!!");
            return (false)
        }

        function resetDialog() {
            $("#name").val("");
            $("#account").val("");
            $("#password").val("");
            $("#email").val("");
            $("#birthDate").val("");

            let checkedRadio = $("#hiddenForm input[type='radio']:checked")[0]
            if (checkedRadio != undefined) {
                checkedRadio.checked = false;
            }

            $("#address").val("");
            $("#phone").val("");
            $("select").val("");

            fixAccountField();

        }

        function updateCell() {
            let ln = $("input:checked").length;
            if (ln > 1) {
                alert("一次只能更新一筆資料!!!");
            } else if (ln < 1) {
                alert("請選取一筆資料");
            } else {
                resetDialog();
                document.querySelector("#ui-id-1").innerText = "更新會員";


                let updateList = ['name', 'account', 'password', 'email', 'birthDate', 'gender', 'address', 'phone', 'status'];
                var dataJSON = {};

                for (i = 1; i < 10; i++) {
                    dataJSON[updateList[i - 1]] = $("input:checked").parent().parent().children().eq(i)[0].innerText;
                }

                $("#name").val(dataJSON["name"]);
                $("#account").val(dataJSON["account"]);
                $("#password").val(dataJSON["password"]);
                $("#email").val(dataJSON["email"]);
                $("#birthDate").val(dataJSON["birthDate"]);

                if (dataJSON["gender"] != "" && dataJSON["gender"] != "null") {
                    $(`#hiddenForm input[value=${dataJSON["gender"]}]`)[0].checked = true;
                }

                $("#address").val(dataJSON["address"]);
                $("#phone").val(dataJSON["phone"]);
                $("select").val(dataJSON["status"]);

                $("#account")[0].disabled = true;

                $("#dialog").dialog("open");


            }

        }

        function deleteCell() {
            let ln = $("input:checked").length;
            for (i = 0; i < ln; i++) {
                let deleteAccount = $("input:checked").parent().parent().eq(i).children().eq(2)[0].innerText;
                console.log("刪除帳號:" + deleteAccount);

                let url = "http://localhost:8080/IIIProject/DeleteMember";

                $.ajax({
                    type: "POST",
                    url: url,
                    data: { account: deleteAccount },
                    success: function () {

                    }
                });
            }
            alert("執行刪除!!");
            updateTable();//重新更新表格內容

        }


        function updateTable() {
            fetch("http://localhost:8080/IIIProject/AllMember").then(e => e.json()).then(
                function (res) {
                    // console.log(res);
                    let ln = res.length;
                    let tableString = "";
                    let checkbox = '<input type="checkbox" onclick="" style="height:30px;width:30px">';

                    for (i = 0; i < ln; i++) {
                        tableString += `<tr><td class="text-center">${checkbox}</td><td>${res[i][0]}</td><td>${res[i][1]}</td><td>${res[i][2]}</td><td>${res[i][3]}</td><td>${res[i][4]}</td><td>${res[i][5]}</td><td>${res[i][6]}</td><td>${res[i][7]}</td><td>${res[i][8]}</td></tr>`;
                    }
                    $("tbody").html(tableString);
                    $("#myInput").val("");

                    $("#myTable tr").addClass("ShowPage");//目前應該要呈現的所有資料，全部頁面的資料。如果有使用過濾，則會移除不符合條件的tr的class - ShowPage(做分頁籤用)
                    paginationCreate();//更新分頁籤
                })
        }

        $(function () {
        	
        	
        /* 	$(".footer").load("footer.html"); */
        	
            $("#CallBackUrl").val(document.URL);
            
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
          	    width: 340,
                show: {
                    effect: "blind",
                    duration: 500
                },
                hide: {
                    effect: "blind",
                    duration: 500
                },
                open: function () {
                    let actionStatus = document.querySelector("#ui-id-1").innerText;
                    if (actionStatus == "新增會員") {
                        $("#account").removeAttr('disabled');
                    }

                },
                close: function () {
                    resetDialog();
                },
                buttons: {
                    "確認": function () {
                        let status = $("select").val();
                        let name = $("#name").val();
                        let account = $("#account").val();
                        let password = $("#password").val();
                        let email = $("#email").val();

                        if (status != '') {
                            let actionStatus = document.querySelector("#ui-id-1").innerText;
                            if (actionStatus == "新增會員") {
                                $('#hiddenForm').attr("action", "http://localhost:8080/IIIProject/SignUp.jsp");
                            } else if (actionStatus == "更新會員") {
                                $('#hiddenForm').attr("action", "http://localhost:8080/IIIProject/UpdateMember");
                            }

                            if (account != "" && name != "" && password != ""
                                && email != "") {
                                if (ValidateEmail($("#email").val()) == true) {
                                    if (document.querySelector("#ui-id-1").innerText == "新增會員") {
                                        let bool = accountAlreadyExists($("#account").val());
                                        if (bool == true) {
                                            alert("該會員帳號已經存在!!!");
                                            return;
                                        }
                                    }
                                    $("#account").removeAttr('disabled');
                                    $("#hiddenForm").submit();
                                }

                            } else {
                                alert("必填項目:Name,Account,Password,Email !");
                            }

                        } else {
                            alert("未選擇身份!");
                        }


                    },
                    "取消": function () {
                        resetDialog();
                        $(this).dialog("close");
                    }
                }
            });
            
//  ---------------控制新增 彈出視窗屬性 和 CSS "輸入關鍵字" 欄位長度修改區---------------

            $("label").css("width", "300px");
            $("label").addClass("text-left");
            $("input").css("width", "300px");
            $("label").eq(5).addClass("text-left");
            $("input[type='radio']").css({ "width": "50px" });
            $("label").eq(5).css({ "margin": "10px 0px 10px"});

        })

        function createMember() {
            resetDialog();
            document.querySelector("#ui-id-1").innerText = "新增會員";
            $("#dialog").dialog("open");
        }
    </script>
</head>
<!-- <body style="background: #ecf0f1;"> -->
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
						<h2>會員管理系統</h2>
						<div class="btnbox2">
							<button class="btn btn-success btn-lg" onclick='createMember();'>新增</button>
							<button class="btn btn-info btn-lg" onclick='updateCell();'>更新</button>
							<button class="btn btn-danger btn-lg" onclick="deleteCell();">刪除</button>
							<button class="btn btn-secondary btn-lg" onclick='cancelAllSelect();'>取消選取</button>
<!-- 						<a class="btn btn-primary btn-lg" href="AdminHome.html">回管理首頁</a> -->
						</div>
						<input class="form-control searchbox" id="myInput" type="text" placeholder="請輸入關鍵字 ...">
					</div>

					<table class="table">
						<thead>
							<tr>
								<th align="center">勾選</th>
								<th align="center">姓名</th>
								<th align="center">帳號</th>
								<th align="center">密碼</th>
								<th align="center">信箱</th>
								<th align="center">生日</th>
								<th align="center">性別</th>
								<th align="center">地址</th>
								<th align="center">電話</th>
								<th align="center">權限</th>
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
						</ul>
					</nav>
					
					<!-- <p>Note that we start the search in tbody, to prevent filtering the table headers.</p> -->
				
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

			<div id="dialog" title="新增會員" class="dialog">
				
					<form id="hiddenForm" action="" method="POST" style="width: 100%;">
						<label>
							Name
							<input type="text" id="name" name="name" value="" required>
						</label>
						<br>
						<label>
							Account
							<input type="text" id="account" name="account" value="" required>
						</label>
						<br>
						<label>
							Password
							<input type="password" id="password" name="password" value="" required>
						</label>
						<br>
						<label>
							Email
							<input type="email" id="email" name="email" value="" required>
						</label>
						<br>
						<label>
							BirthDate
							<input type="date" id="birthDate" name="birthDate" value="">
						</label>
						<br>
						<label>
							Gender
							<input type="radio" name="gender" value="man">
							男
							<input type="radio" name="gender" value="woman">
							女
						</label>
						<br>
						<label>
							Address
							<input type="text" id="address" name="address" value="">
						</label>
						<br>
						<label>
							Phone
							<input type="text" id="phone" name="phone" value="">
						</label>
						<br>
						<select name="status" required>
							<option value="" selected>選擇身份</option>
							<option value="member">一般會員</option>
							<option value="admin">管理員</option>
						</select>
						
						<input type="hidden" name="page" value="admin">
						<input type="hidden" name="callBackUrl" id="CallBackUrl" value="">
					</form>
				</div>
				
			</div>
		</div>
		
<!-- Footer Area -->
<div class="footer"></div>
</body>
</html>