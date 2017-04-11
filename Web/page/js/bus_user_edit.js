var url = "../../Handler/bus_user.ashx"; 
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
            $("#nickname").val(data.nickname);
            $("#phone_num").val(data.phone_num);
            $("#pwd").val(data.pwd);
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_user_list.htm";
}

function editData() { 
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            nickname: $("#nickname").val(),
            phone_num: $("#phone_num").val(),
            pwd: $("#pwd").val()
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