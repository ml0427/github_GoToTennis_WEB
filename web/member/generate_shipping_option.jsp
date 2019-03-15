<%-- 
    Document   : generate_shipping_option
    Created on : 2018/6/6, 上午 11:26:12
    Author     : Administrator
--%>


<%@page import="uuu.gtt.entity.ShippingType"%>
<%@page import="uuu.gtt.entity.PaymentType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String paymentType = request.getParameter("paymentType");
    PaymentType pType = null;
    try{
        pType = PaymentType.valueOf(paymentType);
    }catch(RuntimeException ex){}
%>
<option value="">請選擇...</option>
<% if(pType!=null) {
        for(ShippingType shType :pType.getShippingType()){
%>
<option value="<%= shType.name() %>"><%=shType%></option>
<% }
   }
%>