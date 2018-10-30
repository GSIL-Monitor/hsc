<@override name="jstext">
<script>

    function addOrg() {

        var orderNum = $('#orderNum').val();
        var parentId = $('#parentId').val();
        var orgName = $('#orgName').val();
        var orgRemark = $('#orgRemark').val();
        var orgLevel = $('#orgLevel').val();

        if (orgName == '') {
            AlertMsg('部门名称不能为空！');
            return;
        }

        var url = '${ctxPath}/org/add.action';
        var params = {
            ordernum: orderNum,
            pid: parentId,
            name: orgName,
            remark: orgRemark,
            level: parseInt(orgLevel) + 1
        };

        ajaxInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                AlertMsg("部门保存成功！");
                window.location.href = '${ctxPath}/org/manage.action';
            }
        })
    }
</script>
</@override>
<@override name="right">
<div class="tab-pane">
    <div class="portlet light portlet-fit portlet-form">
        <div class="portlet-title">
            <div class="caption font-dark">
                <i class="icon-settings font-dark"></i>
                <span class="caption-subject bold uppercase main-content-title">添加部门</span>
            </div>
        </div>

        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form action="" method="post" class="form-horizontal " role="form" id="form-user">
                <div class="form-body">
                    <#if parent??>
                        <div class="form-group">
                            <label class="control-label col-md-3">上级部门</label>

                            <label class="control-label col-md-4"
                                 style="text-align:left;">${parent.name!''}</label>
                        </div>
                    </#if>
                    <div class="form-group">
                    <label class="control-label col-md-3">排序号</label>

                    <div class="col-md-4">
                        <input id="orderNum" name="orderNum" type="text" class="form-control" value="0">
                        <input id="parentId" name="parentId" type="hidden" class="form-control"
                               value="<#if parent??>${parent.id}</#if>">
                        <input id="orgLevel" name="orgLevel" type="hidden" class="form-control"
                               value="<#if parent??>${parent.level}<#else>0</#if>">
                    </div>
                </div>
                    <div class="form-group">
                        <label class="control-label col-md-3"><span style="color:red">*</span>部门名称</label>

                        <div class="col-md-4">
                            <input id="orgName" name="orgName" type="text" class="form-control" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">部门描述</label>

                        <div class="col-md-4">
                        <textarea id="orgRemark" name="orgRemark" style="height:80px;resize: none;"
                                  class="form-control"></textarea>

                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="addOrg()" class="btn btn-default "><i class="fa fa-save"></i> 保存</button>
                                <button type="button" onclick="back()" class="btn btn-default "><i class="fa fa-reply"></i> 取消</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- END FORM-->
        </div>
    </div>
</div>


</@override>
<@override name="window">
</@override>
<@extends name="../base_main.ftl"/>