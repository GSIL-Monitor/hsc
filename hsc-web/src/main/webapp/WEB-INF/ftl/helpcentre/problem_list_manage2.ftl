<@override name="jstext">
<script>

    $(".catTitle.bgcfa").click(function () {
        var val = $(this).attr("value");
        var dnid = "d" + val;
        if ($('#' + dnid).is('.dn')) {
            $('#' + dnid).removeClass();
        } else {
            $('#' + dnid).addClass("dn");
        }
    })

    function refreshPage(page) {
        $("#page").val(page);
        $("#searchForm").submit();
    }

    function refreshTitleDetail(titleid) {
        $("#titleid").val(titleid);
        $("#searchForm").submit();
    }


</script>
<link type="text/css" rel="stylesheet" href="https://041001.zhonglunnet.com/gyl/css/common-min.css"/>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
</@override>
<@override name="right">
<form action="${ctxPath}/help/getproblemList.action" id="searchForm" method="post">
    <input type="hidden" name="helptype" id="helptype" value="${RequestParameters.helptype!''}"/>
    <input type="hidden" name="page" id="page" value=""/>
    <input type="hidden" name="titleid" id="titleid" value=""/>
    <input type="hidden" name="level1moduleid" id="level1moduleid" value=""/>
    <input type="hidden" name="level2moduleid" id="level2moduleid" value=""/>
</form>
<div class="contentwrap m0a">
    <div class="left fl mb100">
        <div class="catlist">
            <div class="catMenu pr">
                <#if data.level1ModelList?? >
                    <#list data.level1ModelList as level1List>
                        <div class="catTitle bgcfa"
                             value="n${level1List_index}">${level1List.levelmodulename!''}</div>
                        <#if level1List_index==0>
                        <ul class="" id="dn${level1List_index}">
                        <#else>
                        <ul class="dn" id="dn${level1List_index}">
                        </#if>
                        <#if level1List.level2ModelList?? >
                            <#list level1List.level2ModelList as level2List>
                                <li class="current">
                                    <a href="javascript:void(0)"
                                       onclick="refreshTitle(${level1List.level1moduleid},${level2List.level2moduleid})">${level2List.levelmodulename!''}</a>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
    <#if pageInfo?? && pageInfo.list??>
        <div class="right fl oh ml32">
            <div class="articlelist mb52">
                <ul class="fs16">
                    <#list pageInfo.list as titleList>
                        <li><a href="javascript:void(0)"
                               onclick="refreshTitleDetail(${titleList.titleid})">${titleList.title!''}</a></li>
                    </#list>
                </ul>
            </div>
            <#if pageInfo?? && pageInfo.totalRecords gt 0>
                <div class="pageInfo">
                    <ul>
                        <#import "../pager.ftl" as q>
                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords/>
                    </ul>
                </div>
            </#if>
        </div>
    </#if>

    <#if titleDetail??>
        <div class="right fl oh ml32">
            <div class="articleArea pr">
                <h1 class="fs24 fwn title mb20">${titleDetail.title!''}</h1>

                <div class="watchvideo pa r0 t0">
                    <!-- 下面的a标签的href的值 给第三方的视频链接 -->
                    <a href="" class="pl44 pt7" target="_blank">
                        观看完整视频教程
                    </a>
                </div>
                <div class="content lh26 fs14">
                </div>
            </div>
        </div>
    </#if>
    <div class="cb"></div>

</div>

</@override>
<@override name="window">
</@override>
<@extends name="../base_main.ftl"/>