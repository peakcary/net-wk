var url = "../../Handler/bus_market.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);

     $('#remark').summernote({ height: 100 });
     $('#description_cn').summernote({ height: 100 });
     $('#description_en').summernote({ height: 100 });
     
    var id = $.getUrlParam('id'); 
    $("#hid").val(id); 
    if(id>0){
        getDataDetail(id); 
    }else{  
        getAreaList(0);
        getPickupList(0);
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
            $("#markket_code").val(data.markket_code);
            $("#name_en").val(data.name_en);
            $("#name_cn").val(data.name_cn); 
            $("input[name=status][value="+data.status+"]").attr("checked", 'checked');
            $("#market_type").val(data.market_type); 
//            $("#area_id").val(data.area_id); 
            $("#lon").val(data.lon); 
            $("#lat").val(data.lat); 
//            $("#bus_pickup_id").val(data.bus_pickup_id); 
            $("#address").val(data.address); 
            $("#sort").val(data.sort); 
            $("#remark").code(data.remark);
            $("#description_cn").code(data.description_cn);
            $("#description_en").code(data.description_en);
           
            getAreaList(data.area_id);
            getPickupList(data.pickup_address_id);
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_market_list.htm";
}

function editData() { 
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            area_id: $("#area_id").val(),
            markket_code: $("#markket_code").val(),
            name_en: $("#name_en").val(),
            name_cn: $("#name_cn").val(),
            status: $('input[type="radio"][name="status"]:checked').val(),
            lon: $("#lon").val(), 
            lat: $("#lat").val(),
            market_type: $("#market_type").val(),
            pickup_address_id: $("#pickup_address_id").val(),
            address: $("#address").val(),
            sort: $("#sort").val(), 
            remark: $("#remark").code(),
            description_cn: $("#description_cn").code(),
            description_en: $("#description_en").code()
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

function getAreaList(id) {   
    $.ajax({
        type: "post",
        url: url + "?t=getAreaList",
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data) {   
            $("#area_id").empty();
            $("#area_id").append("<option value='0'>请选择</option>");
            $("#areaListTemplate").tmpl(data).appendTo("#area_id");   
            $("#area_id").val(id); 
        },
        error:function(){ 
        }
    });
}
 
 function getPickupList(id) {   
    $.ajax({
        type: "post",
        url: url + "?t=getPickupList",
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data){  
            $("#pickup_address_id").empty();
            $("#pickup_address_id").append("<option value='0'>请选择</option>");
            $("#pickupListTemplate").tmpl(data).appendTo("#pickup_address_id");  
            $("#pickup_address_id").val(id); 
        },
        error:function(){ 
        }
    });
}
 
 