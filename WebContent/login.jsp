<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>登入</title>
<meta charset="big5" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script>
	function refreshCaptcha() {
		var captcha_image = document.getElementById("captcha_image");
		captcha_image.src = "/gtt/images/captcha.jpg?regresh=" + new Date();
	}
</script>
<style>
.article_up {
	text-align: center;
}

.article {
	text-align: left;
	/*border: 1px red solid;*/
	/*background-color: pink;*/
	width: 50%;
	margin: 0 auto;
}

.article label {
	float: left;
	width: 100%;
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

#login_input {
	background-color: #666666;
	color: white;
	width: 60px;
	height: 35px;
	text-align: center;
	margin: 0 0 40px 0;
}

#new_user_input {
	background-color: #f4f4f4;
	border: 1px #f4f4f4 solid;
	color: black;
	width: 100px;
	height: 35px;
	text-align: center;
	margin: 0 0 40px 0;
}
</style>


<!--網頁第一層的 nav_css-->
<jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
<!--網頁第2-1層：LOGO_css-->
<jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
<!--網頁第2-2層的 menu_css-->
<jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
<!--第3層中的small_menu_css-->
<jsp:include page="/WEB-INF/subviews/picture/small_menu_css.jsp" />

<!--網頁最尾層：產品搜尋footer_css -->
<jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />
</head>

<body>
	<!--第一層中的登入登出-->
	<jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
	<!--網頁第2-1層：LOGO 搜尋 購物車-->
	<jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
	<!--第2-2層中的選單-->
	<jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />
	<!--第3層中的small_menu-->
	<jsp:include page="/WEB-INF/subviews/picture/small_menu.jsp">
		<jsp:param name="theSubtitle" value="<a class=\" small_menu_a\" href=\"/gtt\">首頁</a>>會員登入   " />
                        <jsp:param name="h2_theSubtitle" value="會員登入" /></jsp:include>

	<div class="article_up" style="background-color: white;">
		<div class="article">
			<%
				Object o = request.getAttribute("errors");
				List<String> errors = null;
				if (o instanceof List) {
					errors = (List<String>) o;
				}
				//以下cookie
				Cookie[] cookies = request.getCookies();
				String email = "";
				String remember = "";
				if (cookies != null && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("id")) {
							email = cookie.getValue();
						} else if (cookie.getName().equals("remember")) {
							remember = cookie.getValue();
						}

					}
				}
			%>
			<form action="login.do" method="POST">
				<%
					if (errors != null && errors.size() > 0) {
				%>
				<ol style="color: darkred">
					<%
						for (String err : errors) {
					%>
					<li>
						<%
							out.println(err);
						%>
					</li>
					<%
						}
					%>
				</ol>
				<%
					}
				%>
				<p>
					<label for="email">帳號：</label> <input id="email" name="email"
						value="<%=request.getParameter("email") == null ? email : request.getParameter("email")%>"
						placeholder="請輸入Email" required><br> <input
						style="height: auto; width: auto;" type="checkbox" name="remember">
					<samp>記住我的帳號</samp>

				</p>
				<p>
					<label for="password">密碼：</label> <input type="password"
						id="password" name="password" placeholder="請輸入密碼" required>
				</p>
				<p>
					<label for="captcha">驗證碼：<a
						href="javascript:refreshCaptcha()" title="點選圖片即可更新"><img
							id="captcha_image" src="/gtt/images/captcha.jpg"
							style="vertical-align: middle"></a><br></label> <input type="text"
						id="captcha"
						value="<%=request.getParameter("captcha") == null ? "" : request.getParameter("captcha")%>"
						name="captcha" placeholder="請輸入驗證碼(不分大小寫)" required><br>
				</p>
				<p>
					<input id="login_input" type="submit" value="登入"> <input
						id="new_user_input" type="button" value="註冊新帳號"
						onclick="location.href = '/gtt/register.jsp'">

				</p>
			</form>
		</div>
	</div>

	<!--網頁最尾層：產品搜尋footer -->
	<jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
</body>
</html>
