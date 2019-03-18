<%-- 
    Document   : 測試用
    Created on : 2018/5/29, 上午 09:05:53
    Author     : USER


<%@page import="uuu.gtt.entity.Outlet"%>
<%@page import="uuu.gtt.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.gtt.service.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancybox/jquery.fancybox.css"> 
                <script
                        src="https://code.jquery.com/jquery-1.12.4.js"
                        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                crossorigin="anonymous"></script>   
                <script src='<%=request.getContextPath()%>/fancybox/jquery.fancybox.js'></script>    
                
                <script type="text/javascript">
                        $(document).ready(init);
                        function init() {

                                $.ajax({
                                        url: "test2.jsp?ajax=true",
                                        method: 'GET'
                                }).done(getProductPageDoneHandler);
                        }

                        function getProductPageDoneHandler(result) {
                                console.log(result);
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
        </head>
        <body>



<div id="product_detail"></div>



        </body>
</html> 
--%>