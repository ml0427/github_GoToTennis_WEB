<%-- 
    Document   : menu_css
    Created on : 2018/5/29, 上午 12:12:22
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
          
          
          /*網頁第二層：選單第一層*/
          ul { /* 取消ul預設的內縮及樣式 */
                      list-style: none;
          }

          ul.drop-down-menu {
                      /*border: #ccc 1px solid;*/
                      display: inline-block;
                      /*font-family: 'Open Sans', Arial, sans-serif;*/
                      font-size: 13px;
          }

          ul.drop-down-menu li {
                      position: relative;/*position 屬性規定元素的定位類型。 relative 生成相對定位的元素，相對於其正常位置進行定位。*/
                      white-space: nowrap; /*white-space 屬性設置如何處理元素內的空白     nowrap 文本不會換行，文本會在在同一行上繼續，直到遇到<br> 標籤為止。*/
                      /*border-right: #ccc 1px solid;*/
          }

          ul.drop-down-menu > li:last-child {
                      border-right: none;
          }

          ul.drop-down-menu > li {
                      float: left; /* 只有第一層是靠左對齊*/
          }

          ul.drop-down-menu a {
                      background: #666666;
                      color: #fff;
                      display: block;
                      padding: 0 20px;
                      text-decoration: none;
                      line-height: 40px;

          }
          ul.drop-down-menu a:hover { /* 滑鼠滑入按鈕變色*/
                  background-color: #6699ff;
                      color: #fff;

          }
          ul.drop-down-menu li:hover > a { /* 滑鼠移入次選單上層按鈕保持變色*/
                      background-color: #6699ff;
                      color: #fff;
          } 
          /*第一層的選單*/

          /*第二層之後的*/
          ul.drop-down-menu ul {

                      /*border: #ccc 1px solid;*/
                      position: absolute;/*absolute 元素的定位是在他所處上層容器的相對位置。*/
                      z-index: 2;/*圖層*/
                      left: 0px;
                      top: 100%;
                      min-width: 180px;
          }
          ul.drop-down-menu ul ul { /*第三層以後的選單出現位置與第二層不同*/
                      z-index:3;
                      top: 0px;
                      left: 100%;
          }
          ul.drop-down-menu ul { /*隱藏次選單*/
                      display: none;
          }
          ul.drop-down-menu li:hover > ul { /* 滑鼠滑入展開次選單*/
                      display: block;
          }
</style>