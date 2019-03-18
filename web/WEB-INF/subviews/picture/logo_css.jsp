<%-- 
    Document   : logo_css
    Created on : 2018/5/30, 下午 01:11:19
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script
        src="https://code.jquery.com/jquery-1.12.4.js"
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
        crossorigin="anonymous">

</script>   
<script>

        function form_submit() {
                $("#search_form").submit();
        }
</script>
<style>

        /*信箱 電話 搜尋列*/

        .service ul li a,.logo ul li a{
                margin: 0 20px 0 0;
                text-decoration:none;
                font-size: 15px;
                height: 40px;
                line-height:40px;
        }
        .service ul li,.logo ul li{
                margin: 0 20px 0 0;
                float: right;
                font-size: 15px;
                height: 40px;
                line-height:40px;
        }
        /*購物車*/
        .cart{

                float: right;
                background: #6699ff;

                height: 40px;
                line-height:40px;   
                margin: 0 20px 0 0;
                font-size: 15px;
        }
        .cart div a{
                margin: 0 20px;
                text-decoration:none;
                color: white;
        }
        /*上層搜尋列*/
        .top-search{
                float: right;
                width:200px;
                background: #f5f5f5;
                margin: 0;
                padding: 0 0 0 0px;
                text-decoration:none;
                color: white;
                height: 40px;
                line-height:39px;  
                font-size: 15px;

        }
        /*輸入項*/
        .top-search input:nth-child(1){
                width:140px; 
                height: 40px;
                border: none;
                background: #f5f5f5;
                margin: 0;
                
                text-align: center;
               
     }
     
     /*搜尋紐*/
     .top-search input:nth-child(2){
             float: right;
             background: #ccc;

             padding:  6px; 
             height: 28px;
             border: none;

             width: 28px;
              cursor: pointer;
     }
</style>
