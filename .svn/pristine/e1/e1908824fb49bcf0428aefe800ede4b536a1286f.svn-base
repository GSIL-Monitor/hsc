<@override name="jstext">
<script>
    function updateConfig() {

        var nationaltax = $('#nationaltax').val();
        var localtax = $('#localtax').val();

        var params = {
            nationaltax: nationaltax,
            localtax: localtax
        };

        var url = '${ctxPath}/shopconfig/updateConfig.action';
        ajaxInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                AlertMsg('加价设置成功', function () {
                    window.location.reload();
                });
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
            <form action="" method="post" class="form-horizontal " role="form">
                <div class="form-body">

                    <div class="form-group">
                        <label class="control-label col-md-3">国税
                            <span class="required" aria-required="true">*</span>
                        </label>

                        <div class="col-md-4">
                            <input id="nationaltax" name="nationaltax" type="text" class="form-control" itype="decimal"
                                   value="${(shopconfig.nationaltax!0)?string('#0.00')}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">地税
                            <span class="required" aria-required="true">*</span>
                        </label>

                        <div class="col-md-4">
                            <input id="localtax" name="localtax" type="text" class="form-control"
                                   value="${(shopconfig.localtax!0)?string('#0.00')}">
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="updateConfig()" class="btn btn-default "><i class="fa fa-save"></i> 保存</button>
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
    <#include "../commodity/choose-commodity.ftl"/>
    <#include "../commodity/choose-category.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>