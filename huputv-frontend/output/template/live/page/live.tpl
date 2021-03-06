{%extends file="common/page/layout.tpl"%} 
{%block name="block_head_static"%}
{%require name="common:widget/rpz-board/rpz-board.scss"%}
{%require name="live:static/live/live.scss"%}
{%require name="common:static/js/videojs/video-js.css"%}
{%require name="common:static/js/videojs/ie8/videojs-ie8.js"%}
{%require name="common:static/js/videojs/video.js"%}
{%require name="common:static/js/videojs/videojs-hls.min.js"%}
{%require name="live:static/live/live.js"%}
<script src="http://b3.hoopchina.com.cn/code/zeroClipboard/1.3.5/ZeroClipboard.js"></script>
<script>
        HTV.roomID = "{%$live.id|f_escape_js%}" || 0;
        HTV.shareUrl = "{%$live.abs_share_url|f_escape_js%}";
        HTV.matchID = "{%$live.match_id|f_escape_js%}" || 0;
        HTV.token = "{%$token|f_escape_js%}"
        // 充值虎扑币
        HTV.rechargeUrl = "{%$recharge_url|f_escape_js%}" || "";
        HTV.beansRechargeUrl = "{%$beans_recharge_url|f_escape_js%}" || "";
        HTV.chatroomData = {
            et: 1000,
            token: "",
            via: "pc",
            room_id: "{%$live.id|f_escape_js%}",
            match_id: "{%$live.match_id|f_escape_js%}"
        };
      
        HTV.socketIP = {%json_encode($sub_server)%} || [];
        HTV.zhiboAvatarUrl = '{%$live.avatar.header_big|f_escape_js%}';
        // 超能赛事
        {%if !empty($chaoneng_info)%}
          HTV.chaoneng = {%json_encode($chaoneng_info)%} || [];
          // videoJJ
          HTV.getVideoJJ = function(){
            return {
                 appkey: "{%$videojj.appkey|f_escape_js%}",
                 referer: "{%$videojj.referer|f_escape_js%}",
                 source: "{%$videojj.source|f_escape_js%}",
                 type: parseInt('{%$videojj.type|f_escape_js%}')
            }
          }
        {%/if%}
        // 分享数据
        HTV.shareData = {
        {%if !empty($live.online) && $live.online < 1000%}
            title: '我正在「{%$live.anchor_nickname|f_escape_js%}」的房间「{%$live.room_name|f_escape_js%}」观看直播，快来围观吧！#亮了网#正在直播',
        {%else%}
            title: '「{%$live.online|f_escape_js%}」人正在和我一起观看「{%$live.anchor_nickname|f_escape_js%}」直播「{%$live.room_name|f_escape_js%}」，还不快来围观。#亮了网#正在直播',
        {%/if%}
            qqSubTitle: '亮了网主播：「{%$live.anchor_nickname|f_escape_js%}」正在直播',
            url: '{%$task_share_url|f_escape_js%}',
            pic: '{%$live.cover|f_escape_js%}'
        };
        // 礼物列表数据
        HTV.giftData = {%json_encode($gift.list)%} || [];
        // 主播人品值
        HTV.rpzNumber = "{%$user.score|f_escape_js%}";
        // 视频流
        HTV.flashStreamAddress = function(){
            return {%if $live.is_live == 1 && $live.live_addr.status == 200%}{%json_encode($live.live_addr.result)%}{%else%}[]{%/if%}
        };

        HTV.countTime = {%$task.online.rest_time|f_escape_js%};
        HTV.onlineStatus = {%$task.online.status|f_escape_js%};
        HTV.beansNum = {%$task.online.cur_score|f_escape_js%} || 5;

        {%if !empty($predict)%}
        HTV.predData = {
            id: '{%$predict.id|f_escape_js%}',
            option1: '{%$predict.option1|f_escape_js%}',
            option2: '{%$predict.option2|f_escape_js%}',
            score: '{%$predict.score|f_escape_js%}',
            status: '{%$predict.status|f_escape_js%}',
            user_option: '{%$predict.user_option|f_escape_js%}',
            magnification: '{%$user.magnification|f_escape_js%}',
            total_score_1: '{%$predict.total_score_1|f_escape_js%}',
            total_score_2: '{%$predict.total_score_2|f_escape_js%}',
            total_score_1_percente: '{%$predict.total_score_1_percente|f_escape_js%}',
            total_score_2_percente: '{%$predict.total_score_2_percente|f_escape_js%}'
        }
        {%else%}
            HTV.predData = {magnification: '{%$user.magnification|f_escape_js%}'};
        {%/if%}
    </script>
{%script%}
        var PageEvent = require("common:widget/page-dace/page-dace.es6");

        /**
         * 发送百度自定义事件
         * @param {array} arr 自定内容
         */
        HTV.sendBaiduEvent = function(arr) {
            return PageEvent.sendBaiduEvent(arr);
        };

        /**
         * 发送百度播放自定义事件
         */
        HTV.sendBaiduPlayEvent = function(value, opt) {
            return PageEvent.sendBaiduPlayEvent(value, opt);
        };

        /**
         * 发送播放时长
         * @param {string} str dace的数据
         */
        HTV.sendDacePlayTime = function(str) {
            return PageEvent.sendDacePlayTime(str);
        }
    {%/script%}
{%/block%}
{%block name="content"%}
<div class="live-wrap">
<div class="col-1">
<div class="live-main">
<div class="row-top">
<h1 class="headline">
{%$live.room_name|f_escape_xml%}
</h1>
{%if !empty($live.category)%}
<div class="sort">
<a href="{%$live.abs_category_url|f_escape_xml%}">{%$live.category|f_escape_xml%}</a>
</div>
{%/if%}
<div class="online">
<span class="online-tag">Live</span>
<i class="icons-online"></i>
<span class="online-number" id="J_onlineCount">{%$live.online|f_escape_xml%}</span>人</div>
<div class="row-top-right">
{%widget
                            name="common:widget/share/share.tpl"
                        %}
</div>
</div>
<div class="row-zhubo">
<dl class="zhubo-info">
<dd class="avatar">
<img src="{%$live.avatar.header_big|f_escape_xml%}" alt=""/>
</dd>
<dd class="zhubo-name">
主播：{%$live.anchor_nickname|f_escape_xml%}
</dd>
<dd class="follow">
{%if !empty($live.is_follow) && $live.is_follow == 1%}
<a href="javascript:" class="button-follow button-unfollow" id="J_buttonFollow" data-type="0">
<span class="text">
取消关注</span>
{%if !empty($show_follow)%}
<span class="count" id="J_followCount">{%$live.following|f_escape_xml%}</span>
{%/if%}
</a>
{%else%}
<a href="javascript:" class="button-follow" id="J_buttonFollow" data-type="1">
<span class="text">
关注</span>
{%if !empty($show_follow)%}
<span class="count" id="J_followCount">{%$live.following|f_escape_xml%}</span>
{%/if%}
</a>
{%/if%}
{%if !empty($live.tips)%}
<div class="tag-list">
{%foreach from=$live.tips item=val key=keys%}
{%$val|f_escape_xml%}
{%/foreach%}
</div>
{%/if%}
</dd>
</dl>
<div class="zhubo-money">
<span class="item money-item">
<i class="icons-money"></i>
{%$gift.total_money|f_escape_xml%}
</span>
<span class="item beans-item">
<i class="icons-beans"></i>
{%$gift.total_beans|f_escape_xml%}
</span>
</div>
</div>
{%widget
                    name="live:widget/video-play/video.tpl"
                    data = $live
                %}
<div class="task-and-gift J_taskAndGift">
{%if !empty($chaoneng_info)%}
{%widget
                            name="live:widget/task/task.tpl"
                            chaoneng=true
                        %}
{%widget
                            name="live:widget/chaoneng/chaoneng.tpl"
                        %}
<div class="hide" style="display:none">
{%widget
                              name="live:widget/send-gift/gift.tpl"
                              datas=$gift.list
                          %}
</div>
{%else%}
{%widget
                            name="live:widget/task/task.tpl"
                            chaoneng=false
                        %}
<div class="gift-right">
{%if $login%}
<div class="my-wallet" id="J_myWallet">
<a href="{%$recharge_url|f_escape_xml%}" target="_blank" class="button coin-button">
<div class="icon"></div>
<div class="num J_count">{%$balance[6]|f_escape_xml%}</div>
</a>
<a href="{%$beans_recharge_url|f_escape_xml%}" target="_blank" class="button bean-button">
<div class="icon"></div>
<div class="num J_count">{%$balance[1]|f_escape_xml%}</div>
</a>
</div>
{%/if%}
{%widget
                                name="live:widget/send-gift/gift.tpl"
                                datas=$gift.list
                            %}
</div>
{%/if%}
</div>
</div>
<div class="live-sidebar">
{%widget
                    name="live:widget/gift-top/top.tpl"
                    data=$gift
                %}
{%widget
                    name="live:widget/chatroom/chatroom.tpl"
                %}
{%if !empty($login)%}
<a href="/predict/user/info" target="_blank" class="rpz-link">
<div class="thumb">
<em></em>
<img src="{%$user.avatar.header_small|f_escape_xml%}" alt="">
</div>
<div class="rpz-info">
<span class="result {%if intval($user.score) >= 0%}num{%else%}lose{%/if%}">人品值&nbsp;{%$user.score|f_escape_xml%}</span>
<span class="rate">x{%$user.magnification|f_escape_xml%}</span>
</div>
</a>
{%/if%}
</div>
</div>
<div class="col-2">
<div class="live-main">
{%widget name="live:widget/pred-game/pred.tpl"%}
{%if !empty($chaoneng_info) && !empty($chaoneng_info.game_description)%}
<div class="match-desc">
<h2>赛事介绍</h2>
<p>{%$chaoneng_info.game_description|f_escape_xml%}</p>
</div>
{%/if%}
{%widget
                    name="live:widget/live-recommend/recommend.tpl"
                    datas = $recommend
                %}
</div>
<div class="live-sidebar">
{%widget
                    name="live:widget/bulletin/bulletin.tpl"
                    data = $live.notice
                %}
{%widget
                    name="live:widget/today-rank/rank.tpl"
                    datas = $predict_today_rank
                %}
</div>
</div>
</div>
{%if !empty($predict)%}
{%widget
                    name="live:widget/guide/guide.tpl"                  
                  %}
{%/if%}
{%require name='live:page/live.tpl'%}{%/block%}
