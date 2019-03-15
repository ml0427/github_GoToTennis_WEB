<%-- 
    Document   : special_offer
    Created on : 2018/6/14, 上午 10:21:38
    Author     : USER
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.gtt.service.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>特價商品</title>


                <!--網頁第一層的 nav_css-->
                <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                <!--    網頁第2-1層：LOGO css    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                <!--網頁第2-2層的 menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />

                <!--第3層中的small_menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/small_menu_css.jsp" />

                <!--網頁第4層：產品搜尋product_select_css -->
                <jsp:include page="/WEB-INF/subviews/picture/product_select_css.jsp" />

                <!--網頁最尾層：footer_css -->
                <jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />
        </head>
        <body>


                <!--第一層中的登入登出-->
                <jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
                <!--    網頁第2-1層：LOGO 搜尋 購物車    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
                <!--第2-2層中的選單-->
                <jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />
                <!--第3層中的small_menu-->
                <jsp:include page="/WEB-INF/subviews/picture/small_menu.jsp" >        
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>特價商品   " />
                        <jsp:param name="h2_theSubtitle" value="特價商品" />

                </jsp:include>


                <%
                        request.setCharacterEncoding("UTF-8");
                        //1. 讀取request中的Form Data
                        String search = request.getParameter("search");

                        System.out.println("search=" + search);

                        if (search == null) {
                                search = "";
                        }
                %>
                <%  //2. 呼叫商業邏輯
                        ProductService service = new ProductService();
                        List<Product> list = new ArrayList<>(); //建立空集合
                        List<Product> list2 = service.findProductByName(search);//"" 將會查詢到全部的產品
                        for (Product p : list2) {
                                if (p.getPrice() <= p.getUnitPrice() / 2) {
                                        list.add(p);
                                }
                        }

                        //使用者選擇的頁數，如果沒有選擇就是第一頁
                        int user_page = 0;
                        if (request.getParameter("ppp") == null) {
                                user_page = 1;
                        } else {
                                user_page = Integer.parseInt(request.getParameter("ppp"));
                        }

                        //設定每一頁輸出的數量         
                        int content_number = 12;
                        //設定顯示頁數的數量   請設定奇數
                        int content_page = 5;

                        //最後一頁有last_content_number筆
                        int last_content_number = list.size() % content_number;
                        //資料總共有all_page頁，如果不整除，頁數+1
                        int all_page = last_content_number == 0 ? (list.size() / content_number) : (list.size() / content_number) + 1;

                        if (list != null && list.size() > 0 && user_page <= all_page) {

                                System.out.println("總共有" + all_page + "頁");
                                if (user_page % content_number == 0) {
                                        System.out.println("總共有" + all_page * content_number + "筆");
                                } else {
                                        System.out.println("總共有" + ((all_page * (content_number - 1)) + last_content_number) + "筆");
                                }

                                int starting_range = 0;//開始範圍
                                int end_range = 0;//結束範圍

                                /*開始範圍*/
                                if (user_page == 0) {//進入首頁沒有選擇頁數
                                        starting_range = 0;
                                } else {//選擇頁數後抓到每頁的第一筆資料位置 
                                        starting_range = user_page * content_number - content_number;
                                }

                                /*結束範圍*/
                                if (user_page == 0) {
                                        end_range = content_number - 1;//沒有選擇，所以只抓第一頁
                                } else if (last_content_number == 0 || user_page != all_page) {//如果沒有餘數資料，或是使用者選擇不是最後一頁
                                        end_range = (user_page * content_number) - 1;
                                } else {
                                        end_range = (user_page * content_number) - content_number + last_content_number - 1;
                                }
                                System.out.println("產品編號開始位置=" + starting_range);
                                System.out.println("產品編號結束位置=" + end_range);
                                //                                                //3.1 顯示產品清單的內容

                %>



                <div class="up_page" style="">

                        <!--<div style="margin: 0 auto; border: 1px pink solid ; width: 60%; height: 50px;">-->
                        <!--跳上一頁+快速跳頁-->
                        <%if (user_page > 1) {%>
                        <a href="?ppp=<%=user_page - 1%>"><</a>
                        <%} else {%>
                        <a><</a>
                        <%}%>  

                        <%--if (user_page > ((content_page + 1) / 2)) {%>
                        <a title="上<%= ((content_page + 1) / 2)%>頁" href="?ppp=<%=user_page - ((content_page + 1) / 2)%>">...</a>
                        <%} else {%>
                        <a>...</a>
                        <%}--%>  
                        <!--處理前面五筆顯示  現在頁數改顏色-->
                        <% if (user_page <= (content_page + 1) / 2) {%>      
                        <!--如果資料庫不足想要顯示的頁數== 當資料數少於五筆時，不要顯示多於頁數....-->
                        <%if (content_number * content_page > list.size()) {  %>   
                        <%for (int i = 1; i <= (list.size() % content_number == 0 ? (list.size() / content_number) : (list.size() / content_number) + 1); i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff; " href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> <!--現在頁面背景改成藍色-->
                        <%} else {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>
                        <%} else {%>
                        <%for (int i = 1; i <= content_page; i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff; " href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> <!--現在頁面背景改成藍色-->
                        <%} else {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>
                        <%}%>
                        <!--處理中間圖示處理   現在頁數改顏色並保持在正中間-->              
                        <%} else if (user_page > ((content_page + 1) / 2) && user_page < all_page - (((content_page + 1) / 2) - 1)) {%>
                        <%for (int i = 1; i <= all_page; i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff;" href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> <!--現在頁面背景改成藍色-->
                        <%} else {%>
                        <%if (i >= user_page - (((content_page + 1) / 2) - 1) && i <= user_page + (((content_page + 1) / 2) - 1)) {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>  
                        <%}%>
                        <!--處理最後五筆顯示  現在頁數改顏色-->
                        <%} else {%>
                        <%for (int i = all_page - content_page + 1; i <= all_page; i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff;" href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> 
                        <%} else {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>
                        <%}%>                      
                        <!--跳下一頁+快速跳頁-->
                        <%--if (user_page < all_page - ((content_page + 1) / 2)) {%>
                        <a title="下<%= ((content_page + 1) / 2)%>頁" href="?ppp=<%=user_page + ((content_page + 1) / 2)%>">...</a>
                        <%} else {%>
                        <a>...</a>
                        <%}--%>  
                        <%if (user_page <= all_page - 1) {%>
                        <a  href="?ppp=<%=user_page + 1%>">></a>
                        <%} else {%>
                        <a>></a>
                        <%}%>  
                </div>




                <div class="article">
                        <div class="pro">
                                <ul id="product_list">                
                                        <%
                                                for (; starting_range <= end_range; starting_range++) {
                                                        if (list.get(starting_range).getPrice() <= list.get(starting_range).getUnitPrice() / 2) {
                                                                System.out.println("售價=" + list.get(starting_range).getPrice() + "\n定價/2=" + list.get(starting_range).getUnitPrice() / 2);
                                        %>  
                                        <li >
                                                <a href="product.jsp?productId=<%= list.get(starting_range).getId()%>" class="hover"><img src="<%= list.get(starting_range).getPhotoUrl()%>"><img src="<%= list.get(starting_range).getPhotoUrl2()%>"></a>
                                                <h5 style="padding: 234px 0 0 0 ;"><%= list.get(starting_range).getName()%></h5>
                                                <div >
                                                        <samp style="text-decoration:line-through;">原價$<%= Math.round(list.get(starting_range).getUnitPrice())%></samp> <!--定價-->
                                                        <samp style="background-color: peachpuff;" >優惠價$<%= Math.round(list.get(starting_range).getPrice())%></samp><!--售價-->


                                                </div>
                                        </li>                
                                        <% }
                                                }%>
                                </ul>
                                <% } else { %>
                                <p>查無符合名稱的產品資料</p>
                                <% }%>

                        </div>
                </div>

                <div class="page">
                        <!--<div style="margin: 0 auto; border: 1px pink solid ; width: 60%; height: 50px;">-->


                        <!--跳上一頁+快速跳頁-->
                        <%if (user_page > 1) {%>
                        <a href="?ppp=<%=user_page - 1%>"><</a>
                        <%} else {%>
                        <a><</a>
                        <%}%>  

                        <%--if (user_page > ((content_page + 1) / 2)) {%>
                        <a title="上<%= ((content_page + 1) / 2)%>頁" href="?ppp=<%=user_page - ((content_page + 1) / 2)%>">...</a>
                        <%} else {%>
                        <a>...</a>
                        <%}--%>  


                        <!--處理前面五筆顯示  現在頁數改顏色-->
                        <% if (user_page <= (content_page + 1) / 2) {%>      
                        <!--如果資料庫不足想要顯示的頁數== 當資料數少於五筆時，不要顯示多於頁數....-->
                        <%if (content_number * content_page > list.size()) {  %>   
                        <%for (int i = 1; i <= (list.size() % content_number == 0 ? (list.size() / content_number) : (list.size() / content_number) + 1); i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff; " href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> <!--現在頁面背景改成藍色-->
                        <%} else {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>
                        <%} else {%>
                        <%for (int i = 1; i <= content_page; i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff; " href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> <!--現在頁面背景改成藍色-->
                        <%} else {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>
                        <%}%>



                        <!--處理中間圖示處理   現在頁數改顏色並保持在正中間-->              
                        <%} else if (user_page > ((content_page + 1) / 2) && user_page < all_page - (((content_page + 1) / 2) - 1)) {%>
                        <%for (int i = 1; i <= all_page; i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff;" href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> <!--現在頁面背景改成藍色-->
                        <%} else {%>
                        <%if (i >= user_page - (((content_page + 1) / 2) - 1) && i <= user_page + (((content_page + 1) / 2) - 1)) {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>  
                        <%}%>


                        <!--處理最後五筆顯示  現在頁數改顏色-->
                        <%} else {%>
                        <%for (int i = all_page - content_page + 1; i <= all_page; i++) {
                                        if (i == user_page) {%>
                        <a style="background-color: #9999ff;" href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a> 
                        <%} else {%>
                        <a href="?search=<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>&ppp=<%=i%>"><%=i%></a>
                        <%}%>  
                        <%}%>
                        <%}%>                      


                        <!--跳下一頁+快速跳頁-->
                        <%--if (user_page < all_page - ((content_page + 1) / 2)) {%>
                        <a title="下<%= ((content_page + 1) / 2)%>頁" href="?ppp=<%=user_page + ((content_page + 1) / 2)%>">...</a>
                        <%} else {%>
                        <a>...</a>
                        <%}--%>  
                        <%if (user_page <= all_page - 1) {%>
                        <a  href="?ppp=<%=user_page + 1%>">></a>
                        <%} else {%>
                        <a>></a>
                        <%}%>  



                        <!--</div>-->


                </div>


                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>
