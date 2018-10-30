<#include "../default_cfg.ftl"/>
<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
    <h3>选择门店</h3>
</div>
<div class="modal-body">
    <div class="portlet-body form">
    </div>
    <div id="module-menus" style="padding-top:5px;">
    <#include "./branch_list.ftl"/>
    </div>
</div>
<div class="modal-footer">
    <a href="#" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</a>
</div>