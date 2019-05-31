<%-- 
    Document   : product
    Created on : 2018/5/22, 下午 12:11:14
    Author     : Administrator
--%>

<%@page import="uuu.gtt.service.ProductService"%>
<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>產品明細</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!--網頁第一層的 nav_css-->
<jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
<!--網頁第2-1層：LOGO_css-->
<jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
<!--網頁第2-2層的 menu_css-->
<jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
<!--網頁最尾層：產品搜尋footer_css -->
<jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />
<style>
.article {
	background: white;
}

.article img {
	width: 30%;
	min-width: 100px;
	float: left;
}

#yy {
	float: left;
	margin: 0;
	padding: 0px;
	border: #ccc 1px solid;
	width: 38px;
	height: 38px;
	text-align: center;
}

#xx, #zz {
	float: left;
	cursor: pointer;
	background-color: #ccc;
	color: white;
	width: 40px;
	height: 40px;
	line-height: 40px;
	text-align: center;
}

.add_card {
	float: right;
	border: none;
	height: 40px;
	/*cursor: pointer;*/
	background-color: #666666;
	color: white;
	margin: 0 0 5px 0;
}
</style>
<%
	String productId = request.getParameter("productId");
	Product p = null;
	if (productId != null && productId.matches("\\d+")) {
		int id = Integer.parseInt(productId);
		ProductService service = new ProductService();
		p = service.selectProductById(id); //findProductByName("").get(0);
	}
	if (p != null) {
%>
<script type="text/javascript">
	$(document).ready(init);
	$(document).ready(playHandler);
	
	function playHandler() {
		//console.log("play");
        if (${not empty sessionScope.member}) {
            $.ajax({
                url: 'add_view_log.do?member=${sessionScope.member.email}&productId=<%=p.getId()%>',
                method: 'GET'
            });
        }
	}

	function init() {
		$("#xx").click(LessHandler);
		$("#zz").click(AddHandler);
		function LessHandler() {
			var v = document.getElementById("yy").value;
			if (parseInt(v) > 0) {
				document.getElementById("yy").value = parseInt(v) - 1;
			}
		}

		function AddHandler() {
			var v = document.getElementById("yy").value;
			if (parseInt(document.getElementById("getStock").value) > parseInt(v)) {
				document.getElementById("yy").value = parseInt(v) + 1;
			}
		}
	}
</script>
</head>

<body>
	<!--第一層中的登入登出-->
	<jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
	<!--網頁第2-1層：LOGO 搜尋 購物車-->
	<jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
	<!--第2-2層中的選單-->
	<jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />

	<div class="article" style="padding: 50px 0;">
		<div>
			<div>
				<img src="<%=p.getPhotoUrl()%>">
			</div>
			<div style="float: left; width: 65%">
				<h4><%=p.getName()%></h4>
				<p>
					原價:
					<%=Math.round(p.getUnitPrice())%></p>
				<div>
					優惠價：<%=Math.round(p.getPrice())%>元
				</div>
				<hr>
				<%=p.getDescription()%><!--產品介紹 -->
				<br>
				<br>
				<hr>
				<div style="">
					庫存量
					<input style="border: none; font-size: 20px; width: 30px;" id="getStock" value="<%=p.getStock()%>" readonly>
				</div>
				<hr>
				<%
					if (p.getStock() > 0) {
				%>
				<form action='add_cart.do' method="POST">
					<!--抓到現在的產品編號-->
					<input type='hidden' name='productId' value="<%=p.getId()%>">
					<!--數量-->
					<div id="xx">-</div>
					<input id="yy" name="quantity" type="text" min="1" max="<%=p.getStock()%>" value="1" required>
					<div id="zz">+</div>
					<input id="add_card" class="add_card" type="submit" value="加入購物車">
				</form>
				<%
					} else {
				%>
				<div style="color: darkred">目前無庫存!</div>
				<%
					}
				%>
			</div>
		</div>
		<div style="clear: both;"></div>
		<%
			} else {
		%>
		<p>
			查無此產品(<%=productId%>)!
		</p>
		<%
			}
		%>
	</div>
	<!--網頁最尾層：產品搜尋footer -->
	<jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
</body>
</html>
