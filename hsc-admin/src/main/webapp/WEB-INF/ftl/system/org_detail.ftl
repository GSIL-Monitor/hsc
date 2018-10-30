<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th style="width:48px;">
                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                    <input type="checkbox" class="group-checkable" name="checkAllButton"
                           onclick="checkAllEvent(this,'checkboxname','checkAllButton');">
                    <span></span>
                </label>
            </th>
            <th> 部门</th>
        </tr>
        </thead>
        <tbody>
        <#if detailList?? && detailList?size gt 0>
            <#list detailList as dataItem>
            <tr class="odd gradeX">
                <td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                    <input type="checkbox" name="checkboxname" class="checkboxes"
                           value="${dataItem.id!''}">
                    <span></span>
                </label></td>
                <td>
                ${dataItem.fullname!''}
                </td>
            </tr>
            </#list>
        </#if>

        </tbody>
    </table>
</div>