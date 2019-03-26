<%-- 
    Document   : orders_history
    Created on : 2018/6/1, 上午 09:53:01
    Author     : Administrator
--%>

<%@page import="uuu.gtt.service.OrderService"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="uuu.gtt.entity.Order"%>
<%@page import="uuu.gtt.entity.PaymentType"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <title>JSP Page</title>
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
                        .article{
                                background-color: white;
                        }
                        table {
                                border-collapse: collapse;
                        }
                        td {

                                text-align: center;
                        }

                        /*詳細按鈕 通知賣家按鈕*/
                        .detailed :hover{
                                background-color: #666666;
                                color: white;
                        }
                        .notice :hover{
                               background-color: #666666;
                                color: white;
                                
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
                        <jsp:param name="theSubtitle" value="<a class=\"small_menu_a\" href=\"/gtt\">首頁</a>>歷史訂單   " />
                        <jsp:param name="h2_theSubtitle" value="歷史訂單" />

                </jsp:include>




                <%
                	Customer member = (Customer) session.getAttribute("member");
                                                        List<Order> list = null;
                                                        if (member != null) {
                                                                OrderService service = new OrderService();
                                                                list = service.selectOrdersByEmail(member.getEmail());
                                                        }
                %>
                <div class="article">            
                        <% if (list != null && list.size() > 0) {%>
                        <table style='width:90%;margin:  auto;'>
                                <!-- <caption>歷史訂單</caption>-->
                                <thead>
                                        <!--拉出上層空白區域-->
                                        <tr style="background-color: white;height: 20px;"></tr>
                                        <tr style="width: 100%;background-color:  #eee;height: 40px;">
                                                <th style="width:10%;">訂單編號</th>
                                                <th style="width:15%;">訂購時間</th>
                                                <th style="width:15%;">處理狀態</th>
                                                <th style="width:20%;">付款方式</th>
                                                <th>貨運方式</th>
                                                <th>總金額</th>
                                                <th>詳細資料</th>
                                        </tr>
                                </thead>


                                <tbody>

                                        <% for (Order order : list) {%>
                                        <tr style="height: 80px;">
                                                <!--訂單編號-->
                                                <td><a style="text-decoration:none; color: black;" href="order.jsp?orderId=<%=order.getId()%>">
                                                                <%= order.getOrderTime().getYear()%><%= order.getOrderTime().getMonthValue()%>-<%= String.format("%03d", order.getId())%>
                                                        </a>                                
                                                </td>
                                                <!--訂購時間-->
                                                <td><%= order.getOrderTime().getMonthValue()%>月 <%= order.getOrderTime().getDayOfMonth() %>日 </td>
                                                <!--處理狀態-->
                                                <td><%
                                                        if (order.getStatus() == 0) { //0-訂單待處理,1-訂單處理中, 2-訂單已出貨
                                                        %>訂單待處理<%
                                                        } else if (order.getStatus() == 1) {
                                                        %>已通知轉帳<%
                                                        } else if (order.getStatus() == 2) {
                                                        %>訂單已出貨<%
                                                                }else{
                                                        %>特殊處理中<%
                                                        }
                                                        


                                                        %></td>
                                                <!--付款方式-->
                                                <td>
                                                        <%= order.getPaymentType().getDescription()%> 
                                                        <%if (order.getStatus() == 0 && order.getPaymentType() == PaymentType.ATM) {%>
                                                        <a class="notice"  style=" text-decoration:none;color: black;  " href="notify.jsp?orderId=<%= order.getId()%>"><div style="font-size: 16px;border: 1px black solid;width: 60%;margin:  0 auto;">通知賣家已轉帳</div></a>
                                                        <%}%>
                                                </td>
                                                <!--貨運方式-->
                                                <td><%= order.getShippingType().getDescription()%></td>
                                                <!--總金額-->
                                                <td><%= Math.round(order.getTotalAmount() + order.getPaymentFee() + order.getShippingFee())%></td>
                                                <td><a class="detailed" style="text-decoration:none; color: black; " href="order.jsp?orderId=<%=order.getId()%>"> <div style="font-size: 16px;border: 1px #666666 solid;width: 80px;margin:  0 auto;">詳細</div></a></td>
                                        </tr>
                                        <% } %>
                                </tbody>
                                <tfoot>

                                </tfoot>
                        </table>
                        <% } else { %>
                        <p>查無歷史訂單</p>
                        <% }%>
                </div>
                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>
