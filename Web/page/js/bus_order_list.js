var url = "../../Handler/bus_order.ashx";
var listPageSize = 10;
 
var order_code = "";
var user_id = 0;
var pickup_address_id = 0;
var order_status = 0;
var pay_status = 0;
var eat_type = 0;
var minDays = -1;
var isDiscount = 0;
var pageIndex = 0;
var pageSize = 10000; 
$(function () { 
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery); 
    getPickUplist();
    $("#btnSearch").click(function () {
        order_code = $("#order_code").val();
        user_id = $("#user_id").val();
        pickup_address_id = $("#pickup_address_id").val();
        initPagination();
    });
     
    $(".eat_type").each(function(index,ele){
        $(this).click(function(){
             $(".eat_type").each(function(index,ele){
              $(ele).removeClass('sdiv-active'); 
             });
           $(this).addClass('sdiv-active'); 
           var ref = $(this).attr('ref');
           if(ref == '0'){
            eat_type=0;
            minDays=-1;
           }else if(ref == '1'){
            eat_type=1;
            minDays=1;
           }else if(ref == '2'){
            eat_type=2;
            minDays=1;
           }else if(ref == '3'){
            eat_type=1;
            minDays=2;
           }else if(ref == '4'){
            eat_type=2;
            minDays=2;
           }
            initPagination();
        });
    });

    $(".order_status").each(function(index,ele){
        $(this).click(function(){
             $(".order_status").each(function(index,ele){
              $(ele).removeClass('sdiv-active'); 
             });
           $(this).addClass('sdiv-active'); 
           order_status = $(this).attr('ref');
            initPagination();
        });
    });
    $(".pay_status").each(function(index,ele){
        $(this).click(function(){
             $(".pay_status").each(function(index,ele){
              $(ele).removeClass('sdiv-active'); 
             });
           $(this).addClass('sdiv-active'); 
           pay_status = $(this).attr('ref');
            initPagination();
        });
    });
     $(".isDiscount").each(function(index,ele){
        $(this).click(function(){
             $(".isDiscount").each(function(index,ele){
              $(ele).removeClass('sdiv-active'); 
             });
           $(this).addClass('sdiv-active'); 
           pay_status = $(this).attr('ref');
            initPagination();
        });
    }); 
    
    initPagination(); 
    getAllOrderListByQuery();
    fExcelMarket();
    getDiliveryUserOrderList();
    getPickupAddressOrderList();
    $("#btnExcelAll").on("click",fExcelAll); 
    $("#btnExcelMarket").on("click",eExcelMarket);
    $("#btnExcelDiliveryUser").on("click",eExcelUser);
    $("#btnExcelPickupAddress").on("click",eExcelAddress); 
    
});

function initPagination() {
     $.ajax({
        type: "post",
        url: url + "?t=getListByQuery",
        data: {
            order_code: order_code,
            user_id: user_id,
            order_status: order_status,
            pay_status: pay_status,
            eat_type: eat_type,
            minDays: minDays,
            isDiscount: isDiscount,
            minDays: minDays,
            pageIndex: pageIndex,
            pageSize: pageSize,
            pickup_address_id: pickup_address_id
        },
        dataType: 'json',   
        success: function (data) {  
            if(data.length>0){
                $("#Pagination").pagination(data.length, {
			        num_edge_entries: 1, //边缘页数
			        num_display_entries: 6, //主体页数
			        callback: pageselectCallback,
			        items_per_page:listPageSize, //每页显示1项
                    prev_text: "前一页",
			        next_text: "后一页"
		        });
            }else{
             $("#DataList").empty();
            }
        }
    });
}

function pageselectCallback(page_index, jq){  
        getListByQuery(page_index);
		return false;
	}

function getListByQuery(index){
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getListByQuery",
        data: {
            order_code: order_code,
            user_id: user_id,
            order_status: order_status,
            pay_status: pay_status,
            eat_type: eat_type,
            minDays: minDays,
            isDiscount: isDiscount,
            minDays: minDays,
           pageIndex: index,
           pageSize: listPageSize,
           pickup_address_id: pickup_address_id 
        },
        dataType: 'json',   
        success: function (data) { 
        console.log(data);
            loadingHide();
            
            $("#DataList").empty();
            if(data.length>0)
            {$("#DataTemplate").tmpl(data).appendTo("#DataList");  
            }
            
           
        },
        error:function(){
         $("#DataList").empty();
            loadingHide();
        }
    });
}

function getDataList(index) {  
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getDataList",
        data: { 
           pageIndex: index,
           pageSize: listPageSize 
        },
        dataType: 'json',   
        success: function (data) { 
            loadingHide();
            $("#DataList").empty();
            $("#DataTemplate").tmpl(data).appendTo("#DataList");  
           
        },
        error:function(){
        $("#DataList").empty();
            loadingHide();
        }
    });
}
 

function deleteData(id) {
    layer.confirm('确定删除吗？', {
      btn: ['确定','取消']
    }, function(){ 
        $.ajax({
            type: "post",
            url: url + "?t=deleteData",
            data: { 
                id: id
            },
            dataType: 'json',   
            success: function (data) { 
                if(data.isSuccess){
                    layer.msg('删除成功！');
                        getListByPageInfo(0);
                    }else{
                        layer.msg('删除失败！');
                    }
                }
        });
    }); 
}  
 

function goPageDetail(id) {
    window.location.href = "bus_order_detail.htm?id="+id;
}

function fExcelAll(){
  return ExcellentExport.excel(this, 'tbExcelAll', 'all');
}

function eExcelMarket(){
  return ExcellentExport.excel(this, 'tbExcelMarket', 'all');
}

function eExcelUser(){ 
  return ExcellentExport.excel(this, 'dtExcelUser', 'all');
}
function eExcelAddress(){ 
  return ExcellentExport.excel(this, 'dtExcelAddress', 'all');
}
 

function getAllOrderListByQuery(){
    $.ajax({
        type: "post",
        url: url + "?t=getAllOrderListByQuery",
        data: {
            order_code: order_code,
            user_id: user_id,
            order_status: order_status,
            pay_status: pay_status,
            eat_type: eat_type,
            minDays: minDays,
            isDiscount: isDiscount,
            minDays: minDays,
            pickup_address_id:pickup_address_id,
           pageIndex: 0,
           pageSize: 10000 
        },
        dataType: 'json',   
        success: function (data) {  
              $("#dataExcelAll").empty();
              $("#dataExcelAllTemplate").tmpl(data).appendTo("#dataExcelAll");  
        },
        error:function(){
          
        }
    });
}

function fExcelMarket(){
$.ajax({
        type: "post",
        url: url + "?t=getMarketOrderList",
        data: {
            order_code: order_code,
            user_id: user_id,
            order_status: order_status,
            pay_status: pay_status,
            eat_type: eat_type,
            minDays: minDays,
            isDiscount: isDiscount,
            minDays: minDays,
            pickup_address_id:pickup_address_id,
           pageIndex: 0,
           pageSize: 10000 
        },
        dataType: 'json',   
        success: function (data) { 
        console.log(data);
                $("#dataExcelMarket").empty();
              $("#dataExcelMarketTemplate").tmpl(data).appendTo("#dataExcelMarket");  
        
            
        },
        error:function(){
          $("#dataExcelMarket").empty();
        }
    });
}

function getPickupAddressOrderList(){
$.ajax({
        type: "post",
        url: url + "?t=getPickupAddressOrderList",
        data: {
            order_code: order_code,
            user_id: user_id,
            order_status: order_status,
            pay_status: pay_status,
            eat_type: eat_type,
            minDays: minDays,
            isDiscount: isDiscount,
            minDays: minDays,
            pickup_address_id:pickup_address_id,
           pageIndex: 0,
           pageSize: 10000 
        },
        dataType: 'json',   
        success: function (data) { 
            console.log(data);
           $("#dataExcelAddress").empty();
              $("#dataExcelAddressTemplate").tmpl(data).appendTo("#dataExcelAddress");  
        },
        error:function(){
          $("#dataExcelAddress").empty();
        }
    });
}

function getDiliveryUserOrderList(){ 
    $.ajax({
        type: "post",
        url: url + "?t=getDiliveryUserOrderList",
        data: {
            order_code: order_code,
            user_id: user_id,
            order_status: order_status,
            pay_status: pay_status,
            eat_type: eat_type,
            minDays: minDays,
            isDiscount: isDiscount,
            minDays: minDays,
            pickup_address_id:pickup_address_id,
           pageIndex: 0,
           pageSize: 10000 
        },
        dataType: 'json',   
        success: function (data) { 
            console.log(data);
         $("#dataExcelUser").empty();
              $("#dataExcelUserTemplate").tmpl(data).appendTo("#dataExcelUser");  
        },
        error:function(){
          $("#dataExcelUser").empty();
        }
    });
}


function cancelOrder(id,order_code){
   $.ajax({
        type: "post",
        url: url + "?t=getHashCode",
        data: {
            orderid: id,
            ordercode: order_code
        },
        dataType: 'json',   
        success: function (data) {  
            $.ajax({
              url: "http://47.88.0.200:8080/api/project/cancelOrder",
              timeout:5000,
              method: "POST",
              data: {
                "orderId": id,
                "hashCode": data.sValue
              },
              dataType: 'JSON',
                success:function(data){
                 layer.msg(data.Message);
              }
            });
       
        },
        error:function(err){
            layer.msg(err);
        }
    }); 

}




function getPickUplist() {   
    $.ajax({
        type: "post",
        url: url + "?t=getPickUplist",
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data) {  
             $("#pickup_address_id").empty();
            $("#pickup_address_id").append("<option value='0'>请选择</option>");
            $("#pickupListTemplate").tmpl(data).appendTo("#pickup_address_id");  
        },
        error:function(){
            
        }
    });
}

