<%-- 
    Document   : order
    Created on : 2018/6/8, 上午 11:24:25
    Author     : Administrator
--%>

<%@page import="uuu.gtt.service.OrderService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uuu.gtt.entity.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="uuu.gtt.entity.Status"%>
<%@page import="uuu.gtt.entity.Order"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JSP Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--網頁第一層的 nav_css-->
<jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
<!--網頁第2-1層：LOGO css-->
<jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
<!--網頁第2-2層的 menu_css-->
<jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />



<!--網頁最尾層：footer_css -->
<jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />

<style>
.article {
	background-color: white;
}

.article_2 {
	text-align: center;
	margin: 0 auto;
	width: 90%;
}

.cart_number {
	line-height: 24px;
	margin: 0 auto;
	text-align: center;
	width: 24px;
	height: 24px;
	background-color: #bbb;
	color: white;
}

.again_input {
	width: 90px;
	height: 35px;
	text-align: center;
}
</style>
<script>
                        function goorder() {
                                location.href = "<%=request.getContextPath()%>
	/member/orders_history.jsp";
	}
</script>

</head>
<body>
	<!--第一層中的登入登出-->
	<jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
	<!--    網頁第2-1層：LOGO 搜尋 購物車    -->
	<jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
	<!--第2-2層中的選單-->
	<jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />
	<%
		Customer member = (Customer) session.getAttribute("member");
		String orderId = request.getParameter("orderId");
		Order order = null;

		//                        List<Order> list = null;
		//                        if (member != null) {
		//                                OrderService service = new OrderService();
		//                                list = service.findOrdersByCustomerEmail(member.getEmail());
		//                        }
		List<OrderItem> list2 = null;

		if (orderId != null && orderId.matches("\\d+")) {
			OrderService service = new OrderService();
			order = service.findOrderById(Integer.parseInt(orderId));
			list2 = order.getOrderItemSet();
		}
	%>



	<div class="article">
		<div class="article_2">

			<%
				if (order != null && member.equals(order.getMember())) {
			%>
			<div style="text-align: left;">
				<br> 訂單編號：<%=order.getOrderTime().getYear()%><%=order.getOrderTime().getMonthValue()%>-<%=String.format("%03d", order.getId())%>
				<hr>
				訂購時間：<%=order.getOrderTime()%>
				<hr>
				<div>
					付費方式：<%=order.getPaymentType()%><%=order.getPaymentFee() == 0 ? "" : "手續費：" + order.getPaymentFee()%><br>
					<hr>
				</div>
				<div>
					貨運方式：
					<%=order.getShippingType()%><br>

				</div>
				<div
					style="line-height: 40px; height: 40px; background: #eee; margin: 20px 0;">收件人資訊</div>
				<div>
					姓名:<%=order.getRecipientName()%><hr>
				</div>
				<div>
					電郵:<%=order.getRecipientEmail()%><hr>
				</div>
				<div>
					電話:<%=order.getRecipientPhone()%><hr>
				</div>
				<div>
					地址:<%=order.getRecipientAddr()%><hr>
				</div>
			</div>

			<div></div>



			<div>



				<table style='width: 90%; margin: auto;'>
					<caption style="margin: 20px 0;">訂單內容</caption>
					<thead>
						<!--拉出上層空白區域-->
						<tr></tr>
						<tr style="width: 100%; background-color: #eee; height: 40px;">
							<th>項次</th>
							<th>圖片</th>
							<th>名稱</th>
							<th>售價</th>
							<th>數量</th>
						</tr>
					</thead>

					<tbody>
						<%
							int a = 0;
								int quantity = 0;
								double all_price = 0;
								if (list2 != null && list2.size() > 0) {
									for (OrderItem orderItem : list2) {
										a = a + 1;
										quantity = quantity + orderItem.getQuantity();
										all_price = all_price + orderItem.getProduct().getPrice() * orderItem.getQuantity();
						%>
						<tr>
							<!--項次-->
							<td style="width: 5%;">
								<div class="cart_number"><%=a%>
								</div>
							</td>
							<!--圖片-->
							<td style="width: 10%;"><img
								style='width: 75px; vertical-align: middle'
								src='<%=orderItem.getProduct().getPhotoUrl()%>'></td>
							<!--名稱-->
							<td style="width: 40%;"><%=orderItem.getProduct().getName()%></td>
							<!--售價-->
							<td style="width: 10%;"><%=Math.round(orderItem.getProduct().getPrice())%></td>
							<!--數量-->
							<td style="width: 5%;"><%=orderItem.getQuantity()%></td>
						</tr>
						<%
							}
						%>
						<%
							} else {
						%>
						<p>
							查無訂單編號<%=orderId%>內的商品!
						</p>
						<%
							}
						%>
					</tbody>
					<tbody>
						<tr>
							<td colspan="3">購買了</td>
							<td colspan="2" style='background-color: #eee; width: 300px;'><%=quantity%>件商品</td>
						</tr>
						<tr>
							<td colspan="5"><hr style="margin: 0;"></td>
						</tr>

						<tr>
							<td colspan="3">運費</td>
							<td colspan="2" style='background-color: #eee;'><span
								id="feeSpan"><%=Math.round(order.getShippingFee())%></span>元</td>

						</tr>
						<tr>
							<td colspan="5"><hr style="margin: 0;"></td>
						</tr>


						<tr>
							<td colspan="3">總金額</td>
							<td colspan="2" style='background-color: #eee;'><span
								id="allfeeSpan"><%=Math.round(all_price + order.getShippingFee())%></span>元</td>
						</tr>
						<tr>
							<td colspan="5"><hr style="margin: 0;"></td>
						</tr>
						<tr>
							<td colspan="5"><div>
									<br>
								</div></td>
						</tr>
						<tr>

							<td colspan="3"></td>
							<td colspan="2"><input class="again_input" type='button'
								value='回歷史清單' onclick='goorder()'></td>
						</tr>
						<tr>
							<td colspan="5"><div>
									<br>
								</div></td>
						</tr>

					</tbody>
				</table>

				<%
					} else {
				%>
				<p>
					查無此編號(<%=orderId%>)的訂單!
				</p>
				<%
					}
				%>

			</div>
		</div>
	</div>

	<!--網頁最尾層：產品搜尋footer -->
	<jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
</body>
</html>
