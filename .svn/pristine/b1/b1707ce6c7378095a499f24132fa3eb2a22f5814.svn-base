<@override name="jsfile">
<script language="javascript" src="${zl.admin.resource.address}/js/nestable/jquery.nestable.js?version=${zl.web.resource.version}"></script>
</@override>
<@override name="cssfile">
<link rel="stylesheet" type="text/css" href="${zl.admin.resource.address}/css/nestable.css?version=${zl.web.resource.version}">
</@override>
<@override name="csstext">
<style type="text/css">
    .dd-handle {
        height: 40px;
        line-height: 26px
    }
</style>
</@override>
<@override name="jstext">
<script type="text/javascript">

    $(function () {
        var depth = 3;
        if (depth <= 0) {
            depth = 3;
        }
        $('#div_nestable').nestable({maxDepth: depth, isMove: 0});
        $('#div_nestable').nestable('collapseAll');

        $(".dd-handle a,dd-handle embed,dd-handle div").mousedown(function (e) {
            e.stopPropagation();
        });
    })

    function checkItem(e) {
        var disabled = $(e).attr('disabled');
        if (disabled && disabled == 'disabled') {
            return;
        }
        var hasCheckClass = $(e).children('i').toggleClass("fa-check-square-o").hasClass("fa-check-square-o");
        var hasNoCheckClass = $(e).children('i').toggleClass("fa-square-o").hasClass("fa-square-o");

        var children = $(e).parent().parent().next();
        if (children) {
            children.find('i').toggleClass("fa-check-square-o", hasCheckClass);
            children.find('i').toggleClass("fa-square-o", hasNoCheckClass);
        }
    }

    function updateAuth() {
        var roleid = $('#roleid').val();
        var menuIdArr = [];
        $('#div_nestable a[disabled!="disabled"] i').each(function () {
            var thisDom = $(this);
            if (thisDom.hasClass('fa-check-square-o')) {
                menuIdArr.push(thisDom.attr('data-id'));
            }
        })

        var menus = menuIdArr.join(',');
        var url = '${ctxPath}/auth/update.action';
        var params = {
            id: roleid,
            menus: menus
        };
        ajaxSyncInSameDomain(url, params, function (result) {
            if (result) {
                AlertMsg(result);
            } else {
                back();
            }
        })
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
            <div class="tools">
            </div>
        </div>

        <div class="portlet-body form">
            <form action="" method="post" class="form-horizontal " role="form" id="form-user">
                <div class="form-body">

                    <div class="form-group">
                        <label class="control-label col-md-3">角色名</label>

                        <div class="col-md-4">
                            <input id="username" name="username" type="text" readonly="readonly" class="form-control"
                                   value="${role.name!''}">
                            <input id="roleid" name="roleid" type="hidden" value="${role.id!''}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">菜单</label>

                        <div class="col-md-4">
                            <div class="dd" id="div_nestable">
                                <#import "../buildCheckTree.ftl" as bt>
                                <@bt.buildTree rootList=dataList maxLevel=3/>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" onclick="updateAuth()"
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
        </div>
    </div>
</div>

</@override>
<@override name="window">
</@override>
<@extends name="../base_main.ftl"/>