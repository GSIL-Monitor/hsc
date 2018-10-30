<@override name="jstext">
<script>

    function delUser(id) {

        ConfirmMsg("确定要删除此条信息？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/admin/user/delUser.action';
                var params = {
                    id: id
                };
                ajaxSyncInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.href = '${ctxPath}/admin/user/manage.action';
                    }
                })
            }
        });
    }

    function undoPassword(id) {
        ConfirmMsg("确定要重置该用户的密码？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/admin/user/undoPassword.action';
                var params = {
                    id: id
                };
                ajaxSyncInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        AlertMsg("密码已重置");
                    }
                })
            }
        });
    }

    function search() {
        $("#searchForm").attr('action', UrlHelper.getSearchUrl('${ctxPath}/admin/user/manage.action'));
        $("#searchForm").submit();
    }

    function chooseorg(e) {
        ChooseOrg.open(null, function (data) {
            $(e).parent().prev().prev().val(data.name);
            $(e).parent().prev().val(data.id);
        })
    }
    function choosepost(e) {
        ChoosePost.open(null, function (data) {
            $(e).parent().prev().prev().val(data.name);
            $(e).parent().prev().val(data.id);
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
                    <span class="caption-subject bold uppercase main-content-title">用户管理 </span>
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <button id="sample_editable_1_new" class="btn btn-default  btn-sm"
                                onclick="goto('${ctxPath}/admin/user/toAdd.action','searchForm')">新增
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
                                               placeholder="可输入用户名/姓名进行查询">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-default " onclick="search()">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                                <button type="button" class="btn btn-default " data-toggle="senior-search">
                                    <i class="fa fa-ellipsis-horizontal"></i> 高级搜索
                                    <i class="fa fa-angle-down"></i>
                                </button>
                            </div>
                        </div>
                        <div class="row senior-search">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-3">部门
                                        <span class="required" aria-required="true"></span></label>

                                    <div class="col-md-9">
                                        <div class="input-group">

                                            <input class="form-control" placeholder="选择部门" id="orgname"
                                                   readonly="readonly"
                                                   name="orgname" value="${RequestParameters.orgname!''}"/>
                                            <input type="hidden" id="orgid" name="orgid"
                                                   value="${RequestParameters.orgid!''}"/>
                                            <span class="input-group-btn">
                                                    <button class="btn btn-default" onclick="chooseorg(this)"
                                                            type="button">
                                                        <i class="icon-magnifier"></i>
                                                    </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-3">职位 <span class="required" aria-required="true"></span>
                                    </label>

                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <input class="form-control" placeholder="选择职位" id="postname"
                                                   readonly="readonly"
                                                   name="postname"
                                                   value="${RequestParameters.postname!''}"/>
                                            <input type="hidden" id="postid" name="postid"
                                                   value="${RequestParameters.postid!''}"/>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" onclick="choosepost(this)"
                                                                type="button"><i class="icon-magnifier"></i>
                                                        </button>
                                                    </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th style="width:48px"> 序号</th>
                            <th> 用户名</th>
                            <th> 姓名</th>
                            <th> 部门</th>
                            <th> 职位</th>
                            <th> 邮箱</th>
                            <th> 电话</th>
                            <th> 创建时间</th>
                            <th> 更新时间</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <#import "../rownum.ftl" as q>
                                <#list pageInfo.list as user>
                                <tr class="odd gradeX">
                                    <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=user_index /></td>
                                    <td>${user.account!''}</td>
                                    <td>${user.fullname!''}</td>
                                    <td>${user.orgname!''}</td>
                                    <td>${user.postname!''}</td>
                                    <td>${user.email!''}</td>
                                    <td>${user.tel!""}</td>
                                    <td>${user.createtime!""}</td>
                                    <td>${user.updatetime!""}</td>
                                    <td>
                                        <a href="javascript:undoPassword(${user.id});"
                                           class="btn btn-default btn-sm tooltips" data-original-title="重置密码">
                                            <i class="fa fa-refresh"></i>
                                        </a>
                                        <a href="javascript:goto('${ctxPath}/admin/user/toUpdate.action?id=${user.id}','searchForm');"
                                           class="btn btn-default  btn-sm tooltips" data-original-title="修改">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="javascript:delUser(${user.id});"
                                           class="btn btn-default  btn-sm tooltips" data-original-title="删除">
                                            <i class="fa fa-times"></i>
                                        </a>
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
                        <form id="user_list_form" method="post">
                            <#import "../pager.ftl" as q>
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/admin/user/manage.action" pageid="user_list_form"/>
                        </form>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div>

</@override>
<@override name="window">
    <#include "../system/choose-org.ftl"/>
    <#include "../system/choose-post.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>