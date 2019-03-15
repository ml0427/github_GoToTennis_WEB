<%-- 
    Document   : product_select_css
    Created on : 2018/6/4, 上午 12:40:44
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<style>




        /*產品清單區塊*/
        #product_list{
                text-align: center;
        }
        #product_list li{
                background-color: #eee;
                border: 1px #eee solid;
                display: inline-table;
                width: 234px;
                height: 350px;
                margin:5px; 
                /*box-shadow: lightgray 2px 2px 10px;*/
                position: relative;/*absolute相對位置的基礎*/
        }


        #product_list li img{
                width:234px;
                position: absolute;/*定位在相對位置*/
                left: 0px;/*相對位置的起始點*/
                /* CSS3淡出淡入效果,0.3秒 */  
                -webkit-transition: opacity 0.3s ease-in-out;
                -moz-transition: opacity 0.3s ease-in-out;
                -o-transition: opacity 0.3s ease-in-out;
                transition: opacity 0.3s ease-in-out;
        }
        #product_list li img:nth-of-type(2):hover{
                opacity:0; /*滑鼠滑入時，透明度變0*/
        }



        .pro{
                background: white;
        }

        .up_page{
                background-color: #ccc;
                height: 43px;
        }
        .up_page a{
                                text-decoration:none;
                text-align: center;
                line-height :37px;

                margin:  3px 3px 3px 3px;
                background-color: #999999;
                color: white;

                float: left;
                width: 37px;
                height: 37px;


        }
        

        /*選頁部分*/
        .page{
                background-color: #ccc;
                 height: 43px;
        }
        .page  a{
                text-decoration:none;
                text-align: center;
                line-height :37px;

                margin:  3px 3px 3px 3px;
                background-color: #999999;
                color: white;

                float: left;
                width: 37px;
                height: 37px;


        }

</style>