<%-- 
    Document   : get_fee
    Created on : 2018/6/6, 下午 12:31:20
    Author     : Administrator
--%>
<%@page import="uuu.gtt.entity.ShippingType"%>
<%@page import="uuu.gtt.entity.PaymentType"%>
<%@page contentType="text/plain" pageEncoding="UTF-8"%>
<%
	String paymentType = request.getParameter("paymentType");
	String shippingType = request.getParameter("shippingType");

	PaymentType pType = null;
	ShippingType shType = null;

	try {
		pType = PaymentType.valueOf(paymentType);
	} catch (RuntimeException ex) {
	}

	try {
		shType = ShippingType.valueOf(shippingType);
	} catch (RuntimeException ex) {
	}

	if (pType != null && shType != null) {
%>
<%=pType.getFee() + shType.getFee()%>
<%
	} else {
%>
0
<%
	}
%>