<!DOCTYPE html>
<head>
<meta charset="utf-8"/>
<meta id="viewport" name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="apple-touch-icon" href="//b1.hoopchina.com.cn/common/apple-touch-icon.png"/>
<title>404-找不到页面</title>
{%if isset($daceChannel) %}
{%if isset($dacebbsfid)%}
{%dace fid=$dacebbsfid channel=$daceChannel%}
{%else%}
{%dace fid="" channel=$daceChannel%}
{%/if%}
{%else%}
{%dace fid="" channel=""%}
{%/if%}
<script type="text/javascript">
        {%if isset($daceChannel) %}
            var __daceDataNameOfChannel = '{%$daceChannel|f_escape_js%}';
            {%if isset($dacebbsfid) %}
            var __daceDataNameOfForum = '{%$dacebbsfid|f_escape_js%}';
            {%/if%}
        {%/if%}
      var __daceDataNameOfPage = '{%$id4dace|f_escape_js%}';
      //dace源码无法区别网站协议，在外层添加以支持https, @2016/06/01 by meiandai
      window.currentSchema = /^https/i.test(location.href) ? "https://" : "http://";
    </script>
<script type="text/javascript" src="//b3.hoopchina.com.cn/web/module/dace/m/m_dace.js"></script>
</head>
<style>
    html {
      height: 100%;
    }

    body {
      display: -webkit-box;  /* 老版本语法: Safari,  iOS, Android browser, older WebKit browsers.  */
      display: -moz-box;    /* 老版本语法: Firefox (buggy) */
      display: -ms-flexbox;  /* 混合版本语法: IE 10 */
      display: -webkit-flex;  /* 新版本语法： Chrome 21+ */
      display: flex;       /* 新版本语法： Opera 12.1, Firefox 22+ */

      /*垂直居中*/
      /*老版本语法*/
      -webkit-box-align: center;
      -moz-box-align: center;
      /*混合版本语法*/
      -ms-flex-align: center;
      /*新版本语法*/
      -webkit-align-items: center;
      align-items: center;

      /*水平居中*/
      /*老版本语法*/
      -webkit-box-pack: center;
      -moz-box-pack: center;
      /*混合版本语法*/
      -ms-flex-pack: center;
      /*新版本语法*/
      -webkit-justify-content: center;
      justify-content: center;

      margin: 0;
      height: 100%;
      /* needed for Firefox */
      width: 100%;
    }
    .wrap{
        padding:0 10px;
    }
    .wrap img{
        width: 48px;
        display: block;
        margin: 0 auto 10px;
    }
    .wrap p{
        font-size: 12px;
        color: #999;
        letter-spacing: 1px;
    }
    .wrap p span{
        color: #444;
    }
    .wrap p em{
        font-style: normal;
        color: #e31515;
    }
</style>
<div class="wrap">
<img src="//b3.hoopchina.com.cn/touch/static/common/images/icon_ef54db3.png" alt="">
<p><span>对不起，</span>你要访问的页面找不到，<em>3</em>秒后将自动跳转</p>
</div>
