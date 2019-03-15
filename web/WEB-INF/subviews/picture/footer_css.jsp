<%-- 
    Document   : footer_css
    Created on : 2018/6/12, 上午 11:11:03
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
        #footer a{
                text-decoration:none;
                color: white;
        }
        #footer li{
                list-style-type:none;
                margin: 8px 0 0 0;
        }
        .container{
                
                color: white;
                background-color: #666666;
                font-size: 14px;
                text-align: center;/*display: inline對齊效果*/
        }
        .container div{
                display: inline-block;/*讓div並排*/ 
                vertical-align: top;/*就算個個div行數不同，也一律向上對齊*/ 
        }
        .container h3,.container p,.container li{
                text-align:left;
        }

                
        .aa{
                display: inline-block;
                width: 25%;
        }
        .bb{
                display: inline-block;
                width: 24%;
        }
        .cc{
                display: inline-block;
                width: 24%;
        }
        
        .dd{
                display: inline-block;
                width: 25%;
        }

         #gotop {
                 background: #666666;
                 color: white;
                 
                display: none;
                position: fixed;
                right: 0;
                bottom: 40px;    
                padding: 10px 15px;    
                font-size: 20px;

                
                cursor: pointer;
                
                opacity: .8;
            }
</style>
