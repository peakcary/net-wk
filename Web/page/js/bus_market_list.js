var url = "../../Handler/bus_market.ashx"; 
var listPageSize = 10;
$(function () { 
    initPagination(); 
});

function initPagination(){
     $.ajax({
        type: "post",
        url: url + "?t=getListCount",
        data: {
           key: "xdp", 
        },
        dataType: 'json',   
        success: function (data) {  
            if(data.RecordCount>0){
                $("#Pagination").pagination(data.RecordCount, {
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
        getDataList(page_index);
		return false;
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
                        initPagination();
                    }else{
                        layer.msg('删除失败！');
                    }
                }
        });
    }); 
}  
 function updateStatus(id,status) {
    $.ajax({
            type: "post",
            url: url + "?t=updateStatus",
            data: { 
                id: id,
                status:status
            },
            dataType: 'json',   
            success: function (data) { 
                if(data.isSuccess){
                        layer.msg('操作成功！');
                        initPagination();
                    }else{
                        layer.msg('操作失败！');
                    }
                }
        }); 
}  

 

function goPageDetail(id) {
    window.location.href = "bus_market_edit.htm?id="+id;
}


