var url = "../../Handler/bus_area.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
    
    getLeftNav();
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
            $("#parent_id").val(data.parent_id);
            $("#name").val(data.name);
            $("#area_type").val(data.area_type);
            $("#lon").val(data.lon);
            $("#lat").val(data.lat);
            $("#remark").val(data.remark);
        }
    });
} 

function goPageList() {
    window.location.href = "bus_area_list.htm";
}

function editData() {   
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            parent_id: $("#parent_id").val(),
            name: $("#name").val(),
            userId: $("#hid").val(),
            area_type: $("#area_type").val(),
            lon: $("#lon").val(),
            lat: $("#lat").val(),
            remark: $("#remark").val()
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