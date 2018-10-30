<@override name="jsfile">
</@override>
<@override name="cssfile">
</@override>
<@override name="jstext">
<script>
    function search() {
        $("#searchForm").submit();
    }

    function reset() {
        $("#searchForm").reset();
    }


    function examine(id) {
        var url = '${ctxPath}/system/releaseVersion.action';
        var params = {
            id: id
        };
        ajaxSyncInSameDomain(url, params, function (msg) {
            if (msg != "") {
                AlertMsg(msg);
            } else {
                AlertMsg("版本发布成功!");
                window.location.reload();
            }
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
                    <span class="caption-subject bold uppercase main-content-title"></span>
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <button id="sample_editable_1_new" class="btn btn-default  btn-sm"
                                onclick="goto('${ctxPath}/system/toAdd.action','searchForm')"><i
                                class="fa fa-plus"></i> 新增

                        </button>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <form class="form-horizontal" action="#"
                      id="searchForm" method="post">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-3">&nbsp;</label>

                                    <div class="col-md-9">
                                        <input type="text" id="keyword" name="keyword"
                                               value="${RequestParameters.keyword!''}" class="form-control"
                                               placeholder="可输入版本号/类型进行查询"></div>
                                </div>
                            </div>
                            <div class="col-md-2">
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
                            <th> 版本号</th>
                            <th> 类型</th>
                            <th> 版本说明</th>
                            <th> 发布时间</th>
                            <th> 状态</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <#import "../rownum.ftl" as q>
                                <#list pageInfo.list as system>
                                <tr>
                                    <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=system_index /></td>
                                    <td> ${system.version!''}</td>
                                    <td> ${system.type!''}</td>
                                    <td> ${system.changelog!''}</td>
                                    <td> ${system.publishtime!''}</td>
                                    <td>
                                        <#if (system.status!-1) == 1>
                                            <span class="label label-success">已发布</span>
                                        <#else>
                                            <span class="label label-default">未发布</span>
                                        </#if>
                                    </td>
                                    <td>
                                        <#if (system.status!0) != 1 &&system.version == system.maxversion>
                                            <a href="javascript:examine(${system.id!''});"
                                               class="btn btn-default  btn-sm"> 发布
                                                <i class="fa fa-check-square-o"></i>
                                            </a>

                                            <a href="javascript:goto('${ctxPath}/system/toUpdate.action?id=${system.id}','searchForm');"
                                               class="btn btn-default  btn-sm tooltips"
                                               data-original-title="修改">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                        </#if>
                                    </td>
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
                        <form id="user_list_form" method="post">
                            <#import "../pager.ftl" as q>
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/system/manage.action" pageid="user_list_form"/>
                        </form>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div>
</@override>
<@override name="window">
</@override>
<@extends name="../base_main.ftl"/>