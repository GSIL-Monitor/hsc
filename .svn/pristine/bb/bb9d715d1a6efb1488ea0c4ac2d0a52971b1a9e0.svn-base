<@override name="jstext">
<script>
    function firstSe3(value) {//如果第一个下拉列表的值改变则调用此方法
        var systemplatform=$("input[name='systemplatform']:checked").val();
        //  var id = $("#helptype").val(value);//得到第一个下拉列表的值
        console.log(systemplatform);
        if(systemplatform==2){
            $("#pro").hide();
            $("#pro1").prop("checked",1);
            $("#pro").prop("checked",0);
            firstSe2();
        }else {
            $("#pro").show();
        }
    };
    function firstSe2(value) {//如果第一个下拉列表的值改变则调用此方法
        var helptype=$("input[name='helptype']:checked").val();
        //  var id = $("#helptype").val(value);//得到第一个下拉列表的值
        console.log(helptype);
        if(helptype!=null && "" != helptype&& -1 != helptype){
            //通过ajax传入后台，把orderTypeName数据传到后端
            $.post("${ctxPath}/help/modulelistbyhelptype.action",{helptype:helptype},function(data){
                var res = data;//把后台传回的json数据解析
                var option;
                $.each(res,function(i,n){//循环，i为下标从0开始，n为集合中对应的第i个对象
                    option += "<option value='"+n.level1moduleid+"'>"+n.levelmodulename+"</option>"
                });
                $("#level1modulename").html(option);//将循环拼接的字符串插入第二个下拉列表
                firstSel();
            });

        }else {
            $("#level2modulename").show();
        }
    };
    function firstSel() {//如果第一个下拉列表的值改变则调用此方法
        var id = $("#level1modulename").val();//得到第一个下拉列表的值
        if(id!=null && "" != id&& -1 != id){
            //通过ajax传入后台，把orderTypeName数据传到后端
            $.post("${ctxPath}/help/module2list.action",{id:id},function(data){
                var res = data;//把后台传回的json数据解析
                var option;
                $.each(res,function(i,n){//循环，i为下标从0开始，n为集合中对应的第i个对象
                    option += "<option value='"+n.id+"'>"+n.levelmodulename+"</option>"
                });
                $("#level2modulename").html(option);//将循环拼接的字符串插入第二个下拉列表
            });

        }else {
            $("#level2modulename").show();
        }
    };
    $(function () {
        $('#content').html('${helpInfo.detail!''}');
    })
    function back11() {
        window.location.href = '${ctxPath}/help/helpcentermanage.action';
    }
    function addAct() {

        var title = $('#title').val();
        var systemplatform = $("input[name='systemplatform']:checked").val();
        var level1modulename=$("#level1modulename option:selected").text().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        var level1moduleid=$("#level1modulename option:selected").val();
        var level2modulename=$("#level2modulename option:selected").text().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        var level2moduleid=$("#level2modulename option:selected").val();
        var helptype=$("input[name='helptype']:checked").val();
        var acturl = '';
        var id=$('#idid').val();
        acturl = $('#actvideo').val();


        if (title == '') {
            AlertMsg('请输入标题！');
            return;
        }
        if (systemplatform == '') {
            AlertMsg('请输入系统平台！');
            return;
        }
        if (level1modulename == '') {
            AlertMsg('请输入一级模块！');
            return;
        }
        if (level2modulename == '') {
            AlertMsg('请输入二级模块！');
            return;
        }
        if (helptype==undefined) {
            AlertMsg('请选择帮助类型！');
            return;
        }

        var url = '${ctxPath}/help/updatenewhelp.action';
        var params = {
            id:id,
            title: title,
            systemplatform: systemplatform,
            helptype:helptype,
            level1modulename:level1modulename,
            level1moduleid:level1moduleid,
            level2moduleid:level2moduleid,
            level2modulename:level2modulename,
            content: UE.getEditor('content').getContent(),
            url: acturl
        }
        ajaxInSameDomain(url, params, function (result) {

            if (result) {
                AlertMsg(result);
            } else {
                AlertMsg("提交成功", function () {
                    window.location.href = '${ctxPath}/help/helpcentermanage.action';
                });
            }
        })
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

    //上传回调函数
    function uploadCallBack(dataList, domId) {
        createImageList(dataList, domId);
    }

    $(function () {

        $("input[name='acttype']").change(function () {
            var acttype = $(this).val();
            if (acttype == 'image') {
                $('#videoFormGroup').hide();
                $('#imageFormGroup').show();
            } else {
                $('#imageFormGroup').hide();
                $('#videoFormGroup').show();
            }
        })
    })

    function choosecategory(e) {
        ChooseMediatype.open(null, function (data) {
            $(e).parent().prev().prev().val(data.name);
            $(e).parent().prev().val(data.id);
        })
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
                    <label class="control-label col-md-3">系统平台
                        <span class="required" aria-required="true"> * </span></label>

                    <div class="col-md-4">
                        <label class="radio-inline">
                            <input type="radio" name="systemplatform" value="1" onclick="firstSe3(this.value)" <#if '${helpInfo.systemplatform}' == '1'>checked</#if>> 商户后台
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="systemplatform" value="2" onclick="firstSe3(this.value)" <#if '${helpInfo.systemplatform}' == '2'>checked</#if>> 收银终端
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">帮助类型
                        <span class="required" aria-required="true"> * </span></label>

                    <div class="col-md-4">
                        <label class="radio-inline">
                            <input  id="pro1" type="radio" name="helptype" value="1" onclick="firstSe2(this.value)"  <#if '${helpInfo.helptype}' == '1'>checked</#if> > 问题汇总
                        </label>
                        <label  id="pro"  class="radio-inline">
                            <input type="radio" name="helptype" value="2"  onclick="firstSe2(this.value) " <#if '${helpInfo.helptype}' == '2'>checked</#if>> 新手指导
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">一级模块
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">
                        <select class="form-control" name="level1moduleid" id="level1modulename" onchange="firstSel()">
                            <option value="">全部</option>
                                        <#if list??>
                                            <#list list as list1>
                                               <option value="${list1.id}"
                                                <#if '${helpInfo.level1moduleid}' == '${list1.id}'>selected</#if>>
                                                   ${list1.levelmodulename}
                                               </option>
                                            </#list>
                                        </#if>

                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">二级模块
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">
                        <select class="form-control" name="level2modulename" id="level2modulename">
                            <option value="">全部</option>
                                          <#if listformodule2??>
                                              <#list listformodule2 as list2>
                                               <option value="${list2.id}"
                                                <#if '${helpInfo.level2modulename}' == '${list2.levelmodulename}'>selected</#if>>
                                                   ${list2.levelmodulename}
                                               </option>
                                              </#list>
                                          </#if>

                        </select>
                    </div>
                </div>




                <div class="form-group">
                    <label class="control-label col-md-3">上传视频
                    </label>
                </div>
            </div>

            <div class="form-group" id="imageFormGroup">
                <label class="control-label col-md-3">&nbsp;
                </label>

                <div class="col-md-4">
                    <div class="input-group">
                        <input id="actvideo" name="actvideo" type="text" class="form-control upload-control"
                               value=${helpInfo.videourl!''}>
                        <span class="input-group-btn">
                                        <button class="btn btn-default"
                                                onclick="$.fn.FileUploader.openUploadFile(this,{type:'video',limit:204800})"
                                                type="button">
                                            选择视频
                                        </button>
                                </span>
                    </div>
                    <div class="input-group multi-img-details" style="margin-top:.5em;"></div>
                    <div class="help-block"> 视频最大为200M;视频必须为MP4格式</div>
                </div>


            </div>
            <div class="form-group">
                <label class="control-label col-md-3">标题
                    <span class="required" aria-required="true"> * </span>
                </label>

                <div class="col-md-4">
                    <input id="title" name="title" type="text" class="form-control" value=${RequestParameters.title}  placeholder="输入50字以内的标题" maxlength="50">
                </div>
            </div>
            <div class="form-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">详情
                                <span class="required" aria-required="true"> * </span>
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
        <input type="button" value="提交" class="btn btn-primary col-lg-1" onclick="addAct()">
        <input type="button" onclick="back11()" style="margin-left:10px;" value="返回列表"
               class="btn btn-default">
    </div>
<input type="hidden" name="idid" id="idid" value=${RequestParameters.id}>
</form>
</@override>

<@override name="window">
    <#include "../pluploader.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>
