var url = "../../Handler/bus_pickup.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
     
     $('#remark').summernote({ height: 100 });
     
    var id = $.getUrlParam('id');
    $("#hid").val(id); 
    if(id>0){
        getDataDetail(id);
    }
    getListUser2(0);
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
            $("#dilivery_user_id").val(data.dilivery_user_id);
            getListUser2(data.dilivery_user_id);

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
            remark: $("#remark").code(),
            dilivery_user_id: $("#dilivery_user_id").val()
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


function getListUser2(id){
    $.ajax({
        type: "post",
        url: url + "?t=getListUser2",
        dataType: 'json',    
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        success: function (data) {   
            $("#dilivery_user_id").empty();
            $("#dilivery_user_id").append("<option value='0'>请选择</option>");
            $("#ListUserTemplate").tmpl(data).appendTo("#dilivery_user_id"); 
            $("#dilivery_user_id").val(id);
            
        },
        error:function(){ 
        }
    });
}



///自己方法
function openPickupTimesContainer(){
    layer.open({
      type: 1,
      area: ['600px', '300px'],
      title:"自提点时间",
      scrollbar:false,
      btn: ['确定', '取消']
  ,yes: function(index, layero){
  layer.close(index);
  alert(1);
    //按钮【按钮一】的回调
  },btn2: function(index, layero){
  alert(2);
    //按钮【按钮二】的回调
  },
      content:$("#pickupTimesContainer")
    });
}