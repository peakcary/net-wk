var url = "../../Handler/bus_market.ashx"; 
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
    initAutoArea();
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
            $("#markket_code").val(data.markket_code);
            $("#name_en").val(data.name_en);
            $("#name_cn").val(data.name_cn);
            $("#market_type").val(data.market_type);
            $("#area_id").val(data.area_id);
            $("#lon").val(data.lon);
            $("#lat").val(data.lat);
            $("#address").val(data.address);
            $("#description_en").val(data.description_en);
            $("#description_cn").val(data.description_cn);
            $("#status").val(data.status);
            $("#sort").val(data.sort);
            $("#remark").val(data.remark); 
        }
    });
} 

function goPageList() {
    window.location.href = "bus_market_list.htm";
}

function editData() {   
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            markket_code: $("#markket_code").val(),
            name_en: $("#name_en").val(),
            name_cn: $("#name_cn").val(),
            market_type: $("#market_type").val(),
            area_id: $("#area_id").val(),
            lat: $("#lat").val(),
            lon: $("#lon").val(),
            address: $("#address").val(),
            description_en: $("#description_en").val(),
            description_cn: $("#description_cn").val(),
            status: $("#status").val(),
            sort: $("#sort").val(),
            remark: $("#remark").val()
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

function initAutoArea(){  
    $.ajax({
            type: "post",
            url: url + "?t=getDataAreaList", 
            dataType: 'json',  
            success: function (data) {  
                    $('#autoArea').devbridgeAutocomplete({
                        lookup: data,
                        minChars: 0,
                        onSelect: function (suggestion) {
                            console.log('You selected: ' + suggestion.value + ', ' + suggestion.data);
                        }, 
                        onHint: function (hint) {
                            console.log('hint'+hint);
                        },
                        onInvalidateSelection: function() {
                            console.log('You selected: none');
                        },
                        showNoSuggestionNotice: true,
                        noSuggestionNotice: 'Sorry, no matching results'
                    });
            }
        });
}