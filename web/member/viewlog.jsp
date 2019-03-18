<%-- 
    Document   : viewlog
    Created on : 2018/6/13, 下午 04:54:53
    Author     : Administrator
--%>

<%@page import="uuu.gtt.entity.ViewLog"%>
<%@page import="uuu.gtt.service.ViewLogService"%>
<%@page import="java.util.List"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        Customer member = (Customer) session.getAttribute("member");
        List<ViewLog> list = null;
        if (member != null) {
                ViewLogService service = new ViewLogService();
                list = service.findViewLOgByCustomerEmail(member.getEmail());
        }
%>
<html>
        <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>觀看紀錄</title>

                <!--網頁第一層的 nav_css-->
                <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                <!--    網頁第2-1層：LOGO css    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                <!--網頁第2-2層的 menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />

                <!--第3層中的small_menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/small_menu_css.jsp" />



                <%--<!--網頁第三層：圖片輪播 banner_img2_css-->
                <%-- <jsp:include page="/WEB-INF/subviews/banner_img_css2.jsp" />--%>
                <!--網頁第4層：產品搜尋product_select_css -->
                <jsp:include page="/WEB-INF/subviews/picture/product_select_css.jsp" />

                <!--網頁最尾層：footer_css -->
                <jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />


                <style>
                        .article{

                                background-color: #eee;
                        }
                        .article_2{
                                text-align: left;
                                margin: 0 auto;
                                width: 90%;
                        }

                        .discriptionimg{
                                position: relative;
                                height: 250px;
                                text-align: left;

                        }
                        .label{
                                text-align: center;
                                height: 40px;
                                line-height: 40px;
                                color: white;
                                background-color: #999999;
                        }




                        /*                        .cart_number{
                                                        line-height: 24px;
                                                        margin: 0 auto;
                                                        text-align: center;
                                                        width: 24px;
                                                        height: 24px;
                                                        background-color: #bbb;
                                                        color: white;
                                                }
                        */
                        .again_input{
                                position: absolute;
                                right: 0;
                                top:210px;
                                border: 1px black solid;
                                font-size: 16px;
                                width: 90px;
                                height: 35px;
                                line-height: 35px;
                                text-align: center;
                                text-decoration: none; 
                                background-color: #666666;
                                color: white;
                        }
                </style>
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
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>觀看紀錄   " />
                        <jsp:param name="h2_theSubtitle" value="觀看紀錄" />

                </jsp:include>


                <div class="article">
                        <div class="article_2">

                                <% if (list != null && list.size() > 0) {%>
                                <%int a = 0;%>
                                <% for (int i = list.size() - 1; i > 0&& a < 10; i--,a++) {%>

                                <div style="float: left; width: 100%;">
                                        <div class="discriptionimg">

                                                <a href="<%= request.getContextPath()%>/product.jsp?productId=<%= list.get(i).getProduct().getId()%>">
                                                        <img style="width: 20%;float: left;" src="<%= list.get(i).getProduct().getPhotoUrl()%>">
                                                </a>

                                                <div class="label"><%=list.get(i).getProduct().getName()%></div><br>
                                                <div>

                                                        <%=list.get(i).getProduct().getDescription().length() < 130 ? list.get(i).getProduct().getDescription().substring(0, list.get(i).getProduct().getDescription().length()) : list.get(i).getProduct().getDescription().substring(0, 120) + "......"%>


                                                </div><br>
                                                <div style="position: absolute;right: 100px;top:220px;">遊覽時間：<%= list.get(i).getViewtime()%></div>
                                                <a href="<%= request.getContextPath()%>/product.jsp?productId=<%= list.get(i).getProduct().getId()%>">
                                                        <div  class="again_input">前往購物</div>
                                                </a>
                                        </div>
                                </div>
                                <hr> 

                                <%}%>
                                <%} else {%>
                                <p>查無觀看紀錄</p>
                                <%}%>
                        </div>
                </div>
                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>
