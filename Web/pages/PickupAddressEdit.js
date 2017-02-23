var url = "../Handler/PickupAddress.ashx";
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
    var id = $.getUrlParam('id');
    $("#hid").val(id); 
    if(id>0){
        getDataDetail(id);
    }
});

function getDataDetail(id) {
    $.ajax({
        type: "post",
        url: url + "?t=getDataDetail",
        data: {
           id: id, 
        }, 
        dataType: 'json',  
        success: function (data) { 
            $("#userId").val(data.userId);
            $("#username").val(data.username);
            $("#password").val(data.password);
            $("#address").val(data.address);
        }
    });
} 

function goPageList() {
    window.location.href = "PickupAddressList.htm";
}

function editData() {   
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            userId: $("#hid").val(),
            username: $("#username").val(),
            password: $("#password").val(),
            address: $("#address").val()
        },
        dataType: 'json',   
        success: function (data) { 
        if(data.isSuccess){
        goPageList();
        }else{
        alert('保存失败！');
        }
        }
    });
}