<%-- 
    Document   : small_menu
    Created on : 2018/6/9, 下午 12:58:48
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<style>
        .small_menu{
                
                background-image: url( <%= "/gtt/IMG/samll_menu/f-n.jpg" %>) ;
                
                
        }
        
        
</style>-->

<div class="small_menu">
        <h2><%= request.getParameter("h2_theSubtitle") == null ? "" : request.getParameter("h2_theSubtitle")%></h2>

        <sub style="width: 110px;height: 10px;"> </sub>
        <sub><%= request.getParameter("name") == "" || request.getParameter("name") == null ? "" : ">" + request.getParameter("name")%></sub>

        <%
                String category_CH = "";
                if ("vibration".equals(request.getParameter("category"))) {
                        category_CH = "避震器";
                }else  if ("racket".equals(request.getParameter("category"))) {
                        category_CH = "球拍";
                }else  if ("ball".equals(request.getParameter("category"))) {
                        category_CH = "球";
                }else  if ("line".equals(request.getParameter("category"))) {
                        category_CH = "球線";
                }else  if ("grip".equals(request.getParameter("category"))) {
                        category_CH = "握把布";
                }else{
                }
        %>

        <sub><%= request.getParameter("category") == "" || request.getParameter("category") == null ? "" : ">種類：" + category_CH %></sub>
        <sub><%= request.getParameter("theSubtitle") == null ? "<a>首頁</a>" : request.getParameter("theSubtitle")%></sub>

        

</div>
