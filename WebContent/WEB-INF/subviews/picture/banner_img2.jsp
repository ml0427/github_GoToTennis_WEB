<%-- 
    Document   : banner_img2
    Created on : 2018/5/29, 上午 09:40:00
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

                    <div class="slideshow-container">
                              <div class="mySlides fade">
                                        <img src="http://nanda.menet.com.tw/images/banner/6927238000.jpg" style="width:100%">
                              </div>

                              <div class="mySlides fade">
                                        <img src="http://nanda.menet.com.tw/images/banner/7308163036.jpg" style="width:100%">
                              </div>

                              <div class="mySlides fade">
                                        <img src="http://nanda.menet.com.tw/images/banner/3508318935.jpg" style="width:100%">
                              </div>

                              <div class="mySlides fade">
                                        <img src="http://nanda.menet.com.tw/images/banner/9638440554.jpg" style="width:100%">
                              </div>

                              <div style="text-align:center">
                                        <span class="dot" onclick="currentSlide(1)"></span> 
                                        <span class="dot" onclick="currentSlide(2)"></span> 
                                        <span class="dot" onclick="currentSlide(3)"></span> 
                                        <span class="dot" onclick="currentSlide(4)"></span> 
                              </div>
                              <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                              <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    </div>
                    <br>



                    <script>
                                var slideIndex = 1;
                                showSlides(slideIndex);

                                function plusSlides(n) {
                                            showSlides(slideIndex += n);
                                }

                                function currentSlide(n) {
                                            showSlides(slideIndex = n);
                                }

                                function showSlides(n) {
                                            var i;
                                            var slides = document.getElementsByClassName("mySlides");
                                            var dots = document.getElementsByClassName("dot");
                                            if (n > slides.length) {
                                                        slideIndex = 1
                                            }
                                            if (n < 1) {
                                                        slideIndex = slides.length
                                            }
                                            for (i = 0; i < slides.length; i++) {
                                                        slides[i].style.display = "none";
                                            }
                                            for (i = 0; i < dots.length; i++) {
                                                        dots[i].className = dots[i].className.replace(" active", "");
                                            }
                                            slides[slideIndex - 1].style.display = "block";
                                            dots[slideIndex - 1].className += " active";
                                }
                    </script>