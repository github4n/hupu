<section class="player-rank mod-rank swiper-slide swiper-no-swiping" id="J-player-rank">
{%$isGoalsAllEmpty = true%}
{%foreach $rank[1].ranks_data as $val%}
{%if $val.data%}
{%$isGoalsAllEmpty = false%}
{%/if%}
{%/foreach%}
{%if !$isGoalsAllEmpty%}
<div class="nav">
<ul>
{%foreach $rank[1].ranks_data as $val%}
{%if $val.data%}
<li {%if $val@index == 0%} class="active" {%/if%}><a href="javascript:void(0);">{%$val.name|f_escape_xml%}</a></li>
{%/if%}
{%/foreach%}
</ul>
</div>
<ul class="main">
{%foreach $rank[1].ranks_data as $val%}
{%if $val.data%}
<li>
<table class="mod-title title">
<thead>
<tr>
<td width="50%" colspan="3" class="type"><span>{%if $val.name == "进球"%}射手{%else%}{%$val.name|f_escape_xml%}{%/if%}榜</span></td>
<td width="25%" align="center">球队</td>
<td width="25%" align="center">{%$val.title|f_escape_xml%}</td>
</tr>
</thead>
</table>
<table class="mod-table">
<tbody>
{%foreach $val.data as $subVal%}
{%if $subVal@index < 5%}
<tr {%if $league_name != "afccl"%}class="link tap" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/player/{%$subVal.player_pid|f_escape_xml%}"{%/if%}>
<td width="10%" align="left">
<span {%if $subVal.ranking == 1%} class="red num" {%else%} class="num" {%/if%}>{%$subVal.ranking|f_escape_xml%}</span>
</td>
<td width="10%" align="left">
<span class="logo">
<img data-original="{%$subVal.player_logo|f_escape_xml%}?t={%$val@index|f_escape_xml%}{%$subVal@index|f_escape_xml%}" class="lazy">
{%if !empty($night)%}
<span class="mask"></span>
{%/if%}
</span>
</td>
<td width="30%" align="left">
<span class="name">{%$subVal.player_name|f_escape_xml%}</span>
</td>
<td width="25%" align="center"><span class="team-name">{%$subVal.team_name|f_escape_xml%}</span></td>
<td width="25%" align="center">
{%if $val.rank_type == "pass_per_p"%}
{%$subVal[$val.field]*100%}%{%else%}
{%if $val.rank_type == "goals" ||  $val.rank_type == "assits"%}
{%$subVal[$val.rank_type]|f_escape_xml%}
{%else%}
{%$subVal[$val.field]|f_escape_xml%}
{%/if%}
{%/if%}
</td>
</tr>
{%/if%}
{%/foreach%}
<tr class="last-tr">
<td colspan="5" align="center">
<span class="view-all link all-link tap" link="/data/footballAllRank" data-type="{%$val.rank_type|f_escape_xml%}">查看全部 ></span>
</td>
</tr>
</tbody>
</table>
</li>
{%/if%}
{%/foreach%}
</ul>
{%else%}
<div class="mod-no-data">暂无球员榜数据</div>
{%/if%}
</section>
