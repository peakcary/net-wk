var url = "../../Handler/bus_pickup.ashx"; 
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
        getListByPageInfo(page_index);
		return false;
	}

function getListByPageInfo(index) {  
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getListByPageInfo",
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
 

function deleteDataByStatus(id) { 
    layer.confirm('确定删除吗？', {
      btn: ['确定','取消'] //按钮
    }, function(){ 
        $.ajax({
            type: "post",
            url: url + "?t=deleteDataByStatus",
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

function deleteData(id) {
    if(confirm("确定删除吗?")){
        $.ajax({
        type: "post",
        url: url + "?t=deleteData",
        data: { 
            id: id
        },
        dataType: 'json',   
        success: function (data) { 
            if(data.isSuccess){
                getListByPageInfo(0);
            }else{
                alert('保存失败！');
            }
        }
    });
    }
} 

function goPageDetail(id) {
    window.location.href = "bus_pickup_edit.htm?id="+id;
}


