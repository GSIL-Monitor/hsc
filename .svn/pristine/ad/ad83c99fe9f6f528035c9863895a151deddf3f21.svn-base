<@override name="jstext">
<script>

    function updateUser() {
        var userid = $('#userid').val();
        var account = $('#account').val();
        var email = $('#email').val();
        var tel = $('#tel').val();
        var password = $('#password').val();
        var fullname = $('#fullname').val();
        var remark = $('#remark').val();
        var orgid = $('#orgid').val();
        var postid = $('#postid').val();

        if (account == '') {
            AlertMsg('请输入用化名！');
            return;
        }
        if (password == '') {
            AlertMsg('请输入密码！');
            return;
        }
        if (fullname == '') {
            AlertMsg('请输入姓名！');
            return;
        }
        if (orgid == '') {
            AlertMsg('请选择部门！');
            return;
        }
        if (postid == '') {
            AlertMsg('请选择职位！');
            return;
        }

        var url = '${ctxPath}/admin/user/update.action';
        var params = {
            id: userid,
            account: account,
            email: email,
            tel: tel,
            password: password,
            fullname: fullname,
            remark: remark,
            orgid: orgid,
            postid: postid
        };

        ajaxSyncInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                AlertMsg("修改成功");
                window.location.href = '${ctxPath}/admin/user/manage.action';
            }
        })
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
                        <label class="control-label col-md-3">用户名<span class="required" aria-required="true"> * </span></label>

                        <div class="col-md-4">
                            <input id="account" name="account" type="text" class="form-control"
                                   value="${userInfo.account!''}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">姓名<span class="required"
                                                                      aria-required="true"> * </span></label>

                        <div class="col-md-4">
                            <input id="fullname" name="fullname" type="text" class="form-control"
                                   value="${userInfo.fullname!''}"/>
                            <input id="userid" name="userid" type="hidden" class="form-control"
                                   value="${userInfo.id!''}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">密码
                            <span class="required" aria-required="true"> * </span></label>

                        <div class="col-md-4">
                            <input id="password" name="password" type="password" class="form-control"
                                   value="${userInfo.password!''}"
                                   autocomplete="off">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">部门
                            <span class="required" aria-required="true"> * </span></label>

                        <div class="col-md-4">
                            <div class="input-group">

                                <input class="form-control" placeholder="选择部门" id="orgname"
                                       readonly="readonly"
                                       name="orgname" value="${userInfo.orgname!''}"/>
                                <input type="hidden" id="orgid" name="orgid"
                                       value="${userInfo.orgid!''}"/>
                                            <span class="input-group-btn">
                                                    <button class="btn btn-default" onclick="chooseorg(this)"
                                                            type="button">
                                                        <i class="icon-magnifier"></i>
                                                    </button>
                                            </span>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-md-3">职位 <span class="required" aria-required="true"> * </span>
                        </label>

                        <div class="col-md-4">
                            <div class="input-group">
                                <input class="form-control" placeholder="选择职位" id="postname" readonly="readonly"
                                       name="postname"
                                       value="${userInfo.postname!''}"/>
                                <input type="hidden" id="postid" name="postid" value="${userInfo.postid!''}"/>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" onclick="choosepost(this)"
                                                                type="button"><i class="icon-magnifier"></i>
                                                        </button>
                                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">email</label>

                        <div class="col-md-4">
                            <input id="email" name="email" type="text" class="form-control"
                                   value="${userInfo.email!''}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">联系方式</label>

                        <div class="col-md-4">
                            <input id="tel" name="tel" type="text" class="form-control" value="${userInfo.tel!''}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">备注</label>

                        <div class="col-md-4">
                            <textarea id="remark" name="remark" style="height:80px;resize: none;"
                                      class="form-control" value="${userInfo.remark!''}"></textarea>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="updateUser()"
                                        class="btn btn-default "><i class="fa fa-save"></i> 保存
                                </button>
                                <button type="button" onclick="back()" class="btn btn-default "><i
                                        class="fa fa-reply"></i> 取消
                                </button>
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
    <#include "../system/choose-org.ftl"/>
    <#include "../system/choose-post.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>