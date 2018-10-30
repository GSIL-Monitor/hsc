<!DOCTYPE html>
<html lang="zh-cn">
<!-- BEGIN HEAD -->
<head>
    <title>中仑零售</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="中仑零售" name="description"/>
    <meta content="中仑零售" name="author"/>
    <link rel="shortcut icon" href="http://091801.zhonglunnet.com/web/images/favicon.png?version=1.0.0"/>
<#include "./default_cfg.ftl"/>
<#include "./base_css.ftl"/>
<@block name="cssfile"></@block>
<@block name="csstext"></@block>
    <script src="http://091801.zhonglunnet.com/web/assets/global/plugins/jquery.min.js?version=1.0.0"
            type="text/javascript"></script>
    <script src="http://091801.zhonglunnet.com/web/js/leftmenu.js?version=1.0.0"
            type="text/javascript"></script>
</head>
<body>
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

</script>
<div class="page-wrapper">

    <div class="w100p pr header">
        <div class="bannerContent m0a pr">
            <img src="https://041001.zhonglunnet.com/ptweb/images/faq/logo.png" class="pa t72"/>

            <div class="searchContent pa t80">
                <div class="searchForm mb14">
                    <form action="searchresult.html" method="get">
                        <input autocomplete="off" type="text" placeholder="输入问题关键字，找到答案" id="searchValue" class="fs16"/>
                        <input type="submit" id="btnsubmit" class="white fs16 pa t0">
                    </form>
                    <div class="guessresult pa t42 dn zi99999">
                        <ul class="fs14"></ul>
                    </div>
                </div>
                <p class="fs12 hotsearch">
                    <span class="white">热门搜索：</span>
                    <span><a href="search.action?keywords=小程序">小程序</a></span>
                    <span><a href="search.action?keywords=支付">支付</a></span>
                    <span><a href="search.action?keywords=授权">授权</a></span>
                </p>
            </div>
        </div>
    </div>
    <div class="w100p menuContent oh mb24">
        <div class="menu m0a">
            <ul>
                <li class="current"><a href="">新手指导</a></li>
                <li><a href="">问题汇总</a></li>
                <li><a href="contactus.html">联系我们</a></li>
            </ul>
        </div>
    </div>
    <div class="page-content-wrapper">
            <input type="hidden" name="helptype" id="helptype" value=""/>
            <input type="hidden" name="page" id="page" value=""/>
            <input type="hidden" name="titleid" id="titleid" value=""/>
            <input type="hidden" name="level1moduleid" id="level1moduleid" value=""/>
            <input type="hidden" name="level2moduleid" id="level2moduleid" value=""/>
        <div class="contentwrap m0a">
            <div class="left fl mb100">
                <div class="catlist">
                    <div class="catMenu pr">
                    <#if level1ModelList?? >
                        <#list level1ModelList as level1List>
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

            <div class="cb"></div>

        </div>
    </div>
</div>
</body>
<#include "./base_js.ftl"/>
</html>