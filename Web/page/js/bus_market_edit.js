var url = "../../Handler/bus_market.ashx"; 
var urlUpload = "../Handler/Upload.ashx";
var imageUrlHost = "http://om2v517pk.bkt.clouddn.com/";
var imageListArray = [];
$(function () {
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);

     $('#remark').summernote({ height: 100 });
     $('#description_cn').summernote({ height: 100 });
     $('#description_en').summernote({ height: 100 });
     initPicUpload();
     
    var id = $.getUrlParam('id'); 
    $("#hid").val(id); 
    if(id>0){
        getDataDetail(id); 
    }else{  
        getAreaList(0);
        getPickupList(0);
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
            $("#hid").val(data.id);
            $("#markket_code").val(data.markket_code);
            $("#name_en").val(data.name_en);
            $("#name_cn").val(data.name_cn); 
            $("input[name=status][value="+data.status+"]").attr("checked", 'checked');
            $("#market_type").val(data.market_type); 
//            $("#area_id").val(data.area_id); 
            $("#lon").val(data.lon); 
            $("#lat").val(data.lat); 
//            $("#bus_pickup_id").val(data.bus_pickup_id); 
            $("#address").val(data.address); 
            $("#sort").val(data.sort); 
            $("#remark").code(data.remark);
            $("#description_cn").code(data.description_cn);
            $("#description_en").code(data.description_en);
           
            getAreaList(data.area_id);
            getPickupList(data.pickup_address_id);
            console.log("-----imageList",data.imageList);

        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_market_list.htm";
}

function editData() { 
    loadingShow();  
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            area_id: $("#area_id").val(),
            markket_code: $("#markket_code").val(),
            name_en: $("#name_en").val(),
            name_cn: $("#name_cn").val(),
            status: $('input[type="radio"][name="status"]:checked').val(),
            lon: $("#lon").val(), 
            lat: $("#lat").val(),
            market_type: $("#market_type").val(),
            pickup_address_id: $("#pickup_address_id").val(),
            address: $("#address").val(),
            sort: $("#sort").val(), 
            remark: $("#remark").code(),
            description_cn: $("#description_cn").code(),
            description_en: $("#description_en").code(),
            imageList:JSON.stringify(imageListArray)
        },
        dataType: 'json',   
        success: function (data) { 
            loadingHide();
            if(data.isSuccess){
                goPageList();
            }else{
             layer.msg('保存失败！'); 
            }
        },
        error:function(){
            loadingHide();
        }
    });
}

function getAreaList(id) {   
    $.ajax({
        type: "post",
        url: url + "?t=getAreaList",
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data) {   
            $("#area_id").empty();
            $("#area_id").append("<option value='0'>请选择</option>");
            $("#areaListTemplate").tmpl(data).appendTo("#area_id");   
            $("#area_id").val(id); 
        },
        error:function(){ 
        }
    });
}
 
 function getPickupList(id) {   
    $.ajax({
        type: "post",
        url: url + "?t=getPickupList",
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data){  
            $("#pickup_address_id").empty();
            $("#pickup_address_id").append("<option value='0'>请选择</option>");
            $("#pickupListTemplate").tmpl(data).appendTo("#pickup_address_id");  
            $("#pickup_address_id").val(id); 
        },
        error:function(){ 
        }
    });
}
 

function initPicUpload(){
var uploader = Qiniu.uploader({
                runtimes: 'html5,flash,html4',
                browse_button: 'pickfiles',
                container: 'container',
                drop_element: 'container',
                max_file_size: '1000mb',
                flash_swf_url: '../../../plupload-2.1.9/js/Moxie.swf',
                dragdrop: true,
                chunk_size: '4mb',
                multi_selection: !(mOxie.Env.OS.toLowerCase() === "ios"),
                uptoken_func: function () {
                    var ajax = new XMLHttpRequest();
                    ajax.open('GET', urlUpload, false);
                    ajax.setRequestHeader("If-Modified-Since", "0");
                    ajax.send();
                    if (ajax.status === 200) {
                        return ajax.responseText;
                    } else {
                        console.log('custom uptoken_func err');
                        return '';
                    }
                },
                domain: "om2v517pk.bkt.clouddn.com",
                get_new_uptoken: false,
                auto_start: true,
                log_level: 5,
                init: {
                    'FilesAdded': function (up, files) {
                        $('#success').hide();
//                        console.log("----------FilesAdded", up, file);
                        loadingShow();
                    },
                    'BeforeUpload': function (up, file) {
//                        console.log("----------BeforeUpload", up, file);

                    },
                    'UploadProgress': function (up, file) {
//                        console.log("----------UploadProgress", up, file);

                    },
                    'UploadComplete': function () {
                        loadingHide();
                        $('#success').show();
                    },
                    'FileUploaded': function (up, file, info) {
//                        console.log("----------FileUploaded1", JSON.stringify(up));
//                        console.log("----------FileUploaded2", JSON.stringify(file));
//                        console.log("----------FileUploaded3", JSON.stringify(info));
                        var res = $.parseJSON(info);
                        var imageUrl = imageUrlHost + res.key; 
                        var imageObj = {};
                        imageObj.imageUrl = imageUrl;
                        imageObj.imagePath = file.name;
                        imageObj.imageKey = res.key;
                        imageObj.imageSize = file.size;
                        $("#imageListTemplate").tmpl(imageObj).appendTo("#imageList");  
                        imageListArray.push(imageObj);

                    },
                    'Error': function (up, err, errTip) {
//                        console.log("----------UploadProgress", up, err, errTip); 
                    }
                }
            });
            uploader.bind('FileUploaded', function () {
                console.log('hello man,a file is uploaded');
            });
}
 