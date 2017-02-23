var url = "../Handler/PickupAddress.ashx"; 
$(function () {
    getDataList(1);
});
function getDataList(index) {  
    $.ajax({
        type: "post",
        url: url + "?t=getDataList",
        data: {
           key: "xdp", 
        },
        dataType: 'json',   
        success: function (data) { 
            $("#DataList").empty();
            $("#DataTemplate").tmpl(data).appendTo("#DataList");
        }
    });
}

function goPageDetail(id) {
    window.location.href = "PickupAddressEdit.htm?id="+id;
}

