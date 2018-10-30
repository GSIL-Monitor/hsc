<@override name="jsfile">
</@override>
<@override name="cssfile">
</@override>
<@override name="jstext">
<script>

    function search() {
        $("#searchForm").attr('action', '${ctxPath}/mqmessage/xmlQuery.action');
        $("#searchForm").submit();
    }

    // 处理
    function optXmlMessage() {
        var messageids = "";
        var operatecomments = "";
        var cnt = 0;
        $("input[name=checkboxname]:checked").each(function (i, item) {
            messageids = messageids + this.value + ',';
            //得到选中的操作备注
            var operatecomment = $(item).parent().parent().parent().find("input[name='operatecomments']").val();
            if ('' == operatecomment) {
                operatecomment = "后台人工处理";
            }
            if (operatecomment.length > 100) {
                cnt++;
                return false;
            }
            operatecomments = operatecomments + operatecomment + ',';
        });

        // 校验操作备注输入的字符数
        if (cnt != 0) {
            AlertMsg('操作备注最多只能输入100个字！');
            return;
        }

        // 校验是否有选中数据
        if ("" == messageids || null == messageids) {
            AlertMsg('请选中要处理的数据！');
            return;
        }
        //去最后的逗号
        messageids = messageids.substring(0, messageids.length - 1);
        operatecomments = operatecomments.substring(0, operatecomments.length - 1);
        var url = "${ctxPath}/mqmessage/optXmlQuery.action";
        var params = {'messageids': messageids, 'operatecomments': operatecomments};

        ajaxSyncInSameDomain(url, params, function (msg) {
            if (msg == "success") {
                AlertMsg('全部处理成功！', function () {
                    window.location.reload();
                });
            } else if (msg == "error") {
                AlertMsg('全部处理失败！');
            } else {
                AlertMsg("ID为" + msg + "的报文处理失败！", function () {
                    window.location.reload();
                });
            }
        })
    }

    // 删除方法
    function deleteXmlMessage() {
        var messageids = "";
        var operatecomments = "";
        var cnt = 0;
        $("input[name=checkboxname]:checked").each(function (i, item) {
            //得到选中报文id
            messageids = messageids + this.value + ',';
            //得到选中的操作备注
            var operatecomment = $(item).parent().parent().parent().find("input[name='operatecomments']").val();
            if ('' == operatecomment) {
                operatecomment = "后台人工删除";
            }
            if (operatecomment.length > 100) {
                cnt++;
                return false;
            }
            operatecomments = operatecomments + operatecomment + ',';
        });

        // 校验操作备注输入的字符数
        if (cnt != 0) {
            AlertMsg("操作备注最多只能输入100个字！");
            return;
        }

        // 校验是否有选中数据
        if ("" == messageids || null == messageids) {
            AlertMsg("请选中要删除的数据！");
            return;
        }

        ConfirmMsg("确定要删除吗？", function (yes) {
            if (yes) {
                //去最后的逗号
                messageids = messageids.substring(0, messageids.length - 1);
                operatecomments = operatecomments.substring(0, operatecomments.length - 1);
                var url = "${ctxPath}/mqmessage/deleteXmlQuery.action";
                var params = {'messageids': messageids, 'operatecomments': operatecomments};

                ajaxSyncInSameDomain(url, params, function (msg) {
                    if (msg == "success") {
                        AlertMsg('删除成功！', function () {
                            window.location.reload();
                        });
                    } else {
                        AlertMsg('删除失败！');
                    }
                })
            }
        });
    }

    //详情事件
    function messageQuery(obj) {
        $('#contentTextArea').html('');
        var message = $(obj).find('div').text();
        $('#contentTextArea').html(message);
        $('#contentWindow').modal('show');
    }
</script>
</@override>
<@override name="right">

<div class="row">
    <div class="col-md-12">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class="icon-settings font-dark"></i>
                    <span class="caption-subject bold uppercase main-content-title">报文列表 </span>
                </div>
                <div class="actions">
                </div>
            </div>
            <div class="portlet-body form">

                <form action="#" id="searchForm" class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">接口名称</label>

                                    <div class="col-md-9">
                                        <input type="text" id="servicename" name="servicename"
                                               value="${RequestParameters.servicename!''}" class="form-control"
                                               placeholder="输入报表名称进行查询！">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">数据创建时间</label>

                                    <div class="col-md-9">

                                        <div class="input-group  date-picker input-daterange"
                                             data-date="10/11/2012" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control" id="createBtime" name="createBtime"
                                                   value="${RequestParameters.createBtime!''}">
                                            <span class="input-group-addon"> 至 </span>
                                            <input type="text" class="form-control" name="createEtime"
                                                   value="${RequestParameters.createEtime!''}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">关键字</label>

                                    <div class="col-md-9">
                                        <input type="text" id="keyword" name="keyword"
                                               value="${RequestParameters.keyword!''}" class="form-control"
                                               placeholder="输入报文关键字进行查询！">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions right">
                        <button type="button" class="btn btn-default " onclick="search()">
                            <i class="fa fa-search"></i> 搜索
                        </button>
                        <button type="button" class="btn green" onclick="optXmlMessage()">
                            <i class="fa fa-edit"></i> 处理
                        </button>
                        <button type="button" class="btn red" onclick="deleteXmlMessage()">
                            <i class="fa fa-times"></i> 删除
                        </button>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="30"><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="group-checkable" name="checkAllButton"
                                       onclick="checkAllEvent(this,'checkboxname','checkAllButton');">
                                <span></span>
                            </label></th>
                            <th> ID</th>
                            <th> 报文名称</th>
                            <th> 报文</th>
                            <th> 处理状态</th>
                            <th> 错误原因</th>
                            <th> 创建时间</th>
                            <th> 更新时间</th>
                            <th> 操作备注</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#if pageInfo?? && pageInfo.list??>
                                <#list pageInfo.list as message>
                                <tr class="odd gradeX">
                                    <td>
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" name="checkboxname" class="checkboxes"
                                                   value="${message.messageid!''}">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td> ${message.messageid!''}</td>
                                    <td> ${message.servicename!''}</td>
                                    <td>
                                    ${(message.messagesome!'error')?html}
                                        <a href="javascript:;" class="btn btn-xs blue" data-toggle="modal"
                                           onclick="messageQuery(this)"> 更多
                                            <div style='display:none'>${message.message?html}</div>
                                            <i class="fa fa-search"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <#if
                                        1==message.checkstatus>主线程处理异常<#elseif
                                        2==message.checkstatus>子线程处理异常<#elseif
                                        3==message.checkstatus>定时任务处理异常<#elseif
                                        4==message.checkstatus>后台页面手工执行异常</#if>
                                    </td>
                                    <td>
                                        <#if message.errorreasonsome??>${message.errorreasonsome?html!''}
                                            <a href="javascript:;" class="btn btn-xs blue" data-toggle="modal"
                                               onclick="messageQuery(this)"> 更多
                                                <div style='display:none'>${message.errorreason?html}</div>
                                                <i class="fa fa-search"></i>
                                            </a>
                                        <#else>
                                        ${(message.errorreason!' ')?html}
                                        </#if>
                                    </td>
                                    <td>${message.receivemessagetime!''}</td>
                                    <td>${message.updatetime!''}</td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm"
                                               name="operatecomments">
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
                        <form id="message_list_form" method="post">
                            <#import "../pager.ftl" as q>
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/mqmessage/xmlQuery.action" pageid="message_list_form"/>
                        </form>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div>

</@override>
<@override name="window">
<div class="modal fade" id="contentWindow" tabindex="-1" role="contentWindow" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">内容</h4>
            </div>
            <div class="modal-body" id="contentBody">
                <textarea class="form-control" cols='85' rows='20' id="contentTextArea"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</@override>
<@extends name="../base_main.ftl"/>