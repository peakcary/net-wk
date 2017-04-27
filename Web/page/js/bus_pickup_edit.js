var url = "../../Handler/bus_pickup.ashx"; 
 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery); 
    initInputValid();
     $('#remark').summernote({ height: 100 });
     
    var id = $.getUrlParam('id');
    $("#hid").val(id); 
    if(id>0){
        getDataDetail(id);
        getPickupTimes(id);  
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
            $("input[name=status][value="+data.status+"]").attr("checked", 'checked');
            getListUser2(data.dilivery_user_id);

        }
    });
} 

function goPageList() {
    window.location.href = "bus_pickup_list.htm";
}

function editData(isTolist) {  
if(!isDataValid()){
return;
}  
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
            status: $('input[type="radio"][name="status"]:checked').val(),
            sort: $("#sort").val(),
            dilivery_user_id: $("#dilivery_user_id").val()
        },
        dataType: 'json',   
        success: function (data) { 
        if(data.isSuccess){
            $("#hid").val(data.primaryKey);
            if(!isTolist){
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
            }else{
              goPageList();
            }
            
        }else{ 
             layer.msg('保存失败！');
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

 
function openPickupTimesContainer(){
    if($("#hid").val()==""){
        editData(false);
    } else{
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
                 getPickupTimes();
            }else{ 
                layer.msg('保存失败！');
            }
        }
    });
}

function getPickupTimes(){ 
 $.ajax({
        type: "post",
        url: url + "?t=getPickupTimes",
        data: {
           pickup_address_id:$("#hid").val(),
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data) { 
            if(data.length>0){
              $("#picupTimesEditContainer").show();
              $("#pickupTimesList").empty();
              $("#pickupTimesListTmpl").tmpl(data).appendTo("#pickupTimesList");
            }else{
              $("#picupTimesEditContainer").hide();
            }
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
                        getPickupTimes($("#hid").val());
                    }else{
                        layer.msg('删除失败！');
                    }
                }
        });
    }); 
} 

function isDataValid(){
    if($("#name").val()==""){
        layer.msg('请输入名称！');
        $("#name").focus();
        return false;
    }
    if($("#address").val()==""){
        layer.msg('请输入地址！');
        $("#address").focus();
        return false;
    }
    if($("#lon").val()==""){
        layer.msg('请输入经度！');
        $("#lon").focus();
        return false;
    }
    if($("#lat").val()==""){
        layer.msg('请输入纬度！');
        $("#lat").focus();
        return false;
    }
    return true;
}

function initInputValid(){
    $("#lon").keyup(function(){    
                    $(this).val($(this).val().replace(/[^0-9.]/g,''));    
                }).bind("paste",function(){  //CTR+V事件处理    
                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
                }).css("ime-mode", "disabled"); //CSS设置输入法不可用    
}
 
