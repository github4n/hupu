{%extends file="common/page/layout.tpl"%} 
{%block name="block_head_static"%}
{%require name="match:static/match-video/match-video.scss"%}
{%require name="match:static/match-video/match-video.js"%}
{%script%}
        require("match:widget/match-info/match-info.js");
        require("match:widget/top-tips/top-tips.js");
    {%/script%}
{%/block%}
{%block name="content"%}
{%widget
        name="common:widget/top-nav/top-nav.tpl"
    %}
{%assign var=top value=$adInfo.m_adword.nba_game_playbyplay%}
{%widget
        name="match:widget/top-tips/top-tips.tpl"
        isOpen=$top.isopen
        content=$top.adword
        url=$top.adurl
    %}
{%widget
        name="match:widget/match-info/match-info.tpl"
    %}
{%widget
    	name="common:widget/inner-tab/tab.tpl"
    	tabClass="match"
    	selected="视频"
    %}
<div class="common-list video-list" id="J_content" data-count="{%count($videos)%}" dace-node="{%$id4dace|f_escape_xml%}_video">
<ul>
{%foreach from=$videos item=video name=video%}
{%if $video@index<5%}
<li>
<a href="{%$video.fromurl|f_escape_xml%}" target="_blank" class="video-link" dace-node="{%$id4dace|f_escape_xml%}_video">
{%if {%$video.cover|f_escape_xml%} != ''%}
<div class="img-wrap" style="background-image:url({%$video.cover|f_escape_xml%})">
</div>
{%/if%}
<div class="video-txt">
<h3>{%$video.title|f_escape_xml%}</h3>
</div>
</a>
</li>{%else%}
<li style="display:none;">
<a href="{%$video.fromurl|f_escape_xml%}" target="_blank" class="video-link" dace-node="{%$id4dace|f_escape_xml%}_video">
{%if {%$video.cover|f_escape_xml%} != ''%}
<div class="img-wrap" style="background-image:url({%$video.cover|f_escape_xml%})"></div>
{%/if%}
<div class="video-txt">
<h3>{%$video.title|f_escape_xml%}</h3>
</div>
</a>
</li>
{%/if%}{%/foreach%}
</ul>
</div>
{%require name='match:page/match-video.tpl'%}{%/block%}