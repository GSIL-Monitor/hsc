<@override name="jstext">
<script>

    //zlf.common.initSearchUrl('${ctxPath}/branch/manage.action');

    function searchBranch() {
        var shopcode = $('#shopcode').val();
        if (checkEmpty(shopcode)) {
            AlertMsg('请选择商户！');
            return;
        }
        var keyword = $('#keyword').val();
        var groupcode = $('#groupcode').val();
        /*$('#shopcodeorigin').val(shopcode);
        $('#keywordorigin').val(keyword);
        $('#groupcodeorigin').val(groupcode);*/
        $("#searchForm").attr('action', '${ctxPath}/branch/manage.action');
        $("#searchForm").submit();
        //zlf.common.search();
    }

    function resetBranch() {
        $("#shopcode").val("");
        $("#shopname").val("");
        $("#shopid").val("");
        $("#keyword").val("");
        $("#groupcode").val("");
        $("#searchForm").attr('action', '${ctxPath}/branch/manage.action');
        $("#searchForm").submit();
    }

    function exportExcel() {
        var shopcode = $('#shopcode').val();
        if (checkEmpty(shopcode)) {
            AlertMsg('请选择商户！');
            return;
        }
        var totalrecord = $('#totalrecord').val();
        if(totalrecord == 0 ){
            AlertMsg('请确定导出数据');
            return;
        }
        $("#searchForm").attr('action', '${ctxPath}/branch/export.action');
        $("#searchForm").submit();
    }


    function chooseShop(e) {
        ChooseShop.open(null, function (data) {
            var shopname = checkEmpty(data.name) ? data.code : data.name + "-" + data.code;
            $(e).parent().prev().prev().prev().val(shopname);
            $(e).parent().prev().prev().val(data.id);
            $(e).parent().prev().val(data.code);
        })
    }

</script>
</@override>
<@override name="right">

<div class="actions pull-right" style="overflow: hidden;">
    <button type="button" class="btn btn-default  btn-sm " onclick="exportExcel()">
        <i class="icon-doc"></i> 导出数据
    </button>
</div>
<div class="panel panel-info">
    <div class="panel-heading">筛选</div>
    <div class="panel-body">
        <div class="portlet-body form">
            <form action="#" id="searchForm" class="form-horizontal" method="post">
                <div class="form-body">
                    <div class="row">
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group">
                                    <label class="control-label col-md-4">选择商户</label>
                                    <div class="col-md-7">
                                        <div class="input-group">
                                            <input class="form-control" placeholder="选择商户" id="shopname"
                                                   readonly="readonly" name="shopname" value="${RequestParameters.shopname!''}"/>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" onclick="chooseShop(this)"
                                                                type="button">
                                                            <i class="icon-magnifier"></i>
                                                        </button>
                                                    </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group">
                                    <label class="control-label col-md-4">门店关键字</label>
                                    <div class="col-md-7">
                                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="门店名称/门店编号" value="${RequestParameters.keyword!''}">
                                        <input type="hidden" id="shopcodeorigin" name="shopcodeorigin" value="${RequestParameters.shopcode!''}"/>
                                        <input type="hidden" id="keywordorigin" name="keywordorigin" value="${RequestParameters.keyword!''}"/>
                                        <input type="hidden" id="groupcodeorigin" name="groupcodeorigin" value="${RequestParameters.groupcode!''}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group">
                                    <label class="control-label col-md-4">门店类型</label>
                                    <div class="col-md-7">
                                        <select class="form-control" name="groupcode" id="groupcode" value="${RequestParameters.groupcode!''}">
                                            <option value="" >全部</option>
                                            <option value="001" <#if (groupcode!'') == '001'>selected</#if>>总店</option>
                                            <option value="002" <#if (groupcode!'') == '002'>selected</#if>>自营</option>
                                            <option value="003" <#if (groupcode!'') == '003'>selected</#if>>加盟</option>
                                        </select>
                                    </div>
                                </div>
                           </div>
                            <div class="col-md-1 col-sm-1">
                                <button type="button" class="btn btn-default " onclick="searchBranch()">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                            </div>
                            <div class="col-md-1 col-sm-1">
                                <button type="button" class="btn btn-default " onclick="resetBranch()">重置
                                </button>
                            </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

        <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="48px"> 序号</th>
                            <th> 门店编号</th>
                            <th> 门店名称</th>
                            <th> 所在区域</th>
                            <th> 负责人</th>
                            <th> 负责人电话</th>
                            <th> 门店状态</th>
                            <th> 门店类型</th>
                            <th> 到期时间</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <input type="hidden" id="totalrecord" name="totalrecord" value="1"/>
                            <#else>
                                <input type="hidden" id="totalrecord" name="totalrecord" value="0"/>
                            </#if>
                            <#if pageInfo?? && pageInfo.list??>
                                <#import "../rownum.ftl" as q>
                                <#list pageInfo.list as branch>
                                <tr>
                                    <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=branch_index /></td>
                                    <td> ${branch.branchcode!''}</td>
                                    <td> ${branch.branchname!''}</td>
                                    <td> ${branch.regionname!''}</td>
                                    <td> ${branch.dutyperson!''}</td>
                                    <td> ${branch.dutypersonnum!''}</td>
                                    <td><#if (branch.isused!'') == 0 >禁用
                                    <#elseif (branch.isused!'') == 1> 正常</#if></td>
                                    <td> ${branch.groupname!''}</td>
                                    <td> <#if (branch.expirestime!'')?date lt .now?date > <span style="color:red;">${(branch.expirestime!'')?date}</span>
                                    <#elseif (branch.expirestime!'')?date gt .now?date > ${(branch.expirestime!'')?date}</#if></td>
                                    <td> <a href="javascript:goto('${ctxPath}/branch/queryRechargeList.action?branchcode=${branch.branchcode}&shopcode=${branch.shopcode}&keyword=${RequestParameters.keyword!''}&groupcode=${RequestParameters.groupcode!''}&shopname=${RequestParameters.shopname!''}');">购买记录</a>
                                        <a href="javascript:goto('${ctxPath}/branch/queryDeviceRechargeList.action?branchcode=${branch.branchcode}&shopcode=${branch.shopcode}&devicetype=1&keyword=${RequestParameters.keyword!''}&groupcode=${RequestParameters.groupcode!''}&shopname=${RequestParameters.shopname!''}');">终端查询</a>
                                    </td>
                                </tr>
                                </#list>
                            <#else>
                            <tr>
                                <td valign="top" colspan="10" class="dataTables_empty">暂无数据</td>
                            </tr>
                            </#if>
                        </tbody>
                    </table>
                </div>
    </div>
        <#if pageInfo?? && pageInfo.totalRecords gt 0>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <form id="branch_list_form" method="post">
                            <#import "../pager.ftl" as q>
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/branch/manage.action" pageid="branch_list_form"/>
                        </form>
                    </div>
                </div>
            </#if>
</div>


</@override>
<@override name="window">
    <#include "choose-shop.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>