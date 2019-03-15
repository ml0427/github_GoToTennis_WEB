<%-- 
    Document   : nav_css
    Created on : 2018/5/29, 上午 02:26:27
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script
    src="https://code.jquery.com/jquery-1.12.4.js"
    integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
crossorigin="anonymous"></script>   
<!--<link rel="icon" type="image/ico" href="/gtt/IMG/logo2.ico" />-->
<link rel="icon" type="image/ico" href="/gtt/IMG/Top logo1.ico" />
<style>
          @import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);


                    body{
                      font-family: ‘cwTeXYen’, sans-serif;
                      background:  #ccc;
                      margin: auto;
                      width: 85%;
                      min-width: 730px;
                      /*max-width: 1200px;*/
          }      
          div, span, h1, h2, h3, h4, h5, h6, p, a,img,samp, dl, dt, dd, ol, ul, li, form, label, table, th, td{
                      margin: 0;
                      padding: 0;
                      border: 0;
                      font-size: 100%;
          }
          /*    網頁第一層：登入登出    */
          .nav{
                      background: #eee; 
                      width: 100%;
                      height: 40px;
                      float: left;
                      font-size: 13px;
          }
          .nav span a{
                      text-decoration:none;
                      margin: 0  0 0 20px;
                      color:  #666666;
                      line-height:40px;/*文字垂直置中   要跟父層的高度一樣*/
          }
          .nav span p{
                      text-decoration:none;
                      margin: 0  80px 0 0;
                      color:  #666666;
                      line-height:40px;/*文字垂直置中   要跟父層的高度一樣*/
                      font-size: 15px;
          }
</style>
                    <script>
//                                $(document).ready(readyHandler);
                                $(document).ready();
                                function login() {
                                            //同步請求:
                                            location.href = "login.jsp";


                                            //非同步請求:
//                                                            $.ajax({
//                                                                url: 'login.jsp',
//                                                                method: 'GET'
//                                                            }).done(loginDoneHandler);
                                }

                                function loginDoneHandler(result) {
                                            //                alert(result);
                                            //                $("#login_dialog").remove();
                                            //                $(document).append("<div id='login_dialog'></div>");
                                            $("#login_dialog").html(result);
                                            $.fancybox.open({
                                                        src: '#login_dialog', type: 'inline'
//                                                                                    ,opts: {
//                                                                                        afterShow: function (instance, current) {
//                                                                                            console.info('done!');
//                                                                                        }
//                                                                                    }
                                            });
                                }
                    </script>       