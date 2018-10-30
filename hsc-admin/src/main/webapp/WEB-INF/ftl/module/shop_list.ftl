<#include "../default_cfg.ftl"/>
<script>

    function firstSe3(value) {//如果第一个下拉列表的值改变则调用此方法
        var systemplatform=$("#systemplatform1").val();
        //  var id = $("#helptype").val(value);//得到第一个下拉列表的值
        console.log(systemplatform);
        if(systemplatform==2){
            $("#xinshou1").hide();

        }else {
            $("#xinshou1").show();
        }
    };

    $("#effect input[name='ordernum']").keyup(function(){

        var c=$(this);

        if(/[^\d]/.test(c.val())){//替换非数字字符
            var temp_amount=c.val().replace(/[^\d]/g,'');
            $(this).val(temp_amount);

        }
    }
   )
    function addAct() {
        var levelmodulename = $('#levelmodulename1').val();

        var systemplatform = $("#systemplatform1 option:selected").val().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        var helptype=$("#helptype1 option:selected").val().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        var ordernum = '';
        ordernum = $('#ordernum1').val();


        if (levelmodulename == '') {
            AlertMsg('请输入标题！');
            return;
        }
        if (ordernum == '') {
            AlertMsg('请输入排序');
            return;
        }

        var ordernum= $('#ordernum1').val();
        $.post("${ctxPath}/module/checknum.action",{ordernum:ordernum},function(data){
            var res = data.num;//把后台传回的json数据解析
            if(res!=0){
                ConfirmMsg("已存在此排序,请换个排序");
                return;
            }
        var url = '${ctxPath}/module/addnewmodule.action';
        var params = {
            levelmodulename: levelmodulename,
            systemplatform: systemplatform,
            helptype:helptype,
            ordernum:ordernum
        }

        ajaxInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                AlertMsg("提交成功", function () {
                    window.location.href = '${ctxPath}/module/modulelist.action';
                });
            }
        })
        })
    }
function back11() {
    window.location.href = '${ctxPath}/module/modulelist.action';
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

    //分页
    function jumpPage(pageid, no, url) {
        var pageCount = 0;
    <#if pageInfo??>
        pageCount = ${((pageInfo.totalRecords+pageInfo.pageSize -1)/pageInfo.pageSize)?int};
    </#if>
        if (no > pageCount) {
            no = pageCount;
        }
        if (no < 1) {
            no = 1;
        }

        $("#" + pageid).find("input[name='page']").attr("value", no);

        refreshShopList($('#' + pageid).serialize());
    }
</script>
<form action="#" method="get" class="form-horizontal" role="form" id="searchForm">
    <div class="panel panel-default">
        <div class="panel-heading main-content-title"></div>
        <div class="panel-body">
            <div class="form-body">

                <div class="form-group">
                    <label class="control-label col-md-3">系统平台
                        <span class="required" aria-required="true"> * </span></label>

                    <div class="col-md-4">
                        <select class="form-control" name="systemplatform1" id="systemplatform1" val="${RequestParameters.systemplatform!''}" onchange="firstSe3()">
                            <option value="1"
                                                <#if (RequestParameters.systemplatform!'') == '1'>selected</#if>>
                                商户后台
                            </option>
                            <option value="2"
                                                <#if (RequestParameters.systemplatform!'') == '2'>selected</#if>>
                                收银终端
                            </option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">帮助类型
                        <span class="required" aria-required="true"> * </span></label>

                    <div class="col-md-4">
                        <select class="form-control" name="helptype1" id="helptype1" val="${RequestParameters.helptype!''}">
                            <option value="1"
                                                <#if (RequestParameters.helptype!'') == '1'>selected</#if>>
                                问题汇总
                            </option>
                            <option id="xinshou1" value="2"
                                                <#if (RequestParameters.helptype!'') == '2'>selected</#if>>
                                新手指导
                            </option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">模块名称
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">
                        <input  maxlength="10" id="levelmodulename1" name="levelmodulename" type="text" class="form-control" value="" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                    </div>
                </div>

            </div>


            <div class="form-group">
                <label class="control-label col-md-3">排序顺序
                    <span class="required" aria-required="true"> * </span>
                </label>

                <div class="col-md-4" id="effect">
                    <input id="ordernum1" name="ordernum" type="text" class="form-control" value="" >
                </div>
            </div>
            <div class="form-group col-sm-12">
                <input type="button" value="提交" class="btn btn-primary col-lg-1" style="margin-left: 30%" onclick="addAct()">
                <input type="button" onclick="back11()" style="margin-left:10px;" value="返回列表"
                       class="btn btn-default">
            </div>
        </div>
    </div>

    </div>

</form>