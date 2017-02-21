$(function () {
    
});
function getData(index) {
    $.ajax({
        type: "post",
        url: "../Handler/DataHandler.ashx?t=getLeftTree",
        data: "index=" + index,
        complete: function () {
        },
        success: function (data) {
            var dataJson = eval("(" + data + ")");
            $("#DataList").empty();
            $("#DataTemplate").tmpl(dataJson).appendTo("#DataList");
        }
    });
}