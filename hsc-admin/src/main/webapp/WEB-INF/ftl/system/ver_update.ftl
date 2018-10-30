<@override name="jstext">
<script>

    function updateVer() {

        var versionid = $('#versionid').val();
        var version = $('#version').val();
        var changelog = $('#changelog').val();
        var package = $('#package').val();
        var versiontype = $('#versiontype').val();
        if (version == '') {
            AlertMsg('请输入版本号！');
            return;
        }
        if (changelog == '') {
            AlertMsg('请输入版本说明！');
            return;
        }

        var url = '${ctxPath}/system/update.action';
        var params = {
            id:versionid,
            version: version,
            changelog: changelog,
            package: package,
            type: versiontype
        };

        ajaxSyncInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                back();
            }
        })
    }

    function openUploadVerFileWin(domId, multiple) {
        $('#modal-webuploader').modal({
            remote: "${ctxPath}/file/toVerFileUpload.action?domId=" + domId + "&multiple=" + (multiple || 'single')
        })
    }

    //上传回调函数
    function uploadCallBack(dataList, domId) {
        createFileList(dataList, domId);
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
                        <label class="control-label col-md-3">版本号
                            <span class="required" aria-required="true">*</span>
                        </label>

                        <div class="col-md-4">
                            <input id="version" name="version" type="text" class="form-control"
                                   value="${ver.version!''}">
                            <input id="versionid" name="versionid" type="hidden" value="${ver.id!''}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">版本类型
                            <span class="required" aria-required="true">*</span>
                        </label>

                        <div class="col-md-4">

                            <select class="form-control" name="versiontype" id="versiontype">
                                <option value="android">android</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">上传升级包
                            <span class="required" aria-required="true">*</span>
                        </label>

                        <div class="col-md-4">

                            <div class="input-group">
                                <input id="package" name="package" type="text" class="form-control" value="${ver.package!''}">
                                <span class="input-group-btn">
                                        <button class="btn btn-success" onclick="openUploadVerFileWin('package')"
                                                type="button">
                                            选择附件
                                        </button>
                                </span>
                            </div>
                            <div class="input-group multi-img-details" style="margin-top:.5em;">
                                <#if ver.package?? && ver.package != ''>
                                    <div class="multi-item"><img
                                            src="${zl.admin.resource.address}/images/android.png"
                                            style="width: 100px;height: 100px;"
                                            class="img-responsive img-thumbnail"><em
                                            class="close" style="position:absolute; top: 0px; right: -14px;"
                                            url="${ver.package!''}"
                                            title="删除这个文件" onclick="deleteImage(this)"></em></div>
                                </#if>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">版本说明
                            <span class="required" aria-required="true">*</span>
                        </label>

                        <div class="col-md-4">
                            <textarea class="form-control" id="changelog" name="changelog" rows="3"
                                      style="resize: none;">${ver.changelog!''}</textarea>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="updateVer()"
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
    <#include "../commodity/choose-commodity.ftl"/>
    <#include "../commodity/choose-category.ftl"/>
    <#include "../uploader.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>