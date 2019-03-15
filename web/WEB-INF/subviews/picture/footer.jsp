<%-- 
    Document   : footer
    Created on : 2018/6/12, 上午 11:10:21
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <script type="text/javascript">
            $(function () {
                $("#gotop").click(function () {
                    jQuery("html,body").animate({
                        scrollTop: 0
                    }, 1000);
                });
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 300) {
                        $('#gotop').fadeIn("fast");
                    } else {
                        $('#gotop').stop().fadeOut("fast");
                    }
                });
            });
        </script> 
        
        
        
        <b:if cond='data:blog.isMobile'> 
            <b:else/>
            <div id='gotop' ><center>TOP</center></div> 
        </b:if>


<div id="footer">
        <div class="container">

                <div class="aa">
                        <img style="width: 100%;" src="/gtt/IMG/11.jpg" alt=""><br>					
                        <p  class="margin-top-15">本店專賣各式網球拍、球具、穿線及其他週邊商品。我們商品將不定期更新，如對商品有任何問請來信或來電洽詢。</p>
                </div>

                <div class="bb" >
                        <h3 class="headline footer">聯絡方式</h3><span class="line"></span><div class="clearfix"></div>
                        <ul class="footer-links">
                                <li class="address"><a>地址：<br>台北市松山區復興北路99號14樓</a></li>
                                <li class="phone"><a>電話：<br>(02)888-8888</a></li>
                                <li class="email"><a href="">Email：<br> ml0427@gmail.com</a></li>
                        </ul>
                </div>

                <div class="cc">
                        <h3 class="headline footer">網站說明</h3><span class="line"></span><div class="clearfix"></div>
                        <ul class="footer-links">

                                <li><a href="">關於我們</a></li>
                                <li><a href="">聯絡我們</a></li>
                                <li><a href="">購物須知</a></li>
                                <li><a href="">退換貨說明</a></li>
                                <li><a href="">隱私權保護</a></li>
                        </ul>
                </div>

                <div class="dd">
                        <h3 class="headline footer">會員中心</h3><span class="line"></span><div class="clearfix"></div>
                        <ul class="footer-links">
                                <li><a href="">會員中心</a></li>
                                <li><a href="">購物車內容</a></li>
                                <li><a href="">結帳</a></li>
                        </ul>
                </div>
                <div style="width: 100%;text-align: center;">
                        <hr >
                        <p style="width: 100%;text-align: center;">版權所有 &copy; GoToTennis</p>
                </div>
        </div>

</div>