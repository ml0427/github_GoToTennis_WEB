<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="java.awt.Dimension"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	Customer member = (Customer) session.getAttribute("member");
	String ajax = request.getParameter("ajax");
	Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
	if (member == null) {
		if (ajax == null) {
%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<%
		}
	%>
	<div style="text-align: center;">
		<img src="/gtt/IMG/15.jpg">
	</div>
	<iframe width="<%=screenSize.width * 0.7%>" height="<%=screenSize.height * 0.7%>" src="https://www.youtube.com/embed/IHkC4w4Ozdw?" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	<%
		if (ajax == null) {
	%>
</body>
</html>
<%
	}
	}
%>