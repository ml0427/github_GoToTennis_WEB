<%-- 
    Document   : logo
    Created on : 2018/5/30, ?? 01:09:19
    Author     : USER
--%>
<%@page import="uuu.gtt.entity.Cart"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%
	Customer member = (Customer) session.getAttribute("member");

            Object objCart = session.getAttribute("cart");
            Cart cart = null;
            if (objCart instanceof Cart) {
                        cart = (Cart) objCart;
                        cart.setMember(member);
                        
            }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!--    網頁第2-1層：LOGO 信箱 電話     -->
<!--LOGO-->
<div class="logo"style="float: left;">
          <div >
                  <a href="/gtt/" ><img style="height: 80px; margin: 5px;" src="/gtt/IMG/logo2-2.png" alt=""></a>
          </div>
</div>
<!--信箱 電話-->
<div class="service"style="float: right;width:49%;min-width: 360px;">
          <div class="additional-menu">
                    <ul>
                              <li>☎ (02)888-8888</li>
                              <li><a href="mailto:ml0427@gmail.com" >✉ml0427@gmail.com</a></li>
                    </ul>
          </div>
</div>

<div style="float: right;width:49%;min-width: 400px;" >
          <!--購物車-->
          <div class="cart">
                    <div>
                              <a href="<%= request.getContextPath() %>/member/cart.jsp" >購物車：<%=cart==null?0:cart.getSize()%> 項商品</a>
                    </div>
          </div>
          
          <!--搜尋-->
          <nav class="top-search" >
                    <!--from的id刪掉就無法查詢了，為什麼?-->
                    <!--而在JSP页面使用javascript的时候用ID属性，但是在后台通过Request取值的时候用的是name属性。问题就处在这里-->
                    <form  action="products_list.jsp" method="GET" id="search_form">
                            <input style="text-align: left;padding: 0 0 0 20px;"  type="search" name="name" placeholder="商品搜尋"  >
                              <input type="image" onclick="form_submit()" src="/gtt/IMG/magnifier.png">
                              <!--<a href="javascript:form_submit()">搜尋</a>-->
                    </form>
          </nav>
</div>
