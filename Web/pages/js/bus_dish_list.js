var url = "../../Handler/bus_dish.ashx"; 
var listPageSize = 10;
$(function () {
$("#loading").fadeIn()
    getLeftNav(); ;
    initPagination();
});

function initPagination(){
$("#loading").fadeIn();
     $.ajax({
        type: "post",
        url: url + "?t=getRecordCount",
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
//                alert('保存失败！');
            }
        }
    });
}

function pageselectCallback(page_index, jq){  
        getListByPage(page_index);
		return false;
	}

function getListByPage(index) {  
    $.ajax({
        type: "post",
        url: url + "?t=getListByPage",
        data: {
           pageIndex: index,
           pageSize: listPageSize 
        },
        dataType: 'json',   
        success: function (data) { 
        
$("#loading").fadeOut();
            $("#DataList").empty();
            $("#DataTemplate").tmpl(data).appendTo("#DataList");
        }
    });
}

function getDataList(index) {  
    $.ajax({
        type: "post",
        url: url + "?t=getDataList",
        data: {
           pageIndex: "xdp", 
        },
        dataType: 'json',   
        success: function (data) { 
            $("#DataList").empty();
            $("#DataTemplate").tmpl(data).appendTo("#DataList");
        }
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
                getListByPage(0);
            }else{
                alert('保存失败！');
            }
        }
    });
    }
} 

function goPageDetail(id) {
    window.location.href = "bus_dish_edit.htm?id="+id;
}


