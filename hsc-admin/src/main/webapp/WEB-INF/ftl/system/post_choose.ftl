<#include "../default_cfg.ftl"/>
<script>

    function refreshPostList(params) {
        var url = '${ctxPath}/post/list.action';
        ajaxInSameDomain(url, params, function (result) {
            $('#module-menus').html(result);
        }, 'html')
    }

    function searchPost() {
        var params = {
            keyword:$('#keyword').val()
        };
        refreshPostList(params);
        $('#formID').serialize()
    }

</script>
<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
    <h3>选择职位</h3>
</div>
<div class="modal-body">
    <form action="#" id="searchForm" class="form-horizontal" method="post">
        <div class="form-body">
            <div class="row">
                <div class="col-md-6 col-sm-6">

                    <div class="form-group">
                        <label class="control-label col-md-3">关键字</label>

                        <div class="col-md-8">
                            <input type="text" id="keyword" name="keyword" value="" class="form-control"
                                   placeholder="可输入职位名称进行查询">
                        </div>
                    </div>
                </div>

                <div class="col-md-2 col-sm-6">
                    <button type="button" class="btn btn-default " onclick="searchPost()">
                        <i class="fa fa-search"></i> 搜索
                    </button>
                </div>
            </div>
        </div>
    </form>
    <div id="module-menus" style="padding-top:5px;">
    <#include "./post_list.ftl"/>
    </div>
</div>
<div class="modal-footer">
    <a href="#" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</a>
</div>