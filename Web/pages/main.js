$(function () {
    $("#btnConfirm").click(function () {
        getData(1);
    });
});

function getData(index) {
    $.ajax({
        type: "post",
        url: "../Handler/DataHandler.ashx?t=getLeftTree",
        data: "index=" + index,
        complete: function () {
        },
        success: function (data) {
            alert(data);
        }
    });
}