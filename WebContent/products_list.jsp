<%-- 
    Document   : products_list
    Created on : 2018/5/22, 上午 11:39:27
    Author     : Administrator
--%>


<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>產品清單</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
/*產品清單區塊*/
#product_list {
	text-align: center;
}

.pro {
	background: white;
}
</style>



<!--網頁第一層的 nav_css-->
<jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
<!--    網頁第2-1層：LOGO css    -->
<jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
<!--網頁第2-2層的 menu_css-->
<jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
<!--第3層中的small_menu_css-->
<jsp:include page="/WEB-INF/subviews/picture/small_menu_css.jsp" />
<!--網頁第4層：產品搜尋product_select_css -->
<jsp:include page="/WEB-INF/subviews/picture/product_select_css.jsp" />
<!--網頁最尾層：footer_css -->
<jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//1. 讀取request中的Form Data
		String name = request.getParameter("name");
		if (name == null) {
			name = "";
		}
		String category = request.getParameter("category");
		if (category == null) {
			category = "";
		}
	%>
	<!--第一層中的登入登出-->
	<jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
	<!--    網頁第2-1層：LOGO 搜尋 購物車    -->
	<jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
	<!--第二層中的選單-->
	<jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />
	<!--第3層中的small_menu-->
	<jsp:include page="/WEB-INF/subviews/picture/small_menu.jsp">
		<jsp:param name="theSubtitle" value="<a class=\" small_menu_a\" href=\"/gtt\">首頁</a>>產品清單   " />
                        <jsp:param name="h2_theSubtitle" value="產品清單" /></jsp:include>
	<!--網頁第4層：產品搜尋-->
	<jsp:include page="/WEB-INF/subviews/picture/product_select_2.jsp" />
	<!--網頁最尾層：footer -->
	<jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
</body>
</html>
