<%-- 
    Document   : products_list
    Created on : 2018/5/22, 上午 11:39:27
    Author     : Administrator
--%>


<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="uuu.gtt.service.ProductService"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <title>產品品牌</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <style>
                        .category_list{
                                padding: 50px 0 0 0;

                                background-color: white;
                        }
                        .category_list h3{
                                text-align: center;
                                background-color: #666666;
                                line-height: 30px;
                                height:30px;


                        }

                        .category_list a{

                                color: white;
                                text-decoration: none
                        }
                        .category_list a:hover{
                                color: #ff9933;
                        }
                        .category_list img{
                                width: 100%;
                        }
                        .category_list div{
                                /*                                text-align: center;*/

                                width: 50%;
                                float: left;
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
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>產品品牌   " />
                        <jsp:param name="h2_theSubtitle" value="產品品牌" />

                </jsp:include>
                <%
                        request.setCharacterEncoding("UTF-8");
                        int content_number = 10;
                        if (request.getParameter("content_number") == null) {
                                content_number = 10;
                        } else {
                                content_number = Integer.parseInt(request.getParameter("content_number"));
                        }
                %>
                <div >
                        <div class="category_list" >
                                
                                
                                <div >
                                        <a href="/gtt/products_list.jsp?name=WILSON&category=&ppp=1&content_number=<%= content_number%>">

                                                <img src="http://nanda.menet.com.tw/images/category_images/o/4557591123.jpg" alt="">

                                                <h3>WILSON</h3>

                                        </a>
                                </div>
                                <div>
                                        <a href="/gtt/products_list.jsp?name=HEAD&category=&ppp=1&content_number=<%= content_number%>">

                                                <img src="http://nanda.menet.com.tw/images/category_images/o/3317959527.jpg" alt="">

                                                <h3>HEAD</h3>

                                        </a>
                                </div>
                                <div>
                                        <a href="/gtt/products_list.jsp?name=WILSON&category=&ppp=1&content_number=<%= content_number%>">

                                                <img src="http://nanda.menet.com.tw/images/category_images/o/9123240808.jpg" alt="">

                                                <h3>Babolat</h3>

                                        </a>
                                </div>
                                <div>
                                        <a href="/gtt/products_list.jsp?name=Babolat&category=&ppp=1&content_number=<%= content_number%>">
                                                <img src="http://nanda.menet.com.tw/images/category_images/o/5579293533.jpg" alt="">
                                                <h3>YONEX</h3>
                                        </a>
                                </div>
                        </div>
                </div>
                                                <hr>                          


                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />



        </body>
</html>
