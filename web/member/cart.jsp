<%-- 
    Document   : cart
    Created on : 2018/6/4, 上午 10:17:47
    Author     : Administrator
--%>
<%@page import="uuu.gtt.service.ProductService"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="uuu.gtt.entity.Cart"%>
<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.CartItem"%>

<%
	Customer member = (Customer) session.getAttribute("member");//載入登入者資料

        Object objCart = session.getAttribute("cart"); //讀取session內購物車資料
        Cart cart = null;//建立空的購物車
        if (objCart instanceof Cart) {//如果session內購物車資料結構等於購物車
                cart = (Cart) objCart;//把session內購物車資料放入購物車內
                cart.setMember(member);//把session內登入者資料放入購物車內
        }
        int a = 0;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <title>JSP Page</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">    

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
                        caption{
                                background: #eee;
                                line-height: 120px;
                                font-size: 30px;
                        }
                        caption img{
                                height: 90px;
                                opacity: 0.7;
                                vertical-align:middle;
                                margin: 0 20px;
                        }
                        thead{
                                /*border:  1px red solid;*/
                                background-color:  #eee;
                        }

                        /*繼續購物、修改*/
                        .again_input,.update_input{
                                /*                                background-color: #666666;*/
                                /*                                color: white;*/

                                width: 90px;
                                height: 35px;
                                text-align: center;


                        }
                        .cart_end{
                                background-color: #666666;
                                color: white;
                                width: 90px;
                                height: 35px;
                                text-align: center;
                        }
                        .cart_number{
                                line-height: 24px;
                                margin: 0 auto;
                                text-align: center;
                                width: 24px;
                                height: 24px;
                                background-color: #bbb;
                                color: white;
                        }
                        .zero{
                                padding: 50px 0 0 0;
                                height: 150px;
                                text-align: center;
                                font-size: 30px;
                                background-color: #eee;
                                /*line-height: 100px;*/
                        }
                        .add_card{
                                float: right;
                                border: none;
                                height: 40px;
                                /*cursor: pointer;*/ 
                                background-color: #666666;
                                color: white;
                                margin: 0 0 5px 0;
                        }
                </style>
                <script type="text/javascript">
                        function goshopping() {
                                location.href = "<%= request.getContextPath()%>/products_list.jsp";
                        }

                        function checkout() {
                                location.href = "check_out.jsp";
                        }


                </script>
                <!--網頁第一層的 nav_css-->
                <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                <!--    網頁第2-1層：LOGO css    -->
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
                <!--    網頁第2-1層：LOGO 搜尋 購物車    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo.jsp" />
                <!--第2-2層中的選單-->
                <jsp:include page="/WEB-INF/subviews/picture/menu.jsp" />

                <div class="article">            
                        <%if (cart != null && cart.getSize() > 0) {%>
                        <form action='update_cart.do' method="get" >
                                <table style='width:90%;margin:  auto;'>


                                        <caption  style="margin:  20px 0;"><img src="/gtt/IMG/cart_black504x512.png">購 物 車</caption>  

                                        <thead>
                                                <!--拉出上層空白區域-->
                                                <tr style="background-color: white;height: 10px;"></tr>


                                                <tr style="width: 100%;background-color:  #eee;height: 40px;">
                                                        <th >項次</th>
                                                        <th>圖片</th> 
                                                        <th>名稱</th>
                                                        <th>庫存</th>
                                                        <th>售價</th>
                                                        <th style="padding: 0 15px 0 0;">數量</th>
                                                        <th>刪除</th>
                                                </tr>
                                        </thead> 

                                        <tbody>
                                                <%


                                                %>

                                                <% for (CartItem item : cart.getCartItemSet()) {%>
                                                <%
                                                        String productId = "" + item.getProduct().getId();
                                                        Product p = null;
                                                        if (productId != null && productId.matches("\\d+")) {
                                                                int id = Integer.parseInt(productId);
                                                                ProductService service = new ProductService();
                                                                p = service.findProductById(id); //findProductByName("").get(0);
                                                        }
                                                        a = a + 1;
                                                %>
                                        <script type="text/javascript">
                                                $(document).ready(init);
                                                function init() {
                                                        $("#xx<%=a%>").click(LessHandler);
                                                        $("#zz<%=a%>").click(AddHandler);
                                                        function LessHandler() {
                                                                var v = document.getElementById("yy<%=a%>").value;
                                                                if (parseInt(v) > 0) {
                                                                        document.getElementById("yy<%=a%>").value = parseInt(v) - 1;
                                                                }
                                                        }



                                                        function AddHandler() {
                                                                var v = document.getElementById("yy<%=a%>").value;



                                                                if (parseInt(document.getElementById("getStock<%=a%>").value) > parseInt(v)) {
                                                                        document.getElementById("yy<%=a%>").value = parseInt(v) + 1;

                                                                }
                                                        }
                                                }
                                        </script>
                                        <tr>
                                                <!--項次-->
                                                <td  style="width: 5%;"> <div class="cart_number"><%= a%> </div></td> 
                                                <!--圖片-->
                                                <td style="width: 10%;"><img style='width:75px;vertical-align: middle' src='<%=item.getProduct().getPhotoUrl()%>'></td>
                                                <!--名稱-->
                                                <td style="width: 50%;"> <%=item.getProduct().getName()%></td>
                                                <!--庫存-->
                                                <td style="width: 5%;"> <input  style="text-align: center; color: black;border: none;font-size: 20px;width: 30px;" id="getStock<%=a%>" value="<%=p.getStock()%>" readonly></td>
                                                <!--售價-->
                                                <td style="width: 10%;"><%= Math.round(item.getProduct().getPrice())%></td>
                                                <!--數量-->
                                        <style>



                                                #yy<%=a%>{
                                                        float: left;
                                                        margin: 0;
                                                        padding: 0px  ;
                                                        border: #ccc 1px solid;
                                                        width: 38px;
                                                        height: 38px;
                                                        text-align: center;
                                                }
                                                #xx<%=a%>,#zz<%=a%>  {
                                                        float: left;
                                                        cursor: pointer; 
                                                        background-color: #ccc;
                                                        color: white;
                                                        width: 40px;
                                                        height: 40px;
                                                        line-height: 40px;
                                                        text-align: center;
                                                }
                                        </style>
                                        <td style="width: 120px;min-width: 120px;text-align: right;">

                                                <div id="xx<%=a%>">-</div>

                                                <input id="yy<%=a%>" type='text' name='quantity<%=item.getProduct().getId()%>' value='<%= cart.getItemQuantity(item)%> ' readonly
                                                       min='1' max='<%= item.getProduct().getStock()%>'>
                                                <div id="zz<%=a%>">+</div>
                                        </td>
                                        <!--刪除-->
                                        <td style="width: 10%;text-align: center;"><input style='' type='checkbox' name='delete<%=item.getProduct().getId()%>'></td>

                                        </tr>
                                        <%}%>
                                        </tbody>

                                        <tfoot>                    
                                                <tr>
                                                        <td  colspan="6" style='text-align: right;'>
                                                                共<%= cart.getSize()%>項，<%= cart.getTotalQuantity()%>件，總金額：
                                                        </td>
                                                        <td colspan="3"style='text-align: center;' ><%= Math.round(cart.getTotalDiscountedAmount())%>元</td>
                                                </tr>
                                                <tr><td colspan="6" style="height: 40px;"></td></tr>
                                                <tr>
                                                        <td style="v" colspan="1"><input class="again_input" type='button' value='繼續購物' onclick='goshopping()'></td>
                                                        <td colspan="4"></td>
                                                        <td style="text-align: center;" colspan="1"><input class="update_input" type="submit" value="修改購物車" name="submit"></td>
                                                        <td  colspan="2"><input class="cart_end" type="submit" value="我要結帳" name="submit"></td>
                                                </tr>
                                                 <tr><td colspan="6" style="height: 40px;"></td></tr>
                                        </tfoot>                
                                </table>                        
                        </form>
                        <%} else {%>
                        <p class="zero">目前沒有選購商品<br><input  class="again_input" type='button' value='繼續購物' onclick='goshopping()'></p>
                                <%}%>
                </div>



                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>
