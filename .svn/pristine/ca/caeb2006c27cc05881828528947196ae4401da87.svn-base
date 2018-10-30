<@override name="csstext">
</@override>
<@override name="jstext">
<script>

    function addRole() {

        var rolename = $('#rolename').val();
        if (rolename == '') {
            AlertMsg('角色名不能为空！');
            return;
        }

        var url = '${ctxPath}/role/add.action';
        var params = {
            name: rolename
        };
        ajaxSyncInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                back();
            }
        })
    }
</script>
</@override>
<@override name="right">
<div class="tab-pane" id="pane">
    <div class="portlet light portlet-fit portlet-form">
        <div class="portlet-title">
            <div class="caption font-dark">
                <i class="icon-settings font-dark"></i>
                <span class="caption-subject bold uppercase main-content-title"></span>
            </div>
        </div>

        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form action="" method="post" class="form-horizontal " role="form" id="form-user">
                <div class="form-body">

                    <div class="form-group">
                        <label class="control-label col-md-3">角色名称
                            <span class="required" aria-required="true"> * </span></label>

                        <div class="col-md-4">
                            <input id="rolename" name="rolename" type="text" class="form-control" value="">
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="addRole()" class="btn btn-default "><i class="fa fa-save"></i> 保存</button>
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
