var url = "../../Handler/bus_area.ashx"; 
$(function () {
    getLeftNav();
    getDataList(1);
});
function getDataList(index) {  
    $.ajax({
        type: "post",
        url: url + "?t=getDataList",
        data: {
           key: "xdp", 
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
                getDataList(1);
            }else{
                alert('保存失败！');
            }
        }
    });
    }
} 

function goPageDetail(id) {
    window.location.href = "bus_area_edit.htm?id="+id;
}


