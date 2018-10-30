var ApiURL = {
    guess: 'http://192.168.1.216:3000/mock/17/searchguess',
}
var t = '';

function postDate(params) {
    var url = ApiURL[params["type"]];
    $.ajax({
        url: url,
        data: params["data"],
        type: 'post',
        cache: false,
        dataType: 'json',
        timeout: 5000,
        success: function(result) {
            if (params["type"] == "guess" && result.success == "1") {
                var dataList = result.data.list;
                var str = '';
                if (dataList.length > 0) {
                    $.each(dataList, function(index, value) {
                        str += '<li>' + value.title + '</li>';
                    })
                    // console.log(str)
                    if (str.length > 0) {
                        $('.guessresult').find("ul").html(str).end().show();
                    }
                } else {
                    hideGuess();
                }
            }
        }
    });
}

function hideGuess() {
	$('.guessresult').find("ul").html('').end().hide();
}

$(function() {
    $('.catTitle').click(function() {
        $(this).toggleClass('down bgcfa').next().toggle();
    });
    $("body").click(function() {
        hideGuess();
    });
    //搜索框输入值发生变化的时候
    $("body").on("keyup", "#searchValue", function() {
        clearTimeout(t);
        var value = $.trim($(this).val());
        if (value == "") {
        	hideGuess();
            return false;
        }
        t = setTimeout(function() {
            params = {
                type: "guess",
                data: 'keywords=' + encodeURIComponent(value)
            }
            postDate(params)
        }, 300)
    });
    //点击快捷搜索词语
    $("body").on("click", ".guessresult li", function() {
        $('#searchValue').val($(this).html())
    });
});