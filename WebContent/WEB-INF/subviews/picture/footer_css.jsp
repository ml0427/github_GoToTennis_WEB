<%-- 
    Document   : footer_css
    Created on : 2018/6/12, 上午 11:11:03
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
        #footer a{
                text-decoration:none;
                color: whitesmoke;
        }
        #footer li{
                list-style-type:none;
                margin: 8px 0 0 0;
        }
        #footer ul {
                width: 100px;
                padding: 0;
        }
        .container{
                height: 300px;
                color: whitesmoke;
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

                
        .aa *{
                padding: 20px 10px 0 0;
                width: 250px;
        }
        .bb{
              
                padding: 20px 0px 0 50px;
                width: 140px;
        }
        .cc{
                margin: 0 50px 0 0;
                width: 80px;
                padding: 20px 0px;;
        }
        
        .dd{
                width: 80px;
                padding: 20px 5px;;
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
