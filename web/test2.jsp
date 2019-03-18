<%-- 
    Document   : 測試用
    Created on : 2018/5/29, 上午 09:05:53
    Author     : USER
--%>

<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.gtt.service.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ajax = request.getParameter("ajax");
    if(ajax==null){
%>
<!DOCTYPE html>

<html>
        <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
         
        </head>
        <body>
                <%}%>
                <div> 2018 溫布敦 </div>
                
           <iframe width="1680" height="945" src="https://www.youtube.com/embed/IHkC4w4Ozdw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            <%if(ajax==null){%>
        </body>
</html> 
  <%}%>