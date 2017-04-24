var url = "../../Handler/bus_order.ashx";  

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
          getOrderDishList();  

    }else{   
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
            data = data[0]
            $("#hid").val(data.id); 
            $("#order_code").html(data.order_code);  
            $("#total_real_price").html(data.total_real_price); 
            $("#create_date").html(data.create_date); 
            $("#userName").html(data.userName);
            $("#consignee_name").html(data.consignee_name);
            $("#consignee_phone").html(data.consignee_phone); 
            $("#pickupName").html(data.pickupName); 
            $("#consignee_name").html(data.consignee_name); 
            $("#discount_desc").html(data.discount_desc);  
            var payStatus="";
            if(data.pay_status==1){
                payStatus='已支付';
            }else{
                payStatus='未支付';
            }
            $("#pay_status").html(payStatus); 
            var payType="";
            if(data.pay_type==1){
                payType='线上支付';
            }else{
                payType='线下支付';
            }
            $("#pay_type").html(payType);
            $("#userName").html(userName);
             
            $("#consignee_name").html(data.consignee_name);
            $("#consignee_phone").html(data.consignee_phone); 
            

            
            
            var orderStatus = "";
            if(data.order_status==1){
                orderStatus='已预订';
            }else if(data.order_status==2){
                orderStatus='待取餐';
            }else if(data.order_status==3){
                orderStatus='待送达';
            }else if(data.order_status==4){
                orderStatus='已完成';
            }else if(data.order_status==5){
                orderStatus='已退单';
            }else if(data.order_status==6){
                orderStatus='申请退单';
            }
            $('#order_status').html(orderStatus);
           
             
        },
        error:function(){
            loadingHide();
        }
    });
} 

function getOrderDishList(){
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getOrderDishList",
        data: {
            order_id:  $("#hid").val()
        },
        dataType: 'json',   
        success: function (data) { 
        console.log(data);
            loadingHide(); 
            $("#DataList").empty();
            $("#DataTemplate").tmpl(data).appendTo("#DataList"); 
            if(data.length>0){
             $("#tbList").show();
            }else{
             $("#tbList").hide();
            }
        },
        error:function(){
            $("#DataList").empty();
            $("#tbList").hide();
            
            loadingHide();
        }
    });
}

function goPageList() {
    window.location.href = "bus_order_list.htm";
}
  