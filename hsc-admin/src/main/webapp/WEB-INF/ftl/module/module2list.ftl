<@override name="jstext">
<script>
    function delUser(pid,mid) {
        ConfirmMsg("确定要删除此模块,删除后无法恢复？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/module/delete1module2.action';
                var params = {
                    pid: pid,
                    id:mid
                };
                ajaxSyncInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.href = '${ctxPath}/module/module2list.action?id='+${mid};
                    }
                })
            }
        });
    }
    function back11() {
        window.location.href = '${ctxPath}/module/modulelist.action';
    }
    function search() {
        $("#searchForm").attr('action', '${ctxPath}/module/modulelist.action');
        $("#searchForm").submit();
    }
    function chooseShop(e,mid) {
        var mid=mid;
        console.log(mid)
        ChooseShop2.open(mid, function (data) {
            var shopname = checkEmpty(data.name) ? data.code : data.name + "-" + data.code;
            $(e).parent().prev().prev().prev().val(shopname);
            $(e).parent().prev().prev().val(data.id);
            $(e).parent().prev().val(data.code);
        })
    }
    function chooseShop1(e,id,pid) {
        var id=id;
        var pid=pid;
        var param = {
            id: id,
            pid: pid
        }
        ChooseShop3.open(param, function (data) {
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
    <div class="panel-body">
         <input class="form-control " type="button" onclick="back11()"   value="返回" style="width:100px;height=20px;float: right; margin-left: 5px;"/>
        <div class="portlet-body form">

            <div   style="margin-bottom:15px;margin-top:15px;padding-left: 0px ;" >
                <input class="form-control " type="button" onclick="chooseShop(this,${mid})"    value="新增模块" style="width:100px;height:30px;"/>
            </div>
        </div>
    </div>

    <div class="table-responsive">

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th style="width:48px;"> 序号</th>
                <th> 模块名称</th>
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
                        <td> ${post.ordernum!''}</td>
                        <td> ${post.updatetime!''}</td>
                        <td>
                                <a onclick="chooseShop1(this,${post.id},${mid})"
                                   data-original-title="编辑">
                                    编辑
                                    <a  onclick="delUser(${post.id},${mid})"
                                       data-original-title="删除">
                                        删除

                        </td>
                    </tr>
                    </#list>
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
                                                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/module/module2list.action" pageid="user_list_form"/>
            </form>
        </div>
    </div>
    </#if>
</@override>
<@override name="window">
    <#include "choosemodule2.ftl"/>
    <#include "update_module2.ftl"/>
</@override>
<@extends name="../base_main.ftl"/>
