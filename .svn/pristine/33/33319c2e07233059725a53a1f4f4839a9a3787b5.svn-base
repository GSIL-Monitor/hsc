<@override name="jstext">
<script>

    function addShowcase() {

        var showimg = $('#showimg').val();
        var showtitle = $('#showtitle').val();
        var showtypeid = $('#showtypeid').val();
        var showtype = $('#showtype').val();
        var homeimg = $('#homeimg').val();

        if (showimg == '') {
            AlertMsg('请选择展示图片！');
            return;
        }
        if (homeimg == '') {
            AlertMsg('请选择首页案例展示图片！');
            return;
        }
        if (showtype == '') {
            AlertMsg('请选择展示分类！');
            return;
        }
        if (showtitle == '') {
            AlertMsg('请输入标题！');
            return;
        }

        var url = '${ctxPath}/showcase/add.action';
        var params = {
            showimg: showimg,
            homeimg: homeimg,
            showtitle: showtitle,
            showtypeid: showtypeid,
            showtype: showtype,
            content: UE.getEditor('content').getContent()
        }

        ajaxInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                back();
            }
        })
    }


    function openUploadImageWin(domId, multiple) {
        $('#modal-webuploader').modal({
            remote: "${ctxPath}/file/toImageUpload.action?domId=" + domId + "&multiple=" + (multiple || 'single')
        })
    }

    //上传回调函数
    function uploadCallBack(dataList, domId) {
        createImageList(dataList, domId);
    }


</script>
</@override>
<@override name="right">
<form action="#" method="get" class="form-horizontal" role="form" id="searchForm">
    <div class="panel panel-default">
        <div class="panel-heading main-content-title"></div>
        <div class="panel-body">
            <div class="form-body">

                <div class="form-group">
                    <label class="control-label col-md-3">标题
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">
                        <input id="showtitle" name="showtitle" type="text" class="form-control" value="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">案例展示图片
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">

                        <div class="input-group">
                            <input id="showimg" name="showimg" type="text"
                                   class="form-control upload-control"
                                   value="">
                                                    <span class="input-group-btn">
                                                            <button class="btn btn-default"
                                                                    onclick="$.fn.FileUploader.openUploadFile(this,{type:'image',limit:20000})"
                                                                    type="button">
                                                                选择图片
                                                            </button>
                                                    </span>
                        </div>
                        <div class="input-group multi-img-details" style="margin-top:.5em;"></div>

                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">首页案例展示图片
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">

                        <div class="input-group">
                            <input id="homeimg" name="homeimg" type="text"
                                   class="form-control upload-control"
                                   value="">
                                                    <span class="input-group-btn">
                                                            <button class="btn btn-default"
                                                                    onclick="$.fn.FileUploader.openUploadFile(this,{type:'image',limit:20000})"
                                                                    type="button">
                                                                选择图片
                                                            </button>
                                                    </span>
                        </div>
                        <div class="input-group multi-img-details" style="margin-top:.5em;"></div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-md-3">展示分类
                    </label>

                    <div class="col-md-4">
                        <select class="form-control" name="showtype" id="showtype">
                            <option value="0">专营专卖</option>
                            <option value="1">专业市场</option>
                            <option value="2">商圈联盟</option>
                            <option value="3">商超便利</option>
                            <option value="4">餐饮水果</option>
                            <option value="5">商贸服饰</option>
                            <option value="6">其他</option>
                        </select>
                    </div>
                </div>


                <div class="form-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">
                                    案例详情
                                </label>

                                <div class="col-md-6">

                                    <#import "../ueditor.ftl" as q>
			                                    <@q.ueditor domId="content" height="200" ctxPath="${ctxPath}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="form-group col-sm-12">
        <input type="button" value="提交" class="btn btn-primary col-lg-1" onclick="addShowcase()">
        <input type="button" onclick="back()" style="margin-left:10px;" value="返回列表"
               class="btn btn-default">
    </div>

</form>

</@override>
<@override name="window">
    <#include "../pluploader.ftl"/>

</@override>
<@extends name="../base_main.ftl"/>
