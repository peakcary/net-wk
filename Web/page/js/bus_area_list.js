var url = "../../Handler/bus_area.ashx"; 
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

            var option = {
                theme:'vsStyle',
                expandLevel : 2,
                beforeExpand : function($treeTable, id) {
                    
                },
                onSelect : function($treeTable, id) {
                    window.console && console.log('onSelect:' + id); 
                }

            };
            $('#tbData').treeTable(option);

           
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
    window.location.href = "bus_area_edit.htm?id="+id;
}


