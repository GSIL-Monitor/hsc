<@override name="jstext">
<script>

    function search() {
        var shopcode = $('#shopcode').val();
        if (checkEmpty(shopcode)) {
            AlertMsg('请选择商户！');
            return;
        }
        $("#searchForm").attr('action', '${ctxPath}/branch/manage.action');
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

<div class="row">
    <div class="col-md-12">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class="icon-settings font-dark"></i>
                    <span class="caption-subject bold uppercase main-content-title">门店管理 </span>
                </div>
            </div>
            <div class="portlet-body form">
                <form action="#" id="searchForm" class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">商户</label>

                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <input class="form-control" placeholder="选择商户" id="shopname"
                                                   readonly="readonly" name="shopname"
                                                   value="${RequestParameters.shopname!''}"/>
                                            <input type="hidden" id="shopid" name="shopid"
                                                   value="${RequestParameters.shopid!''}"/>
                                            <input type="hidden" id="shopcode" name="shopcode"
                                                   value="${RequestParameters.shopcode!''}"/>
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
                            <div class="col-md-4 col-sm-6">

                                <div class="form-group">
                                    <label class="control-label col-md-3">关键字</label>

                                    <div class="col-md-9">
                                        <input type="text" id="keyword" name="keyword"
                                               value="${RequestParameters.keyword!''}" class="form-control"
                                               placeholder="请输入门店名称/门店编码进行查询">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-2 col-sm-6">
                                <button type="button" class="btn btn-default " onclick="search()">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th style="width:48px"> 序号</th>
                            <th> 编码</th>
                            <th> 名称</th>
                            <th> 联系人</th>
                            <th> 联系电话</th>
                            <th> 联系地址</th>
                            <th> 创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <#import "../rownum.ftl" as q>
                                <#list pageInfo.list as branch>
                                <tr>
                                    <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=branch_index /></td>
                                    <td> ${branch.branchcode!''}</td>
                                    <td> ${branch.branchname!''}</td>
                                    <td> ${branch.contact!''}</td>
                                    <td> ${branch.contactnum!''}</td>
                                    <td> ${branch.contactaddress!''}</td>
                                    <td> ${branch.createtime!''}</td>
                                </tr>
                                </#list>
                            <#else>
                            <tr>
                                <td valign="top" colspan="7" class="dataTables_empty">暂无数据</td>
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
    </div>
</div>



</@override>
<@override name="window">
    <#include "../shop/choose-shop.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>