<%-- 
    Document   : register
    Created on : 2018/5/21, 下午 05:42:53
    Author     : Administrator
--%>

<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
        <head>
                <title>註冊</title>
                <meta charset="UTF-8"/>
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
                
                
                                <!--網頁最尾層：產品搜尋footer_css -->
                <jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />
<!--                <script>


                        function getProductPage(productId) {

                                //非同步請求:
                                $.ajax({
                                        url: "product.jsp?ajax=true&productId=" + productId,
                                        method: 'GET'
                                }).done(getProductPageDoneHandler);
                        }
                        function getProductPageDoneHandler(result) {
                                console.log(result);
                                $("#product_detail").html(result);
                                $.fancybox.open({
                                        src: '#product_detail', type: 'inline'
                                                //                    ,opts: {
                                                //                        afterShow: function (instance, current) {
                                                //                            console.info('done!');
                                                //                        }
                                                //                    }
                                });
                        }

       
                </script>-->

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
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>會員註冊   " />
                        <jsp:param name="h2_theSubtitle" value="會員註冊" />
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
                                        <% for (String err : errors) {%>

                                        <li>${errors}</li>

                                        <%}%>
                                </ol>

                                <%  } else {%>


                                <%  }%>
                                <form action="register.do" method="POST">
                                        <p>
                                                <label for="email">Email:</label>
                                                <input id="email" name="email" value="${param.email}" placeholder="請輸入信箱" pattern="[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}" required>
                                        </p>    


                                        <p>
                                                <label for="id">身分證號:</label>
                                                <input id="id" name="id" value="${param.id}" placeholder="請輸入身分證號" pattern="[A-Z][12][0-9]{8}" required>
                                        </p>                
                                        <p>
                                                <label for="name">姓名:</label>
                                                <input id="name" name="name" value="${param.name}" placeholder="請輸入姓名" required>
                                        </p>
                                        <p>
                                                <label for="password">密碼:</label>
                                                <input type="password" id="password1" name="password1" placeholder="請輸入密碼" required>
                                        </p>
                                        <p>
                                                <label for="password">確認:</label>
                                                <input type="password" id="password2" name="password2" placeholder="請輸入確認密碼" required>
                                        </p>
                                        <p >
                                                <label >性別:</label>
                                                <input  style="height: auto ;width: auto;float: left;"  type="radio" id="male" name="gender" value="<%= Customer.MALE%>" required 
                                                        <%= request.getParameter("gender") != null && request.getParameter("gender").charAt(0) == Customer.MALE ? "checked" : ""%> >
                                                <label style="height: auto ;width: auto;float: left;"   for="male">男</label>

                                                <input style="height: auto ;width: auto;float: left;" type="radio" id="female" name="gender" value="${Customer.FEMALE} %>" required ${param.gender == String.valueOf(Customer.FEMALE)?"checked":""} >
                                                <label style="height: auto ;width: auto;float: left;" for="female">女</label>
                                        </p>    

                                        <p style="clear: both;">
                                                <label  for="birthday">生日:</label>
                                                <input  type="date" max='<%= LocalDate.now()%>' id="birthday" value="${param.birthday}" name="birthday" required>
                                        </p>           


                                        <p>
                                                <label for="phone">電話:</label>
                                                <input type="tel" id="phone" value="${param.phone}" name="phone">
                                        </p>                
                                        <p>
                                                <label for="address">地址:</label>
                                                <!--<textarea id="address" name="address">台北市</textarea>-->
                                                <input id="address" name="address" value="${param.address}" >
                                        </p>  


                                        <p>
                                                <input  id="register_input" type="submit" value="確定">
                                        </p>
                                </form>
                        </div>
                </div>
                                                        <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>


