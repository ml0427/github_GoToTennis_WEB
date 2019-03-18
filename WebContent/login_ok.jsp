<%-- 
    Document   : login_ok
    Created on : 2018/5/21, 下午 03:40:40
    Author     : Administrator
--%>

<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object o = session.getAttribute("member");
    Customer c = null;
    if (o instanceof Customer) {
        c = (Customer) o;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>登入成功</title>        
    </head>
    <body>
        <div class="header">
            <h1>非常好書 <sub>歡迎</sub></h1>            
        </div>
        <div class="nav">
            <a href="index.jsp" style="display: initial">首頁</a> | 
            <a href="register.jsp" style="display: inline">註冊</a> | 
            <a href="login.jsp">登入</a>            
            <hr>
        </div>
        <div class="article">        
            <h1>登入成功! <% out.print(c==null?"":c.getName());
                %></h1>
            <p>登入時間: <% out.println(LocalDateTime.now());%></p>
        </div>
        <div class="footer">
            <hr>
            版權所有 &copy; 非常好書
        </div>        
    </body>
</html>
