{%extends file="app/page/layout.tpl"%}

{%block name="title"%}点播{%/block%}

{%block name="meta"%}
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="msapplication-tap-highlight" content="no">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="msapplication-tap-highlight" content="no">
<meta name="application-name" content="亮了网">
<script>
    window.HTV = {
        "game_id":"{%$video.gid%}",
        "tid": "{%$video.tid%}",
        "is_rated": parseInt("{%$video.is_rated%}"),
        "score": parseInt("{%$video.score%}"),
        "vid": parseInt("{%$video.vid%}"),
        "peopleScore": parseInt("{%$userInfo.score%}"),
        "isLogin": {%intval($is_login)%}
    }
    window.GM = {
        "version": "7.9.9" 
    };
    HTV.jumpLogin = function() {
        {%if !$is_login && !empty($login_url)%}
            window.location.href = '{%$login_url%}';
        {%/if%}
    };
</script>
{%/block%}

{%block name="head_static"%}
    {%require name="app:static/target_video/target_video.scss"%}
    {%require name="app:static/js/zepto/animate.js"%}
    {%require name="app:static/target_video/target_video.js"%}

    
{%/block%}

{%block name="content"%}
    {%* tab区域 *%}
    <section class="layout-tab">
        {%widget
            name="app:widget/video_tab/video_tab.tpl"
        %}
    </section>

    {%* 内容区域 *%}
    <section class="layout-main">
        
        {%widget
            name="app:widget/target_video/video_introduce/introduce.tpl"
        %}
        {%widget
            name="app:widget/target_video/player_statistics/statistics.tpl"
            player="statistics"
        %}
        {%widget
            name="app:widget/target_video/end_discuss/discuss.tpl"
        %}
    </section>

{%/block%}
