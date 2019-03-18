<%-- 
    Document   : nav
    Created on : 2018/5/29, 上午 02:19:55
    Author     : USER
--%>

<%@page import="uuu.gtt.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            Object obj = session.getAttribute("member");
            Customer member = null;
            if (obj instanceof Customer) {
                        member = (Customer) obj;
            }
%>  
<!--    網頁第一層：登入登出註冊等連結    -->
<div class="nav" style=""> 
          <!--                              <a href="http://inst:8084/gtt/">首頁</a> | -->
          <!--                              <a href="products_list.jsp">產品清單</a> | -->
          <span style="width: 100%;">
                    <% if (member == null) {%>
                    <a href="javascript:login()">登入</a>
                    <a href="register.jsp">加入會員</a>

                    <%} else {%>
                     <a href="<%= request.getContextPath()%>/member/viewlog.jsp">觀看紀錄</a>
                    <a href="<%= request.getContextPath()%>/member/orders_history.jsp">歷史訂單</a>
                    <a href="<%= request.getContextPath()%>/member/update.jsp">會員修改</a>
                    <a href="<%= request.getContextPath()%>/member/logout.do">登出</a>              
                    <%}%>
                    <p style="float: right;">你好! <%= member != null ? member.getName() : ""%></p>
          </span>
</div>
