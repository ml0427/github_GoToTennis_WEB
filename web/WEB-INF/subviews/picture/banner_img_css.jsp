<%-- 
    Document   : banner_img_css
    Created on : 2018/5/29, 上午 12:22:22
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
          .coverflow{
                      width: 100%;
                      position: relative;
          }
          .coverflow>a{     
                      display: block;
                      position: absolute;
                      top:0;
                      left:0;
                      opacity: 0;
                      filter: alpha(opacity=0);
                      /*當圖片數量增加，影片長度需更改，變為5s*圖片數量*/
                      -webkit-animation: silder 25s linear infinite;
                      animation: silder 25s linear infinite;
          }
          .coverflow>a>img{
/*                      max-width: 100%;*/
          }
          /*動畫關鍵影格*/
          @-webkit-keyframes silder {
                      3% {
                                  opacity: 1;
                                  filter: alpha(opacity=100);
                      }
                      27% {
                                  opacity: 1;
                                  filter: alpha(opacity=100);
                      }
                      30% {
                                  opacity: 0;
                                  filter: alpha(opacity=0);
                      }
          }
          @keyframes silder {
                      3% {
                                  opacity: 1;
                                  filter: alpha(opacity=100);
                      }
                      27% {
                                  opacity: 1;
                                  filter: alpha(opacity=100);
                      }
                      30% {
                                  opacity: 0;
                                  filter: alpha(opacity=0);
                      }
          }
          /*每個圖片各延遲5秒*/
          .coverflow>a:nth-child(5) {
                      -webkit-animation-delay: 20s;
                      animation-delay: 20s;            
          }
          .coverflow>a:nth-child(4) {
                      -webkit-animation-delay: 15s;
                      animation-delay: 15s;            
          }
          .coverflow>a:nth-child(3) {
                      -webkit-animation-delay: 10s;
                      animation-delay: 10s;            
          }

          .coverflow>a:nth-child(2) {
                      -webkit-animation-delay: 5s;
                      animation-delay: 5s;
          }

          .coverflow>a:nth-child(1) {
                      -webkit-animation-delay: 0s;
                      animation-delay: 0s;    
          }
          /*滑入時停止播放*/
/*          .coverflow:hover>a{
                      -webkit-animation-play-state: paused;
                      animation-play-state: paused;
          }*/

</style>