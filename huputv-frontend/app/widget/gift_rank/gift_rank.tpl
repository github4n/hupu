<section class="t-content gift-rank" style="display:none;">
    <div class="sub-tab">
        <a href="javascript:;" class="active">本场榜</a>
        <a href="javascript:;">总榜</a>
    </div>
    <div class="subt-content" id="J-match-wrap">
    </div>
    <div class="subt-content" id="J-room-wrap" style="display:none;">
    </div>
    <script id="J-gift-tpl" type="text/template">
        <@if(!_.isEmpty(rank_list)){@>
            <table class="rank">
                <@$(rank_list).each(function(index, item){@>
                <tr>
                    <td>
                        <@if(index == 0){@>
                        <img src="./icon-num1.png" width="26" alt="" />
                        <@}else if(index == 1){@>
                        <img src="./icon-num2.png" width="26" alt="" />
                        <@}else if(index == 2){@>
                        <img src="./icon-num3.png" width="26" alt="" />
                        <@}else{@>
                            <@=index+1@>
                        <@}@>
                    </td>
                    <td><@=item.nickname@></td>
                    <td><@=item.total@></td>
                </tr>
                <@});@>
            </table>
        <@}else{@>
            <div class="no-gift">
                <img src="./no-gift.png" width="80" alt="" />
                <p>该主播还未收到礼物，快去打赏一下吧</p>
            </div>
        <@}@>
        <div class="tip">礼物排行数据不包含金豆礼物</div>
        <@if(!_.isEmpty(rank_list)){@>
        <table class="layout-footer my-rank">
            <@if(!_.isEmpty(user)){@>
            <tr>
                <td><@=user.rank@></td>
                <td><@=user.nickname@></td>
                <td><@=user.total@></td>
            </tr>
            <@}else{@>
            <tr>
                <td class="not-join" align="center">您还未参与过送礼，暂无排名</td>
            </tr>
            <@}@>
        </table>
        <@}@>
    </script>
</section>

{%script%}
    var giftRank = require("app:widget/gift_rank/gift_rank.js");
    giftRank.init();
{%/script%}
