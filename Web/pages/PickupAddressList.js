var url = "../Handler/PickupAddress.ashx"; 
$(function () {
    getDataList(1);
});
function getDataList(index) {
    $.ajax({
        type: "post",
        url: url + "?t=getDataList",
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
function getDataDetail(id) {
    $.ajax({
        type: "post",
        url: url + "?t=getDataDetail",
        data: "id=" + id,
        complete: function () {
        },
        success: function (data) { 
            alert(data);
        }
    });
}