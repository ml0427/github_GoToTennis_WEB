<%-- 
    Document   : register_ok
    Created on : 2018/5/24, 上午 09:12:30
    Author     : Administrator
--%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
          <head>
                    <title>註冊成功</title>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
                    <!--網頁第一層的 nav_css-->
                    <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                    <!--    網頁第2-1層：LOGO css    -->
                    <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                    <!--網頁第2-2層的 menu_css-->
                    <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
          </head>
<%
              Object obj = request.getAttribute("customer");
              Customer c = null;
              if (obj instanceof Customer) {
                  c = (Customer) obj;
              }
%>
          <body>

                    <!--第一層中的登入登出-->
                    <jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
                    <!--    網頁第2-1層：LOGO 搜尋 購物車    -->
                    <jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
                    <!--第2-2層中的選單-->
                    <jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />

                    <div class="article">
                              <p>
                                        <%= c != null ? c.getName() : ""%>
                                      
                                        ，歡迎成為我們的會員!
                              </p>
                    </div>

          </body>
</html>
