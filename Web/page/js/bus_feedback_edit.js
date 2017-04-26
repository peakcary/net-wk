var url = "../../Handler/bus_feedback.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
      $('#remark').summernote({ height: 100 });
       $('#content').summernote({ height: 100 });
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
            $("#user_id").val(data.user_id);
            $("#remark").code(data.remark);
            $("#content").code(data.content);
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_feedback_list.htm";
}

function editData() { 
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            user_id: $("#user_id").val(),
            remark: $("#remark").code(),
            content: $("#content").code()
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