<@override name="jstext">
<script>
    //上传回调函数
    function uploadCallBack(dataList, domId) {
        createImageList(dataList, domId);
    }

    function openUploadImageWin(domId, multiple) {
        $('#modal-webuploader').modal({
            remote: "${ctxPath}/file/toImageUpload.action?domId=" + domId + "&multiple=" + (multiple || 'single')
        })
    }

    function openUploadVideoWin(domId, multiple) {
        $('#modal-webuploader').modal({
            remote: "${ctxPath}/file/toVideoUpload.action?domId=" + domId + "&multiple=" + (multiple || 'single')
        })
    }
</script>
</@override>
<@override name="right">
<div class="main">

    <div class="panel panel-default">
        <div class="panel-body table-responsive">
            <form action="" method="post" class="form-horizontal ajaxfrom" role="form" id="form-user">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-2 col-md-2 col-lg-2 control-label">单选图片</label>

                    <div class="col-sm-10 col-lg-9 col-xs-12">
                        <div class="input-group">
                            <input type="text" placeholder="选择图片" readonly="readonly" name="orgname"
                                   id="orgname" class="form-control" value="">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" onclick="openUploadImageWin('orgname')">
                                    选择图片
                                </button>
                            </span>
                        </div>
                        <div class="input-group multi-img-details" style="margin-top:.5em;">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-2 col-md-2 col-lg-2 control-label">多选图片</label>

                    <div class="col-sm-10 col-lg-9 col-xs-12">
                        <div class="input-group">
                            <input type="text" placeholder="批量上传图片" readonly="readonly" name="orgname2"
                                   id="orgname2" class="form-control" value="">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"
                                                onclick="openUploadImageWin('orgname2','multiple')">
                                            选择图片
                                        </button>
                                    </span>
                        </div>
                        <div class="input-group multi-img-details" style="margin-top:.5em;">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-2 col-md-2 col-lg-2 control-label">单选视频</label>

                    <div class="col-sm-10 col-lg-9 col-xs-12">
                        <div class="input-group">
                            <input type="text" placeholder="选择视频" readonly="readonly" name="orgname3"
                                   id="orgname3" class="form-control" value="">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" onclick="openUploadVideoWin('orgname3')">
                                    选择视频
                                </button>
                            </span>
                        </div>
                        <div class="input-group multi-video-details" style="margin-top:.5em;">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-2 col-md-2 col-lg-2 control-label">多选视频</label>

                    <div class="col-sm-10 col-lg-9 col-xs-12">
                        <div class="input-group">
                            <input type="text" placeholder="批量上传视频" readonly="readonly" name="orgname4"
                                   id="orgname4" class="form-control" value="">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"
                                                onclick="openUploadVideoWin('orgname4','multiple')">
                                            选择视频
                                        </button>
                                    </span>
                        </div>
                        <div class="input-group multi-video-details" style="margin-top:.5em;">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
</@override>
<@override name="window">
    <#include "../uploader.ftl"/>
</@override>
<@extends name="../base_sys.ftl"/>
