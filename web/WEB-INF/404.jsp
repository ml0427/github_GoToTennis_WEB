<%-- 
    Document   : 404
    Created on : 2018/5/29, 下午 03:50:55
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
          <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>404</title>
                    <style>



                              body{

                                          font-size: 30px;
                              }
                    </style>
                    <!--網頁第一層的 nav_css-->
                    <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                    <!--    網頁第2-1層：LOGO css    -->
                    <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                    <!--網頁第2-2層的 menu_css-->
                    <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
          </head>
          <body>

                    <!--第一層中的登入登出-->
                    <jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
                    <!--    網頁第2-1層：LOGO 搜尋 購物車    -->
                    <jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
                    <!--第2-2層中的選單-->
                    <jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />

                    <div style="background-color: white; position: relative ;">
                              <img  style="width:100%;float: left;" src="/gtt/IMG/Breaking racket2.png">

                              <h1 style="position: absolute; " ><br>找不到網頁<br>404...</h1>
                              <p style="clear: both;"></p>
                    </div>


          </body>
</html>
