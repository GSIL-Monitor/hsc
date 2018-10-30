<@override name="jstext">
<script>

    function delPost(id) {

        ConfirmMsg("确定要删除此职位？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/post/delPost.action';
                var params = {
                    id: id
                };
                ajaxInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.href = '${ctxPath}/post/manage.action';
                    }
                })
            }
        });
    }

    function search() {
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
                    <span class="caption-subject bold uppercase main-content-title">职位列表 </span>
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <button id="sample_editable_1_new" class="btn btn-default  btn-sm"
                                onclick="goto('${ctxPath}/post/toAdd.action','searchForm')"><i class="fa fa-plus"></i>
                            新增
                        </button>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <form class="search-form form-horizontal" action="${ctxPath}/post/manage.action"
                      id="searchForm"
                      method="post">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">关键字</label>

                                    <div class="col-md-9">
                                        <input type="text" id="keyword" name="keyword"
                                               value="${RequestParameters.keyword!''}" class="form-control"
                                               placeholder="请输入职位名称查询">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 col-sm-6">
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
                            <th> 职位名称</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <#import "../rownum.ftl" as q>
                                <#list pageInfo.list as post>
                                <tr class="odd gradeX">
                                    <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=post_index /></td>
                                    <td> ${post.name!''}</td>
                                    <td>
                                        <a href="javascript:goto('${ctxPath}/post/toUpdate.action?id=${post.id}','searchForm')"
                                           class="btn btn-default  btn-sm tooltips" data-original-title="修改">
                                            <i class="fa fa-edit"></i>
                                        </a>

                                        <a href="javascript:void(0);" onclick="delPost(${post.id})"
                                           class="btn btn-default  btn-sm tooltips" data-original-title="删除">
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
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/post/manage.action" pageid="user_list_form"/>
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
