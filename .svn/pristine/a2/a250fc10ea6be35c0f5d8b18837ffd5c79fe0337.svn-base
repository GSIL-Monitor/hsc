<@override name="jstext">
<script>

    function updateBranch() {

        var branchcode = $('#branchcode').val();
        var branchname = $('#branchname').val();
        var contact = $('#contact').val();
        var contactnum = $('#contactnum').val();
        var contactaddress = $('#contactaddress').val();

        if (branchname == '') {
            AlertMsg('门店名称不能为空！');
            return;
        }

        var url = '${ctxPath}/branch/update.action';
        var params = {
            id: branchcode,
            branchname: branchname,
            contact: contact,
            contactnum: contactnum,
            contactaddress: contactaddress
        };

        ajaxInSameDomain(url, params, function (result) {
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
            <div class="tools">
            </div>
        </div>

        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form action="" method="post" class="form-horizontal " role="form" id="form-commodity">
                <div class="form-body">

                    <div class="form-group">
                        <label class="control-label col-md-3">名称
                            <span class="required" aria-required="true"> * </span>
                        </label>

                        <div class="col-md-4">
                            <input id="branchname" name="branchname" type="text" class="form-control"
                                   value="${branch.branchname!''}">
                            <input id="branchcode" name="branchcode" type="hidden" value="${branch.id!''}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">联系人
                        </label>

                        <div class="col-md-4">
                            <input id="contact" name="contact" type="text" class="form-control"
                                   value="${branch.contact!''}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">联系电话
                        </label>

                        <div class="col-md-4">
                            <input id="contactnum" name="contactnum" type="text" class="form-control"
                                   value="${branch.contactnum!''}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">联系地址
                        </label>

                        <div class="col-md-4">
                            <input id="contactaddress" name="contactaddress" type="text" class="form-control"
                                   value="${branch.contactaddress!''}">
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="updateBranch()" class="btn btn-default "><i class="fa fa-save"></i> 保存</button>
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