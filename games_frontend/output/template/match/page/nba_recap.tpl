{%extends file="common/page/layout.tpl"%} 
{%block name="title"%}战报{%/block%}
{%block name="head_static"%}
{%require name="common:static/js/zepto/zepto.js"%}
<script type="text/javascript" src="//w1.hoopchina.com.cn/hybrid/common/hpbridge_v1.0.1.js"></script>
<script>
        window.GM = {
            "night":!!parseInt("{%$night|f_escape_js%}", 10),
            "nopic":!!parseInt("{%$nopic|f_escape_js%}", 10)
        };
    </script>
{%script%}
        var oMore = $("#J-more");

        oMore.on("click", function(){
            if($(this).data("more") == "1"){
                $(this).find("em").html("收起");
                $(this).find("i").removeClass("icon-arrow-down").addClass("icon-arrow-up");
                $(this).parent().siblings(".more-li").show();
                $(this).data("more", "0");
            }else{
                $(this).find("em").html("更多");
                $(this).find("i").removeClass("icon-arrow-up").addClass("icon-arrow-down");
                $(this).parent().siblings(".more-li").hide();
                $(this).data("more", "1");
            }
        });

        var recap_data = require("match:widget/recap_v15/recap_v15.js");
        recap_data.init();
    {%/script%}
{%/block%}
{%block name="content"%}
<section class="recap-wrap">
{%widget
            name="match:widget/recap_v15/recap_v15.tpl"
            type="nba"
        %}
</section>
{%require name='match:page/nba_recap.tpl'%}{%/block%}
