var url = "../../Handler/bus_order.ashx";
var listPageSize = 10;
var market_id = 0;
var order_code = "";
var user_id = 0;
var order_status = 0;
var pay_status = 0;
var eat_type = 0;
var minDays = 0;
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
    market_id = $.getUrlParam('market_id');
    $("#btnAdd").attr("href", "bus_dish_edit.htm?market_id=" + market_id);

    $("#btnSearch").click(function () {
        order_code = $("#order_code").val();
        user_id = $("#user_id").val();
        initPagination();
    });
    initPagination();
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
           pageSize: listPageSize 
        },
        dataType: 'json',   
        success: function (data) { 
        console.log(data);
            loadingHide();
            $("#DataList").empty();
            $("#DataTemplate").tmpl(data).appendTo("#DataList");  
           
        },
        error:function(){
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
            market_id: market_id,
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
    window.location.href = "bus_dish_edit.htm?id="+id;
}


