<div id="modal-org" class="modal fade modal-scroll" tabindex="-1" role="dialog" aria-hidden="false">
    <div class="modal-dialog">
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
    var ChooseOrg = {
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
            $('#modal-org').modal({
                remote: "${ctxPath}/org/toChoose.action"
            })
        },
        close: function () {
            $('#modal-org').modal('hide');
        },
        callback: function (data) {
            this.cb(data);
            this.close();
        }
    }

    $("#modal-org").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
        $(this).find('.modal-content').empty()
    });
</script>