var url = "../../Handler/bus_discount.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
      $('#description').summernote({ height: 100 });
       $('#remark').summernote({ height: 100 });
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
            $("#name").val(data.name);
            $("#start_date").val(data.start_date); 
            $("#end_date").val(data.end_date);
            $("#min_amount").val(data.min_amount);
            $("#max_amount").val(data.max_amount);
            $("#discount_amount").val(data.discount_amount);
            $("input[name=status][value="+data.status+"]").attr("checked", 'checked');
            $("#remark").code(data.remark);
            $("#description").code(data.description);
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_discount_list.htm";
}

function editData() {  
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            status:$('input[type="radio"][name="status"]:checked').val(), 
            name: $("#name").val(),
            start_date: $("#start_date").val(),
            end_date: $("#end_date").val(),
            min_amount: $("#min_amount").val(),
            max_amount: $("#max_amount").val(),
            discount_amount: $("#discount_amount").val(),
             description: $("#description").code(),
              remark: $("#remark").code()
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