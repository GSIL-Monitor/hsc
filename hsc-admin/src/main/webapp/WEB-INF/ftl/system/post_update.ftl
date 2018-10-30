<@override name="jstext">
<script>

    function updatePost() {

        var postId = $('#postId').val();
        var ordernum = $('#ordernum').val();
        var name = $('#name').val();
        var remark = $('#remark').val();

        if (name == '') {
            AlertMsg('职位名称不能为空！');
            return;
        }

        var url = '${ctxPath}/post/update.action';
        var params = {
            id: postId,
            ordernum: ordernum,
            name: name,
            remark: remark
        };

        ajaxSyncInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                window.location.href = '${ctxPath}/post/manage.action';
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
                        <label class="control-label col-md-3">排序号</label>

                        <div class="col-md-4">
                            <input id="ordernum" name="ordernum" type="text" class="form-control" value="${post.ordernum!''}">
                            <input id="postId" name="postId" type="hidden" class="form-control"
                                   value="${post.id!''}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">职位名称
                            <span class="required" aria-required="true"> * </span>
                        </label>

                        <div class="col-md-4">
                            <input id="name" name="name" type="text" class="form-control" value="${post.name!''}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">备注</label>

                        <div class="col-md-4">
                            <textarea id="remark" name="remark" style="height:80px;resize: none;"
                                      class="form-control">${post.remark!''}</textarea>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="updatePost()" class="btn btn-default "><i class="fa fa-save"></i> 保存</button>
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