<#include "../default_cfg.ftl"/>
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>名称</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody>
        <#if dataList?? && dataList?size gt 0>
            <#list dataList as data>
            <tr>
                <td>${data.branchname!''}</td>
                <td>
                    <a class="btn btn-default  btn-sm" href="javascript:void(0);"
                       onclick="ChooseBranch.callback({id:'${data.id!''}',name:'${data.branchname!''}'})">选择</a>
                </td>
            </tr>
            </#list>
        </#if>
        </tbody>
    </table>
</div>
