<%-- 
    Document   : redirect
    Created on : 2018/6/1, 上午 10:18:15
    Author     : Administrator
--%>


<%@page import="uuu.gtt.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

            /*
                        Session 的使用方法和介紹
                        可以不使用form來達到傳值的效果
                        在session沒有消失前都可以在同一個web裡存活
                        一般使用在判斷使用者帳號權限,或共享資料
             */
            Object objMember = session.getAttribute("member");  //取得使用者輸入資料
            Customer member = null;//取得會員格式架構，並清空資料
            if (objMember instanceof Customer) { //如果使用者是會員
                        member = (Customer) objMember;//
            }

            if (member == null) {//如果不是會員
                        session.setAttribute("previous.uri", request.getRequestURI());
                        response.sendRedirect(request.getContextPath() + "/login.jsp");
                        return;
            }
%>