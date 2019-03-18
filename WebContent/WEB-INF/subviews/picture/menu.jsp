<%-- 
    Document   : newjsp
    Created on : 2018/5/29, 上午 12:09:40
    Author     : USER
--%>


<%@page import="java.util.List"%>
<%@page import="uuu.gtt.entity.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        request.setCharacterEncoding("UTF-8");
//        //1. 讀取request中的Form Data
//        String name = request.getParameter("name");
//        if (name == null) {
//                name = "";
//        }
//        String category = request.getParameter("category");
//        if (category == null) {
//                category = "";
//        }
//
//
//        System.out.println("name==>"+name+"\n category==>"+category);
        int content_number = 10;
                if (request.getParameter("content_number") == null) {
                content_number = 10;
        } else {
                content_number = Integer.parseInt(request.getParameter("content_number"));
        }
%>




<!--第二層中的選單-->
<div style="width: 100%; background: white;height: 176px;">
        <ul class="drop-down-menu" style="width: 100%; background:  #666666;">
                <li><a href="/gtt">首頁</a></li>
                <li ><a href="/gtt/products_list.jsp">所有商品▽</a>
                        <ul>
                                <li>
                                        <a href="/gtt/products_category.jsp" >品牌</a>
                                        <ul>
                                                <li><a href="/gtt/products_list.jsp?name=WILSON&category=&ppp=1&content_number=<%= content_number%>">Wilson</a></li>
                                                <li><a href="/gtt/products_list.jsp?name=HEAD&category=&ppp=1&content_number=<%= content_number%>">Head</a></li>
                                                <li><a href="/gtt/products_list.jsp?name=YONEX&category=&ppp=1&content_number=<%= content_number%>">Yonex</a></li>
                                                <li><a href="/gtt/products_list.jsp?name=Babolat&category=&ppp=1&content_number=<%= content_number%>">Babolat</a></li>
                                        </ul>
                                </li>
                                <li>
                                        <a href="/gtt/products_list.jsp?name=&category=racket&ppp=1&content_number=<%= content_number%>">網球拍</a>
                                        <ul>
                                                <li><a href="/gtt/products_list.jsp?name=WILSON&category=racket&ppp=1&content_number=<%= content_number%>">Wilson</a></li>
                                                <li><a href="/gtt/products_list.jsp?name=HEAD&category=racket&ppp=1&content_number=<%= content_number%>">Head</a></li>
                                                <li><a href="/gtt/products_list.jsp?name=YONEX&category=racket&ppp=1&content_number=<%= content_number%>">Yonex</a></li>
                                                <li><a href="/gtt/products_list.jsp?name=Babolat&category=racket&ppp=1&content_number=<%= content_number%>">Babolat</a></li>
                                        </ul>
                                </li> 
                                <li><a href="/gtt/products_list.jsp?name=&category=vibration&ppp=1&content_number=<%= content_number%>">避震器</a></li>
                                <li><a href="/gtt/products_list.jsp?name=&category=grip&ppp=1&content_number=<%= content_number%>">握把布</a></li>
                                <li><a href="/gtt/products_list.jsp?name=&category=ball&ppp=1&content_number=<%= content_number%>">網球</a></li>
                        </ul>
                </li>

                <li><a href="/gtt/special_offer.jsp">特價商品</a></li>
                <li><a href="/gtt/products_new.jsp">新進商品</a></li>
                <!--<li><a href="#">品牌日誌</a></li>-->
<!--                <li><a href="#">常見問題</a></li>
                <li ><a href="#">關於我們</a>
                        <ul>
                                <li><a href="#" >關於我們</a></li>
                                <li><a href="#">聯絡我們</a></li>
                                <li><a href="#">購物須知</a></li>
                                <li><a href="#">退換貨說明</a></li>
                                <li><a href="#">隱私權保護</a></li>
                        </ul>
                </li>-->
        </ul>
</div>
