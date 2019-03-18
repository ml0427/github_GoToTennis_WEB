<%-- 
    Document   : index
    Created on : 2018/5/25, 下午 12:04:11
    Author     : Administrator
--%>


<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.gtt.service.ProductService"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
        <head>
                <title>GoToTennis</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style>
                        .footer{text-align: center} 

                        .big_label{
                                margin:0 0 40px 0;
                                padding: 0;
                                width: 100%;
                                height: 40px;
                                line-height: 40px;
                                text-align: center;
                                color: white;
                                background-color: #999999;
                        }
                </style>

                <!--網頁第一層的 nav_css-->
                <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                <!--    網頁第2-1層：LOGO css    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                <!--網頁第2-2層的 menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />
                <!--網頁第三層：圖片輪播 banner_img_css-->
                <jsp:include page="/WEB-INF/subviews/picture/banner_img_css.jsp" />
                <%--<!--網頁第三層：圖片輪播 banner_img2_css-->
                <%-- <jsp:include page="/WEB-INF/subviews/banner_img_css2.jsp" />--%>
                <!--網頁第4層：產品搜尋product_select_css -->
                <jsp:include page="/WEB-INF/subviews/picture/product_select_css.jsp" />

                <!--網頁最尾層：footer_css -->
                <jsp:include page="/WEB-INF/subviews/picture/footer_css.jsp" />

                <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancybox/jquery.fancybox.css"> 
                <script src='<%=request.getContextPath()%>/fancybox/jquery.fancybox.js'></script>    

                
                <%
                        Customer member = (Customer) session.getAttribute("member");
                         if(member==null){
                %>
                <script type="text/javascript">
                        $(document).ready(init);
                        function init() {

                                $.ajax({
                                        url: "propaganda.jsp?ajax=true",
                                        method: 'GET'
                                }).done(getAdvertising);
                        }

                        function getAdvertising(result) {
                                //console.log(result);
                                $("#product_detail").html(result);
                                $.fancybox.open({
                                        src: '#product_detail', type: 'inline'
                                                //                    ,opts: {
                                                //                        afterShow: function (instance, current) {
                                                //                            console.info('done!');
                                                //                        }
                                                //                    }
                                });

                        }
                </script>
                <%}%>
        </head>



        <body>        

                <div style=" background-color: white;">
                        <!--第一層中的登入登出-->
                        <jsp:include page="/WEB-INF/subviews/picture/nav.jsp" />
                        <!--    網頁第2-1層：LOGO 搜尋 購物車    -->
                        <jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
                        <!--第2-2層中的選單-->
                        <jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />
                        <!--網頁第三層：圖片輪播-->
                        <jsp:include page="/WEB-INF/subviews/picture/banner_img.jsp" />
                        <!--網頁第三層：圖片輪播2-->
                        <%-- <jsp:include page="/WEB-INF/subviews/banner_img2.jsp" />--%>
                        <!--網頁第4層：產品搜尋-->
                        <%-- <jsp:include page="/WEB-INF/subviews/product_select.jsp" />--%>

                        <ul style="">
                                <li  >
                                        <a href="products_list.jsp?search=PRO+STAFF" >
                                                <img style="float:left; width: 47%;margin:2%;background-color: white; " src="http://www.nandasports.com/images/banner/3300766656.jpg">
                                        </a>
                                </li>
                                <li >
                                        <a href="products_list.jsp?search=HEAD+Graphene+TOUCH+Speed" >
                                                <img style="float:right; width: 47%;margin: 2% 2% 2% 0;background-color: white; " src="http://www.nandasports.com/images/banner/5564815341.jpg">
                                        </a>
                                </li>
                        </ul>
                        <div style="color: white;"> _</div>
                        <div class="big_label"><h3>新進商品</h3></div>
                        <!--新進商品-->
                        <div>
                                <%
                                        request.setCharacterEncoding("UTF-8");
                                        //1. 讀取request中的Form Data
                                        String search = request.getParameter("search");
                                        //                                          System.out.println("search=" + search);
                                        if (search == null) {
                                                search = "";
                                        }
                                        ProductService service = new ProductService();
                                        List<Product> list = service.findProductByName(search); //"" 將會查詢到全部的產品
                                %>
                                <ul id="product_list">                
                                        <%
                                                int new_product = 20;
                                                if (list != null && list.size() > 0) {
                                                        for (int i = list.size() - 1; i > list.size() - new_product - 1; i--) {
                                        %>  
                                        <li style="height: 350px; box-shadow:none;">
                                                <div style="position: absolute; z-index: 1;right: 0;background-color: #6699ff;color: white; opacity:0.7;width: 50px; height: 30px;line-height: 30px;">NEW</div>
                                                <a href="product.jsp?productId=<%= list.get(i).getId()%>" class="hover"><img src="<%= list.get(i).getPhotoUrl()%>"><img src="<%= list.get(i).getPhotoUrl2()%>"></a>

                                                <h5  style="padding: 234px 0 0 0 ;"><%= list.get(i).getName()%></h5>
                                                <div >
                                                        <samp style="text-decoration:line-through;">原價$<%= Math.round(list.get(i).getUnitPrice())%></samp> 
                                                        <samp style="background-color: peachpuff;" >優惠價$<%= Math.round(list.get(i).getPrice())%></samp>

                                                </div>
                                        </li>                
                                        <% }%>
                                </ul>
                                <% } else { %>
                                <p>查無符合名稱的產品資料</p>
                                <% }%>
                        </div>


                </div>


                <!--AJAX技術  廣告(advertising)用-->
                <div id="product_detail"></div>

                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>

