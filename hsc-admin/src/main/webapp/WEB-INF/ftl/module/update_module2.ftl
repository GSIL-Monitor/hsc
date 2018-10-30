<div id="modal-shop" class="modal fade" tabindex="-1" role="dialog" aria-hidden="false">
    <div class="modal-dialog" >
        <div class="modal-content">
        </div>
    </div>
</div>
<script>
    /**
     * 参数 type , callback
     *
     * @type {{dom: null, open: Function, close: Function, callback: Function}}
     */
    var ChooseShop3 = {
        dom: null,
        cb: null,
        isFunction: function (func) {
            if (func && typeof func == 'function') {
                return true;
            }
            return false;
        },
        checkParam: function (obj) {
            return true;
        },
        open: function (param, cb) {
            if (!this.isFunction(cb)) {
                return;
            }

            if (!this.checkParam(param)) {
                return;
            }
            this.cb = cb;
            $('#modal-shop').modal({
                remote: "${ctxPath}/module/updatemoudle2move.action?id="+param.id+"&pid="+param.pid
            })
        },
        close: function () {
            $('#modal-shop').modal('hide');
        },
        callback1: function (data) {
            this.cb(data);
            this.close();
        }
    }
    $("#modal-shop").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
        $(this).find('.modal-content').empty()
    });
</script>