<%-- 
    Document   : notify
    Created on : 2018/6/8, 下午 12:15:06
    Author     : Administrator
--%>

<%@page import="uuu.gtt.service.OrderService"%>
<%@page import="uuu.gtt.entity.Order"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="java.time.LocalDate"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <title>通知已轉帳</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">    

                <!--網頁第一層的 nav_css-->
                <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                <!--    網頁第2-1層：LOGO css    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                <!--網頁第2-2層的 menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
                <!--第3層中的small_menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/small_menu_css.jsp" />

                <!--網頁最尾層：footer_css -->
                <jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />
                <style>
.article {
	background: white;
	text-align: center;
}

.article input {
	border: none;
	background-color: #f4f4f4;
	width: 460px;
	height: 40px;
}

.article p {
	padding: 40px 0 0 0;
}

.article p label {
	text-align: left;
	width: 100px;
	display: inline-block;
}

#ok_input {
	background-color: #666666;
	color: white;
	width: 60px;
	height: 35px;
	text-align: center;
	margin: 40px 0 40px 0;
}
</style>
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
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>><a class=\"small_menu_a\" href=\"/gtt/member/orders_history.jsp\">歷史訂單</a>>通知轉帳   " />
                        <jsp:param name="h2_theSubtitle" value="通知賣家已轉帳" />      
                </jsp:include>
                <%
                	Customer member = (Customer) session.getAttribute("member");
                                                        String orderId = request.getParameter("orderId");
                                                        Order order = null;
                                                        if (orderId != null && orderId.matches("\\d+")) {
                                                                OrderService service = new OrderService();
                                                                order = service.selectOrderById(Integer.parseInt(orderId));

                                                        }
                %>
                <div class="article">
                        <div style="width: 60%;margin: 0 auto;">
                                <%if (order != null && member.equals(order.getMember())) {%>
                                <form  action="notify.do" method="POST">
                                        <p>
                                                <label style="">訂單編號:</label>
                                                <input type="text" readonly value="<%= order.getOrderTime().getYear()%><%= order.getOrderTime().getMonthValue()%>-<%= String.format("%03d", order.getId())%>"> 
                                                <input type="hidden" readonly value="<%= String.format("%03d", order.getId())%>" name="orderId">                       
                                        </p>
                                        <p>
                                                <label>轉帳銀行:</label>
                                                <input type="text" required value="" name="bank">                        
                                        </p>                    
                                        <p>
                                                <label>帳號後5碼:</label>
                                                <input type="text" required value="" name="account">                        
                                        </p>                    
                                        <p>
                                                <label>轉帳金額:</label>
                                                <input type="text" required 
                                                       value="<%= Math.round(order.getTotalAmount() + order.getPaymentFee() + order.getShippingFee())%>" name="amount">                        
                                        </p>                    
                                        <p>
                                                <label>轉帳日期:</label>
                                                <input type="date" required 
                                                       value="" name="transferDate" min="" max="<%= LocalDate.now()%>"> 
                                        </p>            
                                        <p>
                                                <label>時間:</label>
                                                <select style="border: none; background-color: #f4f4f4;width: 460px; height: 40px;"  name="transferTime">
                                                        <option value="">請選擇...</option>
                                                        <% for (int i = 0; i < 24; i += 2) {
                                                                        String time = i + ":00~" + (i + 2) + ":00";
                                                        %>
                                                        <option value="<%= time%>"> <%= time%></option>
                                                        <%}%>
                                                </select>
                                        </p> 

                                        <input id="ok_input" type="submit" value="確定" >

                                </form>
                                <%} else {%>
                                <p>無此編號(<%= orderId%>)的訂單</p>
                                <%}%>
                        </div>
                </div>
                <!--網頁最尾層：footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>
