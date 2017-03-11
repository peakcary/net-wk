var url = "../../Handler/bus_dish.ashx"; 
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
    
    getLeftNav();
    var id = $.getUrlParam('id');
    $("#hid").val(id); 
    if(id>0){
        getDataDetail(id);
    }
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
            $("#market_id").val(data.market_id);
            $("#dish_type").val(data.dish_type);
            $("#name_en").val(data.name_en);
            $("#name_cn").val(data.name_cn);
            $("#description_en").val(data.description_en);
            $("#description_cn").val(data.description_cn); 
            $("#original_price").val(data.original_price); 
            $("#discount_price").val(data.discount_price); 
            $("#sales_total").val(data.sales_total); 
            $("#sort").val(data.sort);  
            $('#remark').code(data.remark);
        }
    });
} 

function goPageList() {
    window.location.href = "bus_dish_list.htm";
}

function editData() {   
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            market_id: $("#market_id").val(),
            dish_type: $("#dish_type").val(),
            name_en: $("#name_en").val(),
            name_cn: $("#name_cn").val(),
            description_en: $("#description_en").val(),
            description_cn: $("#description_cn").val(),
            original_price: $("#original_price").val(),
            discount_price: $("#discount_price").val(),
            sales_total: $("#sales_total").val(),
            sort: $("#sort").val(),
            remark: $("#remark").code() 
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