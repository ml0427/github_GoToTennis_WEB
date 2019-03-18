<%-- 
    Document   : register
    Created on : 2018/5/21, 下午 05:42:53
    Author     : Administrator
--%>


<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        Object objMember = session.getAttribute("member");
        Customer member = null;
        if (objMember instanceof Customer) {
                member = (Customer) objMember;
        }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
        <head>
                <title>修改</title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <style>
                        .article{
                                /*background-color: pink;*/
                                width:76%;
                                margin: 0 auto;
                        }  
                        .article label{
                                float: left;
                                width: 100%;
                        }
                        .article input{
                                border: none;
                                background-color: #f4f4f4;
                                width: 460px;
                                height: 40px;
                        }
                        .article p{

                                padding:40px  0 0 0;
                        }
                        #register_input{
                                background-color: #666666;
                                color: white;
                                width: 60px;
                                height: 35px;
                                text-align: center;
                                margin:  0 0 40px 0;
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
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>會員修改   " />
                        <jsp:param name="h2_theSubtitle" value="會員修改" />

                </jsp:include>




                <%
                        Object obj = request.getAttribute("errors");
                        List<String> errors = null;
                        if (obj instanceof List) {
                                errors = (List<String>) obj;
                        }
                %>

                <div style="background-color: white;">
                        <div class="article">
                                <%
                                        if (errors != null && errors.size() > 0) {
                                %>
                                <ol>
                                        <%
                                                for (String err : errors) {
                                        %>
                                        <li><%=err%></li>
                                                <%
                                                        }
                                                %>
                                </ol>
                                <%
                                        }
                                %>
                                <form action="update.do"  method="POST">
                                        <p>
                                                <label for="id">帳號:</label> <input id="id" name="id"
                                                                                   value="<%=request.getParameter("id") == null ? member.getId() : request.getParameter("id")%>"
                                                                                   readonly>
                                        </p>
                                        <p>
                                                <label for="name">姓名:</label> <input id="name" name="name" placeholder="請輸入姓名" required
                                                                                     value="<%=request.getParameter("name") == null ? member.getName() : request.getParameter("name")%>">

                                        </p>
                                        <p>
                                                <label for="password">密碼:</label> <input type="password"
                                                                                         id="password1" name="password1" placeholder="請輸入密碼" required>
                                        </p>
                                        <p>
                                                <label for="password">確認:</label> <input type="password"
                                                                                         id="password2" name="password2" placeholder="請輸入確認密碼" required>
                                        </p>
                                        <p>
                                                <label>性別:</label> <input style="height: auto ;width: auto;float: left;" type="radio" id="male" name="gender" value="<%=Customer.MALE%>" required<%=request.getParameter("gender") != null && request.getParameter("gender").charAt(0) == Customer.MALE || request.getParameter("gender") == null && member.getGender() == Customer.MALE ? "checked" : ""%>>
                                                <label style="height: auto ;width: auto;float: left;" for="male">男</label> 


                                                <input style="height: auto ;width: auto;float: left;" type="radio" id="female"<%=request.getParameter("gender") != null && request.getParameter("gender").charAt(0) == Customer.FEMALE || request.getParameter("gender") == null && member.getGender() == Customer.FEMALE ? "checked" : ""%>>
                                                <label style="height: auto ;width: auto;float: left;" for="female">女</label>
                                        </p>
                                        <p style="clear: both;">
                                                <label style=""email">電郵:</label> <input type="email" id="email"
                                                                                         value="<%=request.getParameter("email") == null ? member.getEmail() : request.getParameter("email")%>"
                                                                                         name="email" placeholder="請輸入電子郵件" required>
                                        </p>
                                        <p>
                                                <label for="birthday">生日:</label> <input type="date" id="birthday"
                                                                                         value="<%=request.getParameter("birthday") == null ? member.getBirthday() : request.getParameter("birthday")%>"
                                                                                         name="birthday" required>
                                        </p>
                                        <p>
                                                <label for="phone">電話:</label> <input type="tel" id="phone"
                                                                                      value="<%=request.getParameter("phone") == null ? member.getPhone() != null ? member.getPhone() : "" : request.getParameter("phone")%>"
                                                                                      name="phone">
                                        </p>
                                        <p>
                                                <label for="address">地址:</label>
                                                <!--<textarea id="address" name="address">台北市</textarea>-->
                                                <input id="address" name="address"
                                                       value="<%=request.getParameter("address") == null ? member.getAddress() != null ? member.getAddress() : "" : request.getParameter("address")%>">
                                        </p>

                                        <p>
                                                <input id="register_input" type="submit" value="確定">
                                        </p>
                                </form>
                        </div>
                </div>
        </body>
</html>


