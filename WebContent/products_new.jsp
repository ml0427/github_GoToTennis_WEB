<%-- 
    Document   : products_list
    Created on : 2018/5/22, 上午 11:39:27
    Author     : Administrator
--%>

<%@page import="uuu.gtt.service.ProductService"%>
<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <title>產品清單</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <style>

                        /*產品清單區塊*/
                        #product_list{
                                text-align: center;
                        }

                        #product_list li{

                                display: inline-table;
                                width: 250px;
                                min-height: 300px;
                                margin:10px; 
                                box-shadow: lightgray 2px 2px 10px;
                        }
                        #product_list li img{width:150px}

                        .pro{
                                background: white;
                        }

                </style>   



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
                <!--第二層中的選單-->
                <jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />
                <!--第3層中的small_menu-->
                <jsp:include page="/WEB-INF/subviews/picture/small_menu.jsp" >        
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>新進產品   " />
                        <jsp:param name="h2_theSubtitle" value="新進產品" />

                </jsp:include>



                <!--新進商品-->
                <div style="background-color: white;">
                        <%
                        	request.setCharacterEncoding("UTF-8");
                                                                                //1. 讀取request中的Form Data
                                                                                String search = request.getParameter("search");
                                                                                //                                          System.out.println("search=" + search);
                                                                                if (search == null) {
                                                                                        search = "";
                                                                                }
                                                                                ProductService service = new ProductService();
                                                                                List<Product> list = service.findProductByName(search); //"" 將會查詢到全部的產品
                        %>
                        <ul id="product_list">                
                                <%
                                        if (list != null && list.size() > 0) {
                                                for (int i = list.size() - 1; list.size() - 19 < i; i--) {
                                %>  
                                <li style="height: 350px; box-shadow:none;">
                                        <div style="position: absolute; z-index: 1;right: 0;background-color: #6699ff;color: white; opacity:0.7;width: 50px; height: 30px;line-height: 30px;">NEW</div>
                                        <a href="product.jsp?productId=<%= list.get(i).getId()%>" class="hover"><img src="<%= list.get(i).getPhotoUrl()%>"><img src="<%= list.get(i).getPhotoUrl2()%>"></a>

                                        <h5 style="padding: 234px 0 0 0 ;"><%= list.get(i).getName()%></h5>
                                        <div >
                                                <samp style="text-decoration:line-through;">原價$<%= Math.round(list.get(i).getUnitPrice())%></samp> 
                                                <samp style="background-color: peachpuff;" >優惠價$<%= Math.round(list.get(i).getPrice())%></samp>

                                        </div>
                                </li>                
                                <% }%>
                        </ul>
                        <% } else { %>
                        <p>查無符合名稱的產品資料</p>
                        <% }%>
                </div>


                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />



        </body>
</html>
