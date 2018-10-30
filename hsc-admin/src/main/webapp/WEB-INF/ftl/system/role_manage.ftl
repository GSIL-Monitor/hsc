<@override name="jstext">
<script>

    function delRole(id) {

        ConfirmMsg("确定要删除此角色？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/role/delRole.action';
                var params = {
                    id: id
                };
                ajaxInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        AlertMsg("删除成功", function () {
                            window.location.href = '${ctxPath}/role/manage.action';
                        });
                    }
                })
            }
        });
    }

    function search() {
        $("#searchForm").attr('action', '${ctxPath}/role/manage.action');
        $('#searchForm').submit();
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
                    <span class="caption-subject bold uppercase main-content-title">角色列表 </span>
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <button id="sample_editable_1_new" class="btn btn-default  btn-sm"
                                onclick="goto('${ctxPath}/role/toAdd.action','searchForm')">新增
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <form action="#" id="searchForm" class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label class="control-label col-md-3">关键字</label>

                                    <div class="col-md-9">
                                        <input type="text" id="keyword" name="keyword"
                                               value="${RequestParameters.keyword!''}" class="form-control"
                                               placeholder="可输入角色名称进行查询">
                                    </div>
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
                            <th> 角色名称</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <#import "../rownum.ftl" as q>
                                <#list pageInfo.list as role>
                                <tr class="odd gradeX">
                                    <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=role_index /></td>
                                    <td> ${role.name!''}</td>
                                    <td>
                                        <a href="javascript:goto('${ctxPath}/role/toUpdate.action?id=${role.id}','searchForm');"
                                           class="btn btn-default  btn-sm">
                                            <i class="fa fa-edit"></i>
                                        </a>

                                        <a href="javascript:delRole(${role.id});" class="btn btn-default  btn-sm">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                            <#else>
                            <tr>
                                <td valign="top" colspan="3" class="dataTables_empty">暂无数据</td>
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
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/role/manage.action" pageid="user_list_form"/>
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
