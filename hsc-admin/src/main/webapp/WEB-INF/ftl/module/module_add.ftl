<#include "../default_cfg.ftl"/>
<script>

    function refreshShopList(params) {
        var url = '${ctxPath}/shop/list.action';
        ajaxInSameDomain(url, params, function (result) {
            $('#module-menus').html(result);
        }, 'html')
    }

    function searchShop() {
        var params = {
            keyword:$('.modal-body #keyword').val()
        };
        refreshShopList(params);
        $('#formID').serialize()
    }

</script>
<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
    <h3>新增一级模块</h3>
</div>
<div class="modal-body">
    <div id="module-menus" style="padding-top:5px;">
    <#include "./shop_list.ftl"/>
    </div>
</div>
