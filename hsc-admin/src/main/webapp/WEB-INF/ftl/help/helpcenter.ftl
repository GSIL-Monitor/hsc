<@override name="jstext">
<script>
    $(document).ready(function(){
//限制字符个数
        $(".zxx_text_overflow").each(function(){
            var maxwidth=11;
            if($(this).text().length>maxwidth){
                $(this).text($(this).text().substring(0,maxwidth));
                $(this).html($(this).html()+'…');
            }
        });
    });
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
    function firstSe2(value) {//如果第一个下拉列表的值改变则调用此方法
        var helptype=$("#helptype").val();
        //  var id = $("#helptype").val(value);//得到第一个下拉列表的值
        console.log(helptype);
        if(helptype!=null && "" != helptype&& -1 != helptype){
            //通过ajax传入后台，把orderTypeName数据传到后端
            $.post("${ctxPath}/help/modulelistbyhelptype.action",{helptype:helptype},function(data){
                var res = data;//把后台传回的json数据解析
                var option;
                option += "<option value=''>全部</option>"
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
                option += "<option value=''>全部</option>"
                $.each(res,function(i,n){//循环，i为下标从0开始，n为集合中对应的第i个对象
                    option += "<option value='"+n.id+"'>"+n.levelmodulename+"</option>"
                });
                $("#level2modulename").html(option);//将循环拼接的字符串插入第二个下拉列表
            });

        }else {
            $("#level2modulename").show();
        }
    };

    function delUser(id) {

        ConfirmMsg("确定要删除此帮助,删除后无法恢复？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/help/delethelp.action';
                var params = {
                    id: id
                };
                ajaxSyncInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.href = '${ctxPath}/help/helpcentermanage.action';
                    }
                })
            }
        });
    }
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

    function search() {
        $("#searchForm").attr('action', '${ctxPath}/help/helpcentermanage.action');
        $("#searchForm").submit();
    }

    function queryReset() {
        $("#questiontitle").val("");
        $("#systemplatform").val("");
        $("#helptype").val("");
        $("#level1modulename").val("");
        $("#level2modulename").val("");
        $("#starttime").val("");
        $("#endtime").val("");
        $("#searchForm").attr('action', '${ctxPath}/help/helpcentermanage.action');
        $("#searchForm").submit();
    }

    function change(){//按钮单击事件
        $("#submitwechatForm").submit();
    }
    function change11(){//按钮单击事件
        $("#submitcreateHtmlForm").submit();
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
            <form class="search-form form-horizontal" action="${ctxPath}/help/helpcentermanage.action" id="searchForm" method="post">
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label col-md-4">问题名称</label>
                                <div class="col-md-8">
                                    <input type="text" id="questiontitle" name="questiontitle"
                                           value="${RequestParameters.questiontitle!''}" class="form-control"
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
                                    <select class="form-control" name="helptype" id="helptype" val="${RequestParameters.helptype!''}" onchange="firstSe2()">
                                        <option value="">全部</option>
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
                            <div class="form-group">
                                <label class="control-label col-md-4">一级模块</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="level1moduleid" id="level1modulename" onchange="firstSel()">
                                        <option value="">全部</option>
                                        <#if list??>
                                            <#list list as list1>
                                               <option value="${list1.id}"
                                                <#if (RequestParameters.level1moduleid!'') == '${list1.id}'>selected</#if>>
                                                   ${list1.levelmodulename}
                                               </option>
                                            </#list>
                                        </#if>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label col-md-4">二级模块</label>
                                <div class="col-md-7">
                                    <select class="form-control" name="level2moduleid" id="level2modulename">
                                        <option value="">全部</option>
                                     <#if listformodule2??>
                                         <#list listformodule2 as list2>
                                               <option value="${list2.id}"
                                                <#if (RequestParameters.level2moduleid!'') == '${list2.id}'>selected</#if>>
                                                   ${list2.levelmodulename}
                                               </option>
                                         </#list>
                                     </#if>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label col-md-4">更新时间</label>
                                <div class="col-md-7">
                                    <input type="text" name="starttime" id="starttime"
                                           value="${RequestParameters.starttime!''}"
                                           placeholder="开始时间"
                                           readonly="readonly" class=" datetimepicker form-control"   endDate: new Date()
                                           style="padding-left:12px;" >
                                </div >

                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <div class="col-md-7">
                                    <input type="text" name="endtime" id="endtime"
                                           value="${RequestParameters.endtime!''}"
                                           placeholder="结束时间"
                                           readonly="readonly" class=" datetimepicker form-control"   endDate: new Date()
                                           style="padding-left:12px;" >
                                </div >

                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="col-md-4 col-sm-4">
                                <button type="button" class="btn btn-default " onclick="search()">
                                    <i class="fa fa-search"></i> 搜索
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
                <form action="${ctxPath}/help/addnewhelp.action" method="post" id="submitwechatForm">
                    <input class="form-control" type="button" onclick="change()"  checked="checked"   value="新增" style="width:100px;height=20px;"/>
                </form>
            </div>
        </div>
    </div>

    <div class="table-responsive">

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th style="width:48px;"> 序号</th>
                <th> 标题</th>
                <th> 系统平台</th>
                <th> 帮助类型</th>
                <th> 一级模块</th>
                <th> 二级模块</th>
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
                        <td class="zxx_text_overflow"> ${post.questiontitle!''}</td>
                        <td>   <#if (post.systemplatform!'') == '1'>
                            <span class="11112">商户后台</span>
                        <#else>
                                        <span class="22212">收银终端</span>
                        </#if></td>
                        <td>  <#if (post.helptype!'') == '1'>
                            <span class="1111">问题汇总</span>
                        <#else>
                                        <span class="2222">新手指导</span>
                        </#if></td>
                        <td> ${post.level1modulename!''}</td>
                        <td> ${post.level2modulename!''}</td>
                        <td> ${post.updatetime!''}</td>
                        <td>
                            <a href="javascript:goto('${ctxPath}/help/moveupdatenewhelp.action?id=${post.id}&&title=${post.questiontitle}&&level1modulename=${post.level1modulename}','searchForm');"
                               class="btn btn-default  btn-sm tooltips" data-original-title="编辑">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a   onclick="delUser(${post.id})"
                               class="btn btn-default  btn-sm tooltips" data-original-title="删除">
                                <i class="fa fa-times"></i>
                            </a>
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
                                                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/help/helpcentermanage.action" pageid="user_list_form"/>
            </form>
        </div>
    </div>
    </#if>
</@override>
<@extends name="../base_main.ftl"/>
