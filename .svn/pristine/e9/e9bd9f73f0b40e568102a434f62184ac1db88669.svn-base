<#include "../default_cfg.ftl"/>
<script>
    //分页
    function jumpPage(pageid, no, url) {
        var pageCount = 0;
    <#if pageInfo??>
        pageCount = ${((pageInfo.totalRecords+pageInfo.pageSize -1)/pageInfo.pageSize)?int};
    </#if>
        if (no > pageCount) {
            no = pageCount;
        }
        if (no < 1) {
            no = 1;
        }

        $("#" + pageid).find("input[name='page']").attr("value", no);

        refreshPostList($('#' + pageid).serialize());
    }
</script>
<div class="table-responsive">
<table class="table table-bordered table-hover">
    <thead class="navbar-inner">
    <tr>
        <th>职位</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if pageInfo?? && pageInfo.list??>
        <#list pageInfo.list as post>
        <tr>
            <td>${post.name!''}</td>
            <td>
                <a href="javascript:void(0);"
                   onclick="ChoosePost.callback({id:'${post.id!''}',name:'${post.name!''}'})">选择</a>
            </td>
        </tr>
        </#list>
    </#if>

    </tbody>
</table>
</div>
<#if pageInfo?? && pageInfo.totalRecords gt 0>
<form id="post_list_form" method="post">
    <#import "../pager.ftl" as q>
			                    <@q.pager page=pageInfo.page pageSize=pageInfo.pageSize totalRecords=pageInfo.totalRecords toURL="${ctxPath}/post/list.action" pageid="post_list_form"/>
</form>
</#if>