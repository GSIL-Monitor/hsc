<@override name="jstext">
<script>

    function search() {
        $("#searchForm").attr('action', '${ctxPath}/help/helpcentermanage.action');
        $("#searchForm").submit();
    }

    function queryReset() {
        $("#questiontitle").val("");
        $("#systemplatform").val("");
        $("#helptype").val("");
        $("#level1modulename").val("");
        $("#level2modulename").val("");
        $("#starttime").val("");
        $("#endtime").val("");
        $("#searchForm").attr('action', '${ctxPath}/help/helpcentermanage.action');
        $("#searchForm").submit();
    }

    function change(){//按钮单击事件

        var productcode=$("#productcode").val("")
        $("#submitwechatForm").submit();
    }

    function reset() {
        $("#searchForm").reset();
    }
    function batchImportCallBack(dataList) {
        debugger;
        if (dataList.length == 0) {
            AlertMsg('请求失败');
        } else {
            var data = dataList[0];
            var success = data.success;
            if (success == '0') {
                AlertMsg(data.errorMsg);
            } else if (success == '1') {

                AlertMsg('导入成功，共导入了' + data.successCount + "条数据", function () {
                    zlf.common.search();
                    queryReset();
                });

            } else if (success == '2') {

                refreshAndShowImportError('导入全部失败<br/>导入失败了' + data.errorCount + '条商品数据', data.errorList);

            } else if (success == '3') {

                refreshAndShowImportError('导入部分成功<br/>导入成功了' + data.successCount + '条商品数据<br/>导入失败了' + data.errorCount + '条商品数据', data.errorList);
            }
        }

    }
    /*  $('.form_date').datetimepicker({
          language:  'zh-CN',
          weekStart: 1,
          todayBtn:  1,
          autoclose: 1,
          todayHighlight: 1,
          startView: 3,
          minView: 4,
          forceParse: 0,
          todayHighlight:true
      });*/
    $(function(){
        $('.form_date').datetimepicker('setEndDate', new Date());
        $('#starttimeselect')
                .datetimepicker()
                .on('changeDate', function(ev){
                    var starttime = $('#starttime').val();
                    if(starttime){
                        $('#endtimeselect').datetimepicker('setStartDate', starttime);
                    }
                });

        $('#endtimeselect')
                .datetimepicker()
                .on('changeDate', function(ev){
                    var endtime = $('#endtime').val();
                    if(endtime){
                        $('#starttimeselect').datetimepicker('setEndDate', endtime);
                    }
                });

    });

    function refreshAndShowImportError(msg, errorList) {

        $('#importErrorTbody').empty();
        $('#importMsg').html(msg);

        for (var index in errorList) {
            $('#importErrorTbody').append('<tr><td>' + errorList[index].rownum + '</td><td>' + errorList[index].errorMsg + '</td></tr>');
        }

        $('#modal-close').modal('show');
        $('#modal-close').unbind('hide.bs.modal').bind('hide.bs.modal', function () {
            window.location.reload();
        })
    }

    //上传回调函数
    function uploadCallBack(dataList, domId) {
        createImageList(dataList, domId);
    }

</script>
</@override>
<@override name="right">

</@override>
<@extends name="../base_main.ftl"/>
