<@override name="jstext">
<script>
    function firstSe3(value) {//如果第一个下拉列表的值改变则调用此方法
        var systemplatform=$("#systemplatform").val();
        //  var id = $("#helptype").val(value);//得到第一个下拉列表的值
        console.log(systemplatform);
        if(systemplatform==2){
            $("#xinshou").hide();
        }else {
            $("#xinshou").show();
        }
    };
    function fabu() {
        ConfirmMsg("发布后将无法撤回，是否立即发布", function (yes) {
            if (yes) {
                var url = '${ctxPath}/help/createHtml.action';
                ajaxSyncInSameDomain(url,function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.href = '${ctxPath}/help/helpcentermanage.action';
                    }
                })
            }
        });
    }
    function delUser(id) {
        ConfirmMsg("确定要删除此模块,删除后无法恢复？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/module/delete1module.action';
                var params = {
                    id: id
                };
                ajaxSyncInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.href = '${ctxPath}/module/modulelist.action';
                    }
                })
            }
        });
    }
    function search() {
        $("#searchForm").attr('action', '${ctxPath}/module/modulelist.action');
        $("#searchForm").submit();
    }
    function chooseShop(e) {
        ChooseShop.open(null, function (data) {
            var shopname = checkEmpty(data.name) ? data.code : data.name + "-" + data.code;
            $(e).parent().prev().prev().prev().val(shopname);
            $(e).parent().prev().prev().val(data.id);
            $(e).parent().prev().val(data.code);
        })
    }
    function chooseShop1(e,id) {

        var id=id;

        ChooseShop1.open(id, function (data) {
            var shopname = checkEmpty(data.name) ? data.code : data.name + "-" + data.code;
            $(e).parent().prev().prev().prev().val(shopname);
            $(e).parent().prev().prev().val(data.id);
            $(e).parent().prev().val(data.code);
        })
    }
    function queryReset() {
        $("#levelmodulename").val("");
        $("#helptype").val("");
        $("#systemplatform").val("");
        $("#searchForm").attr('action', '${ctxPath}/module/modulelist.action');
        $("#searchForm").submit();
    }

    function change(){//按钮单击事件

        var productcode=$("#productcode").val("")
        $("#submitwechatForm").submit();
    }

    function reset() {
        $("#searchForm").reset();
    }
    function batchImportCallBack(dataList) {
        debugger;
        if (dataList.length == 0) {
            AlertMsg('请求失败');
        } else {
            var data = dataList[0];
            var success = data.success;
            if (success == '0') {
                AlertMsg(data.errorMsg);
            } else if (success == '1') {

                AlertMsg('导入成功，共导入了' + data.successCount + "条数据", function () {
                    zlf.common.search();
                    queryReset();
                });

            } else if (success == '2') {

                refreshAndShowImportError('导入全部失败<br/>导入失败了' + data.errorCount + '条商品数据', data.errorList);

            } else if (success == '3') {

                refreshAndShowImportError('导入部分成功<br/>导入成功了' + data.successCount + '条商品数据<br/>导入失败了' + data.errorCount + '条商品数据', data.errorList);
            }
        }

    }
    /*  $('.form_date').datetimepicker({
          language:  'zh-CN',
          weekStart: 1,
          todayBtn:  1,
          autoclose: 1,
          todayHighlight: 1,
          startView: 3,
          minView: 4,
          forceParse: 0,
          todayHighlight:true
      });*/
    $(function(){
        $('.form_date').datetimepicker('setEndDate', new Date());
        $('#starttimeselect')
                .datetimepicker()
                .on('changeDate', function(ev){
                    var starttime = $('#starttime').val();
                    if(starttime){
                        $('#endtimeselect').datetimepicker('setStartDate', starttime);
                    }
                });

        $('#endtimeselect')
                .datetimepicker()
                .on('changeDate', function(ev){
                    var endtime = $('#endtime').val();
                    if(endtime){
                        $('#starttimeselect').datetimepicker('setEndDate', endtime);
                    }
                });

    });

    function refreshAndShowImportError(msg, errorList) {

        $('#importErrorTbody').empty();
        $('#importMsg').html(msg);

        for (var index in errorList) {
            $('#importErrorTbody').append('<tr><td>' + errorList[index].rownum + '</td><td>' + errorList[index].errorMsg + '</td></tr>');
        }

        $('#modal-close').modal('show');
        $('#modal-close').unbind('hide.bs.modal').bind('hide.bs.modal', function () {
            window.location.reload();
        })
    }

    //上传回调函数
    function uploadCallBack(dataList, domId) {
        createImageList(dataList, domId);
    }

</script>
</@override>
<@override name="right">
<div class="actions pull-right" style="overflow: hidden;">
</div>
<div class="panel panel-info">
    <div   style="margin-bottom:15px;margin-top:15px;padding-left: 0px ;" >
        <input class="form-control" type="button" onclick="fabu()"    value="发布" style="width:100px;height=20px;float: right; margin-left: 5px;"/>
    </div>
    <div style="float: right; margin-left: 5px;">温馨提示：更新后需点击发布</div>
    <div class="panel-heading">筛选</div>
    <div class="panel-body">
        <div class="portlet-body form">
            <form class="search-form form-horizontal" action="${ctxPath}/module/modulelist.action" id="searchForm" method="post">
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label col-md-4">模块名称</label>
                                <div class="col-md-8">
                                    <input type="text" id="levelmodulename" name="levelmodulename"
                                           value="${RequestParameters.levelmodulename!''}" class="form-control"
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label col-md-4">系统平台</label>
                                <div class="col-md-7">
                                    <select class="form-control" name="systemplatform" id="systemplatform" val="${RequestParameters.systemplatform!''}" onchange="firstSe3()">
                                        <option value="">全部</option>
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
                        </div>

                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label col-md-4">帮助类型</label>
                                <div class="col-md-7">
                                    <select class="form-control" name="helptype" id="helptype" val="${RequestParameters.helptype!''}">
                                        <option value=""  >全部</option>
                                        <option value="1"
                                                <#if (RequestParameters.helptype!'') == '1'>selected</#if>>
                                            问题汇总
                                        </option>
                                        <option  id="xinshou" value="2"
                                                <#if (RequestParameters.helptype!'') == '2'>selected</#if>>
                                            新手指导
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-3 col-sm-3">
                            <div class="col-md-4 col-sm-4">
                                <button type="button" class="btn btn-default " onclick="search()">
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <button type="button" class="btn btn-default " onclick="queryReset()">
                                    <i class="fa"></i> 重置
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div   style="margin-bottom:15px;margin-top:15px;padding-left: 0px ;" >
                    <input class="form-control " type="button" onclick="chooseShop(this)"    value="新增模块" style="width:100px;height=20px;"/>
            </div>
        </div>
    </div>

    <div class="table-responsive">

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th style="width:48px;"> 序号</th>
                <th> 模块名称</th>
                <th> 系统平台</th>
                <th> 帮助类型</th>
                <th> 排序</th>
                <th> 更新时间</th>
                <th> 操作</th>
            </tr>
            </thead>
            <tbody>
                <#if pageInfo?? && pageInfo.list??>
                    <#import "../rownum.ftl" as q>
                    <#list pageInfo.list as post>
                    <tr class="odd gradeX">
                        <td> <@q.rownum page=pageInfo.page pageSize=pageInfo.pageSize index=post_index /></td>
                        <td> ${post.levelmodulename!''}</td>
                        <td>
                           <#if (post.systemplatform!'') == '1'>
                                        <span class="11112">商户后台</span>
                           <#else>
                                        <span class="22212">收银终端</span>
                           </#if>
                        </td>
                        <td>
                        <#if (post.helptype!'') == '1'>
                                        <span class="1111">问题汇总</span>
                        <#else>
                                        <span class="2222">新手指导</span>
                        </#if>

                        </td>
                        <td> ${post.ordernum!''}</td>
                        <td> ${post.updatetime!''}</td>
                        <td>
                            <a href="javascript:goto('${ctxPath}/module/module2list.action?id=${post.id}','searchForm');"
                               data-original-title="二级模块">
                                二级模块
                                <a onclick="chooseShop1(this,${post.id})"
                                   data-original-title="编辑">
                                    编辑
                                    <a onclick="delUser(${post.id})"
                                       data-original-title="删除">
                                        删除

                        </td>
                    </tr>
                    </#list>
                <input type="hidden" id="xx">
                <#else>
                <tr>
                    <td valign="top" colspan="8" class="dataTables_empty">暂无数据</td>
                </tr>
                </#if>
            </tbody>
        </table>
    </div>

</div>
    <#if pageInfo?? && pageInfo.totalRecords gt 0>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <form id="user_list_form" method="post">
                <#import "../pager.ftl" as q>
                                                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/module/modulelist.action" pageid="user_list_form"/>
            </form>
        </div>
    </div>
    </#if>
</@override>
<@override name="window">
    <#include "choose-shop.ftl"/>
    <#include "update_module.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>
