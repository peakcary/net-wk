var url = "../../Handler/bus_area.ashx"; 
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
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getDataDetail",
        data: {
           id: id, 
        }, 
        dataType: 'json',  
        success: function (data) { 
            loadingHide();
            $("#hid").val(data.id);
            $("#lat").val(data.lat);
            $("#lon").val(data.lon);
            $("#name").val(data.name);
            $("#parent_id").val(data.parent_id); 
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_area_list.htm";
}

function editData() { 
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            lat: $("#lat").val(),
            lon: $("#lon").val(),
            name: $("#name").val(),
            lat: $("#lat").val(),
            parent_id: $("#parent_id").val()
        },
        dataType: 'json',   
        success: function (data) { 
            loadingHide();
            if(data.isSuccess){
                goPageList();
            }else{
                alert('保存失败！');
            }
        },
        error:function(){
            loadingHide();
        }
    });
}