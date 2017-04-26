var url = "../../Handler/sys_user.ashx"; 
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
            $("#code").val(data.code);
            $("#name").val(data.name);
            $("#pwd").val(data.pwd);
            $("#sex").val(data.sex);
            $("#remark").val(data.remark);
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "sys_user_list.htm";
}

function editData() { 
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            code: $("#code").val(),
            name: $("#name").val(),
            pwd: $("#pwd").val(),
            sex: $("#sex").val(),
            remark: $("#remark").val()
        },
        dataType: 'json',   
        success: function (data) { 
            loadingHide();
            if(data.isSuccess){
                goPageList();
            }else{ 
                layer.msg('保存失败！');
            }
        },
        error:function(){
            loadingHide();
        }
    });
}