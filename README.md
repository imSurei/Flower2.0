# Flower2.0

《Flower Forever》是一個花束購物網站，1.0版是轉職培訓、在資策會完成的小組畢業作品。2.0版僅保留1.0版的前端HTML頁面程式。除此之外，後端java程式，包括會員登錄、註冊，商品展示，加入購物車，結帳生成訂單，以及後端管理系統CRUD等所有功能實現全部重寫，皆獨立完成。

專案採用MVC架構，使用JDBC連接DB，Servlet作為Controller接收前端頁面發來的各類請求、調用Dao層操作DB、再使用JSP回傳資料給前端。

《Flower Forever》2.0版特點：
1. 連結DB時，導入Druid Jar檔。初始化Connection Pool的連接數，使用靜態方法取得連線，達到同台機器的請求拿的是同根連線，提高性能。
2. 2. 商品、訂單、用戶等每個模組，只編寫一個Servlet來實現該模組的所有功能。抽象出BaseServlet extends HttpServlet，接收前端JSP頁面發來的業務名稱，通過JAVA反射機制調用BaseServlet相應的各模組繼承子類別，其各模組Servlet內的方法名稱即是業務名稱。
3. 部分前端頁面使用AJAX技術，同步載入資料。
(以下為該作品的部分截圖)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/1.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/2.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/3.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/4.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/5.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/6.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/7.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/8.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/9.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/10.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/11.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/12.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/13.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/14.png)

![image](https://github.com/imSurei/Flower2.0/blob/main/pics/15.png)

