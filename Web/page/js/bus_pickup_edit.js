var url = "../../Handler/bus_pickup.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
     
     $('#remark').summernote({ height: 150 });
     
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
            $("#pickup_code").val(data.pickup_code);
            $("#name").val(data.name);
            $("#address").val(data.address);
            $("#lon").val(data.lon);
            $("#lat").val(data.lat);
            $("#sort").val(data.sort);
            $("#remark").code(data.remark);
        }
    });
} 

function goPageList() {
    window.location.href = "bus_pickup_list.htm";
}

function editData() {    
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            pickup_code: $("#pickup_code").val(),
            name: $("#name").val(),
            address: $("#address").val(),
            sort: $("#sort").val(),
            lon: $("#lon").val(),
            lat: $("#lat").val(),
            remark: $("#remark").code()
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