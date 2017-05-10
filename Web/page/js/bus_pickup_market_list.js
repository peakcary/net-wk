var url = "../../Handler/bus_pickup_market.ashx";
var listPageSize = 1000;
var pickup_id;
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
    pickup_id = $.getUrlParam('pickup_id');
    getDataList();
    
});




function getDataList() {  
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getDataList",
        data: {
        pickup_id:pickup_id,
           pageIndex: 0,
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
        btn: ['确定', '取消']
    }, function () { 
        $("#DataList tr[id='row_"+id+"']").remove();
        layer.msg('删除成功！');
    }); 
}


function goPageList(id) {
    window.location.href = "bus_pickup_list.htm";
}
function editData() {

    var listData = [];
    $("#DataList tr").each(function (index, item) {
        var refid = $(item).attr("refid");
        var refpid =  $(item).attr("refpid");
        var sort = $(item).find("input").val();
        var d = {};
        d.id = refpid;
        d.market_id = refid;
        d.sort = sort;
        listData.push(d);
    }); 
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: {
            pickup_id:pickup_id,
            listData: JSON.stringify(listData)
        },
        dataType: 'json',
        success: function (data) {
            loadingHide();
            if (data.isSuccess) {
                getDataList();
            } else {
                layer.msg('保存失败！');
            }
        },
        error: function () {
            loadingHide();
        }
    });
}