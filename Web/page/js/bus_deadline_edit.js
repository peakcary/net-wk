var url = "../../Handler/bus_deadline.ashx"; 
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
            $("#deadline_days").val(data.deadline_days);
            $("#deadline_times").val(data.deadline_times); 
            $("input[name=deadline_time_type ][value="+data.deadline_time_type +"]").attr("checked", 'checked');
            $("input[name=eat_type ][value="+data.eat_type +"]").attr("checked", 'checked');
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_deadline_list.htm";
}

function editData() {  
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            deadline_time_type:$('input[type="radio"][name="deadline_time_type"]:checked').val(),
            eat_type: $('input[type="radio"][name="eat_type"]:checked').val(),
            deadline_days: $("#deadline_days").val(),
            deadline_times: $("#deadline_times").val()
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