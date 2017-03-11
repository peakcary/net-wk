function getLeftNav() {
    $.ajax({
        type: "GET",
        url: "leftnav.json",
        dataType: 'json',
        success: function (data) {

            $("#leftNav").empty();
            $("#leftNavTemplate").tmpl(data).appendTo("#leftNav");
        }
    });
}

function fLoadingShow() {
    layer.load();
}
function fLoadingHide() {
    //此处演示关闭
    setTimeout(function () {
        layer.closeAll('loading');
    }, 10);
}


