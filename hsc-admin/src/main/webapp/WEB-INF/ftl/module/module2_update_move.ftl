<#include "../default_cfg.ftl"/>
<script>
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
        var level1modulid=$("#level1modulename option:selected").val().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        var ordernum = '';
        ordernum = $('#ordernum1').val();


        if (levelmodulename == '') {
            AlertMsg('请输入标题！');
            return;
        }
        if (ordernum == '') {
            AlertMsg('请输入排序！');
            return;
        }
        var ordernum= $('#ordernum1').val();
        var ordernum1=${moduleInfo.ordernum};
        $.post("${ctxPath}/module/checknum2.action",{ordernum:ordernum,id:${pid}},function(data){
            var res = data.num;//把后台传回的json数据解析
            if(res!=0&&ordernum!=ordernum1){
                ConfirmMsg("已存在此排序,请换个排序");
                return;
            }
        var id=${mid};
        var url = '${ctxPath}/module/updatemodule2.action?id='+${mid};
        var params = {
            levelmodulename: levelmodulename,
            level1modulid:level1modulid,
            ordernum:ordernum
        }

        ajaxInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                AlertMsg("提交成功", function () {
                    window.location.href = '${ctxPath}/module/module2list.action?id='+${pid};
                });
            }
        })
        })
    }
    function back11() {
        window.location.href = '${ctxPath}/module/module2list.action?id='+${pid};
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
                    <label class="control-label col-md-3">所属一级模块
                        <span class="required" aria-required="true"> * </span></label>
                    <div class="col-md-4">
                        <select class="form-control" name="level1modulename" id="level1modulename">
                                        <#if list??>
                                            <#list list as list1>
                                               <option value="${list1.id}"
                                                <#if '${module2Info.levelmodulename}' == '${list1.levelmodulename}'>selected</#if>>
                                                   ${list1.levelmodulename}
                                               </option>
                                            </#list>
                                        </#if>

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">模块名称
                        <span class="required" aria-required="true"> * </span>
                    </label>

                    <div class="col-md-4">
                        <input  onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"  maxlength="10" id="levelmodulename1" name="levelmodulename" type="text" class="form-control" value=${moduleInfo.levelmodulename} >
                    </div>
                </div>

            </div>


            <div class="form-group">
                <label class="control-label col-md-3">排序顺序
                    <span class="required" aria-required="true"> * </span>
                </label>

                <div class="col-md-4" id="effect">
                    <input id="ordernum1" name="ordernum" type="text" class="form-control" value=${moduleInfo.ordernum} >
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