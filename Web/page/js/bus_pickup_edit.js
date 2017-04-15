var url = "../../Handler/bus_pickup.ashx"; 
var pickup_address_id =0;
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
        getPickupTimes(id);
        pickup_address_id = id;
        
     $("#picupTimesEditContainer").show();
    }else{
     $("#picupTimesEditContainer").hide();
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
      btn: ['确定', '取消'],
      yes: function(index, layero){
          layer.close(index);
          editPickupTimes(); 
      },btn2: function(index, layero){ 
      },
      content:$("#pickupTimesContainer")
    });
}


function editPickupTimes() {    
    $.ajax({
        type: "post",
        url: url + "?t=editPickupTimes",
        data: { 
            pickup_address_id: $("#hid").val(),
            eat_type:$('input[name=eat_type]:checked').val(),
            pickup_time:$('input[name=pickup_time]:checked').val(),
            pickup_start_time: $("#pickup_start_time").val(),
            pickup_end_time: $("#pickup_end_time").val()
        },
        dataType: 'json',   
        success: function (data) { 
            if(data.isSuccess){
                 getPickupTimes(pickup_address_id);
            }else{ 
                layer.msg('保存失败！');
            }
        }
    });
}

function getPickupTimes(pickup_address_id){ 
 $.ajax({
        type: "post",
        url: url + "?t=getPickupTimes",
        data: {
           pickup_address_id:pickup_address_id,
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data) { 
            $("#pickupTimesList").empty();
            $("#pickupTimesListTmpl").tmpl(data).appendTo("#pickupTimesList");
        },
        error:function(){ 
        }
    });
}

function deleteDataByStatus(id) { 
    layer.confirm('确定删除吗？', 
    {btn: ['确定','取消']},
    function(){ 
        $.ajax({
            type: "post",
            url: url + "?t=deletePickupTimes",
            data: { 
                id: id
            },
            dataType: 'json',   
            success: function (data) { 
                if(data.isSuccess){
                    layer.msg('删除成功！');
                        getPickupTimes(pickup_address_id);
                    }else{
                        layer.msg('删除失败！');
                    }
                }
        });
    }, function(){
   
    }); 
}

 