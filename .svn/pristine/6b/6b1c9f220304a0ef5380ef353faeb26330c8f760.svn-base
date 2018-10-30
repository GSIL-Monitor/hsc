<#include "../default_cfg.ftl"/>
<script language="javascript" src="${zl.admin.resource.address}/js/nestable/jquery.nestable.js?version=${zl.web.resource.version}"></script>
<link rel="stylesheet" type="text/css" href="${zl.admin.resource.address}/css/nestable.css?version=${zl.web.resource.version}">
<style type="text/css">
    .dd-handle {
        height: 40px;
        line-height: 26px
    }
</style>
<script>

    $(function () {
        var depth = 3;
        if (depth <= 0) {
            depth = 3;
        }
        $('#div_nestable').nestable({maxDepth: depth, isMove: 0});

        $(".dd-handle a,dd-handle embed,dd-handle div").mousedown(function (e) {
            e.stopPropagation();
        });
    })

    function ChooseTreeItem(id, name, level) {
        ChooseOrg.callback({
            id: id,
            name: name,
            level: level
        });
    }
</script>

<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
    <h3>选择部门</h3>
</div>
<div class="modal-body" id="module-org">
    <div class="dd" id="div_nestable">
    <#import "../buildChooseTree.ftl" as bt>
                    <@bt.buildTree rootList=dataList maxLevel=3/>
    </div>
</div>
<div class="modal-footer">
    <a href="#" class="btn btn-default " data-dismiss="modal" aria-hidden="true">关闭</a>
</div>
