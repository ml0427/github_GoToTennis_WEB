<%-- 
    Document   : check_out
    Created on : 2018/6/5, 下午 04:40:35
    Author     : Administrator
--%>

<%@page import="uuu.gtt.entity.PaymentType"%>
<%@page import="uuu.gtt.entity.Customer"%>
<%@page import="uuu.gtt.entity.Cart"%>
<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	Customer member = (Customer) session.getAttribute("member");

        Object objCart = session.getAttribute("cart");
        Cart cart = null;
        if (objCart instanceof Cart) {
                cart = (Cart) objCart;
                cart.setMember(member);
        }
%>
<!DOCTYPE html>
<html>
        <head>
                <title>結帳作業</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">    
                <script
                        src="https://code.jquery.com/jquery-1.12.4.js"
                        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                crossorigin="anonymous"></script>   

                <style>
                        .article{

                                background-color: white;
                        }
                        .article_2{
                                text-align: center;
                                margin: 0 auto;
                                width: 90%;
                                /*                                padding:   50px 0;*/

                        }
                        .pa_type,.sh_type{
                                border: 1px #cccccc solid;
                                font-size: 20px;
                                height:60px;
                                width:80%;
                                background-color: burlywood; 


                                /*影藏下拉箭頭*/
                                appearance:none;
                                -moz-appearance:none;
                                -webkit-appearance:none;

                                /**/
                                /*改變右邊箭頭樣式*/
                                background: url("/gtt/IMG/arrow.png") no-repeat right center transparent;
                                background-size: 20px;

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


                        /*大標題*/
                        .big_label{
                                margin:40px 0;
                                padding: 0;
                                width: 100%;
                                height: 40px;
                                line-height: 40px;
                                text-align: center;
                                color: white;
                                background-color: #999999;
                        }
                        .big_label a{
                                text-decoration:none;      
                                color: white;
                                background-color: #727272;
                        }
                        .big_label a:hover{
                                color:#ff9933;
                        }


                        /*使用者輸入資料*/
                        .user_data label{
                                padding: 10px;

                                float: left;
                                width: 100%;
                        }
                        .user_data input{
                                font-size: 18px;
                                border: none;
                                background-color: #f4f4f4;
                                width: 100%;
                                height: 40px;
                        }


                        /*結帳圖片*/

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


                        /*繼續購物、送出訂單*/
                        .sub_data,.again_input{
                                width: 90px;
                                height: 35px;
                                text-align: center;
                        }
                        .sub_data{
                                color: white;
                                background-color: #666666;
                        }
                </style>
                <script>
                        function goshopping() {
                                location.href = "<%= request.getContextPath()%>/products_list.jsp";
                        }
                </script>



                <!--網頁第一層的 nav_css-->
                <jsp:include page="/WEB-INF/subviews/picture/nav_css.jsp" />
                <!--    網頁第2-1層：LOGO css    -->
                <jsp:include page="/WEB-INF/subviews/picture/logo_css.jsp" />
                <!--網頁第2-2層的 menu_css-->
                <jsp:include page="/WEB-INF/subviews/picture/menu_css.jsp" />




                <!--網頁最尾層：footer_css -->
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
                        <div class="article_2">


                                <%if (cart != null && cart.getSize() > 0) {%>
                                <form action='check_out.do' method="POST" style="padding: 20px 0;">
                                        <table style='width:100%;margin:0 auto;'>

                                                <caption style="margin:  20px 0;"><img src="/gtt/IMG/cashier.png">結帳</caption>  
                                                <!--        <caption style="height: 50px;background-color: peachpuff;line-height: 50px;margin: 50px;">結帳 畫面改</caption>  -->


                                                <thead>
                                                        <tr style="width: 100%;background-color:  #eee;height: 40px;">
                                                                <th >編號</th>
                                                                <th colspan="2">名稱</th>
                                                                <th>售價</th>
                                                                <th>數量</th>
                                                        </tr>
                                                </thead>                
                                                <tbody>
                                                        <%
                                                                int a = 0;

                                                                for (CartItem item : cart.getCartItemSet()) {
                                                                        a = a + 1;

                                                        %>
                                                        <tr>
                                                                <!--編號-->
                                                                <td><div class="cart_number"><%= a%></div></td>
                                                                <!--名稱-->
                                                                <td style="text-align: left;" colspan="2"> 
                                                                        <img style='width:75px;vertical-align: middle' src='<%=item.getProduct().getPhotoUrl()%>'>
                                                                        <a href="/gtt/product.jsp?productId=<%= item.getProduct().getId()%>"><%=item.getProduct().getName()%></a>
                                                                </td>
                                                                <!--售價-->
                                                                <td><%=  Math.round(item.getProduct().getPrice())%></td>
                                                                <!--數量-->
                                                                <td><%= cart.getItemQuantity(item)%></td>                            
                                                        </tr>
                                                        <%}%>
                                                </tbody>


                                                <tfoot>                    


                                                        <tr>
                                                                <td colspan="5"> 

                                                                        <div style="">
                                                                                <div class="big_label">付款方式:</div>

                                                                                <select class="pa_type" style="" name="paymentType" id="paymentType" required onchange="generateShippingOption()" >
                                                                                        <option " value="">請選擇...</option>
                                                                                        <% for (PaymentType pType : PaymentType.values()) {%>
                                                                                        <option value="<%= pType.name()%>"><%= pType%></option>
                                                                                        <% }%>
                                                                                </select>

                                                                                <script>

                                                                                        //付款方式
                                                                                        function generateShippingOption() {
                                                                                                //console.log($("#paymentType").val());
                                                                                                if ($("#paymentType").val().length > 0) {
                                                                                                        $.ajax({
                                                                                                                url: 'generate_shipping_option.jsp?paymentType=' + $("#paymentType").val()
                                                                                                        }).done(generateShippingOptionDoneHandler);
                                                                                                } else {
                                                                                                        $("#shippingType").empty();
                                                                                                        $("#shippingType").append("<option value=''>請選擇...</option>");
                                                                                                }
                                                                                        }

                                                                                        function generateShippingOptionDoneHandler(result) {
                                                                                                //console.log(result);
                                                                                                $("#shippingType").empty();//刪除所有內容
                                                                                                $("#shippingType").append(result);
                                                                                        }



                                                                                        //貨運方式
                                                                                        function getFee() {
                                                                                                console.log("$('#paymentType').val()===" + $("#paymentType").val());
                                                                                                console.log("$('#shippingType').val()===" + $("#shippingType").val());
                                                                                                if ($("#paymentType").val().length > 0 && $("#shippingType").val().length > 0) {
                                                                                                        $.ajax({
                                                                                                                url: 'get_fee.jsp?paymentType=' + $("#paymentType").val() + "&shippingType=" + $("#shippingType").val()
                                                                                                        }).done(getFeeDoneHandler);
                                                                                                }
                                                                                        }

                                                                                        function getFeeDoneHandler(result) {
                                                                                                var fee = parseFloat(result);
                                                                                                console.log("parseFloat(result)===" + parseFloat(result));//手續費
                                                                                                var allfee = parseFloat(result) + parseFloat($("#allfeeSpan").text());//取得總金額


                                                                                                console.log("allfee===" + allfee);
                                                                                                $("#allfeeSpan").text(allfee);//回傳到總金額
                                                                                                $("#feeSpan").text(fee);
                                                                                        }
                                                                                </script>
                                                                        </div>


                                                                        <div style="margin:  0 0 50px 0;">
                                                                                <div class="big_label">貨運方式:</div>
                                                                                <select class="sh_type" name="shippingType" id="shippingType" required onchange="getFee()" >                                        
                                                                                        <option value="">請選擇...</option>
                                                                                </select>
                                                                        </div>



                                                                </td>
                                                        </tr>


                                                        <tr >
                                                                <td   colspan="2">購買了</td>
                                                                <td colspan="3" style='background-color: #eee;width: 300px;'><%= cart.getTotalQuantity()%>項商品</td>
                                                        </tr>    
                                                        <tr ><td colspan="5"><hr style="margin: 0;"></td></tr>


                                                        <tr>
                                                                <td colspan="2">小計</td>
                                                                <td colspan="3" style='background-color: #eee;width: 300px;'><%= Math.round(cart.getTotalAmount())%>元</td>
                                                        </tr>       
                                                        <tr ><td colspan="5"><hr style="margin: 0;"></td></tr>


                                                        <tr>
                                                                <td colspan="2">運費</td>
                                                                <td colspan="3"style='background-color: #eee;'><span id="feeSpan">0</span>元</td> 

                                                        </tr>   
                                                        <tr ><td colspan="5"><hr style="margin: 0;"></td></tr>


                                                        <tr>
                                                                <td colspan="2">總金額</td>
                                                                <td colspan="3"style='background-color: #eee;'><span id="allfeeSpan"><%=  Math.round(cart.getTotalDiscountedAmount())%></span>元</td>
                                                        </tr>       
                                                        <tr ><td colspan="5"><hr style="margin: 0;"></td></tr>





                                                        <tr>
                                                                <td colspan="5">
                                                                        <div class="user_data" style="text-align: left;">
                                                                                <legend class="big_label" >訂購人</legend>
                                                                                <label>姓名:</label><input readonly value="<%= member.getName()%>" id="name"><br>
                                                                                <label>電郵:</label><input readonly value="<%= member.getEmail()%>" id="email"><br>
                                                                                <label>電話:</label><input readonly value="${sessionScope.member.phone}" id="phone"><br>
                                                                                <label>地址:</label><input readonly value="${sessionScope.member.address}" id="addr"><br>
                                                                        </div>
                                                                        <div class="user_data" style="text-align: left;position: relative">
                                                                                <legend class="big_label">收件人 <a style="position: absolute; right:  0;" href="javascript:copy()" >同訂購人</a></legend>
                                                                                <label>姓名:</label><input required value="" name="recipientName" id="recipientName"><br>
                                                                                <label>電郵:</label><input required value="" name="recipientEmail" id="recipientEmail"><br>
                                                                                <label>電話:</label><input required value="" name="recipientPhone" id="recipientPhone"><br>
                                                                                <label>地址:</label><input required value="" name="recipientAddr" id="recipientAddr"><br>
                                                                        </div>
                                                                        <script>
                                                                                function copy() {
                                                                                        $("#recipientName").val($("#name").val());
                                                                                        $("#recipientEmail").val($("#email").val());
                                                                                        $("#recipientPhone").val($("#phone").val());
                                                                                        $("#recipientAddr").val($("#addr").val());
                                                                                }
                                                                        </script>
                                                                </td>
                                                        </tr>



                                                        <tr>
                                                                <td colspan="1"><input  class="again_input" type='button' value='繼續購物' onclick='goshopping()'></td>
                                                                <td colspan="3"></td> 
                                                                <td colspan="1"><input class="sub_data" type="submit" value="送出訂單"></td>                            
                                                        </tr>


                                                </tfoot>                
                                        </table>                        
                                </form>
                                <%} else {%>
                                <p>購物車是空的! 請<a href="<%= request.getContextPath()%>/products_list.jsp">回賣場購物</a>後才執行結帳功能</p>
                                <%}%>
                        </div>
                </div>

                <!--網頁最尾層：產品搜尋footer -->
                <jsp:include page="/WEB-INF/subviews/picture/footer.jsp" />
        </body>
</html>
