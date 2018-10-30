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
</@override><@override name="jstext">
<script>

    function addChildItem(pid) {
        window.location.href = '${ctxPath}/org/toAdd.action?pid=' + pid;
    }

    function deleteItem(id) {

        ConfirmMsg("确定要删除此菜单吗？", function (yes) {
            if (yes) {
                var url = '${ctxPath}/org/delOrg.action';
                var params = {
                    id: id
                };
                ajaxSyncInSameDomain(url, params, function (result) {
                    if (result) {
                        AlertMsg(result);
                    } else {
                        window.location.reload();
                    }
                })
            }
        });
    }

    function updateItem(id) {
        window.location.href = '${ctxPath}/org/toUpdate.action?id=' + id;
    }

    function collapseTreeAll() {
        $('#div_nestable').nestable('collapseAll');
    }

    function expandTreeAll() {
        $('#div_nestable').nestable('expandAll');
    }

    $(function () {
        var depth = 3;
        if (depth <= 0) {
            depth = 3;
        }
        $('#div_nestable').nestable({maxDepth: depth, isMove: 0});
        //默认全部收缩
        collapseTreeAll();

        $(".dd-handle a,dd-handle embed,dd-handle div").mousedown(function (e) {
            e.stopPropagation();
        });

        $("#save_btn").click(function () {
            var url = '${ctxPath}/admin/menu/updateMenuTree.action';
            var params = {
                treeData: window.JSON.stringify($('#div_nestable').nestable("serialize"))
            }
            ajaxSyncInSameDomain(url, params, function (result) {
                if (result) {
                    AlertMsg(result);
                } else {
                    window.location.reload();
                }
            })
        })
    })
</script>
</@override>
<@override name="right">
<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class="icon-settings font-dark"></i>
                    <span class="caption-subject bold uppercase main-content-title"></span>
                </div>
                <div class="actions">
                    <a class="btn btn-default  btn-sm"
                       href="javascript:expandTreeAll();"> <i
                            class="fa fa-expand"></i> 全部展开
                    </a>
                    <a class="btn btn-default  btn-sm"
                       href="javascript:collapseTreeAll();"> <i
                            class="fa fa-compress"></i> 全部收缩
                    </a>
                </div>
            </div>
            <div class="portlet-body">

                <div class="dd" id="div_nestable">
                    <#import "../buildTree.ftl" as bt>
                    <@bt.buildTree rootList=dataList maxLevel=3/>
                </div>

            </div>
            <div class="portlet-body form">
                <form role="form">
                    <div class="form-actions">
                        <button type="button" onclick="window.location.href='${ctxPath}/org/toAdd.action'"
                                class="btn btn-default "><i class="fa fa-plus"></i> 添加新部门
                        </button>
                        <button type="button" id="save_btn" class="btn btn-default "><i
                                class="fa fa-save"></i> 保存部门
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</@override>
<@override name="window">
</@override>
<@extends name="../base_main.ftl"/>