﻿var url = "../../Handler/bus_dish.ashx"; 
var urlUpload = "../Handler/Upload.ashx";
var imageUrlHost = "http://wkps.tedxiong.com/";

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
    var market_id = $.getUrlParam('market_id'); 

    $("#hid").val(id); 
    $("#market_id").val(market_id); 
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
            $("#market_id").val(data.market_id); 
            $("#discount_price").val(data.discount_price); 
            $("#dish_tag").val(data.dish_tag); 
            $("input[name=dish_time][value="+data.dish_time+"]").attr("checked", 'checked');
            $("input[name=eat_type][value="+data.eat_type+"]").attr("checked", 'checked');
            $("#name_cn").val(data.name_cn); 
            $("#name_en").val(data.name_en); 
            $("#original_price").val(data.original_price);  
            $("#sales_total").val(data.sales_total); 
            $("#sort").val(data.sort);
            $("input[name=status][value="+data.status+"]").attr("checked", 'checked');
            $("#remark").code(data.remark);
            $("#description_cn").code(data.description_cn);
            $("#description_en").code(data.description_en); 
            $("#imageList").empty();
            $("#imageListTemplate").tmpl(data.listImage).appendTo("#imageList");  
            $("#dtSizeList").empty();
            $("#dtSizeListTmpl").tmpl(data.listSize).appendTo("#dtSizeList");
            console.log("-----data.listSize",data.listSize);
        },
        error:function(){
            loadingHide();
        }
    });
} 

function goPageList() {
    window.location.href = "bus_dish_list.htm?market_id="+$("#market_id").val(); 
}

function editData(isToList) {  
    loadingShow();  
    var listImage = []; 
    $("#imageList").find("img").each(function(){
            var imageObj = {};  
            imageObj.url = $(this).attr("ref");
            listImage.push(imageObj);  
    });
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            market_id: $("#market_id").val(),
            discount_price: $("#discount_price").val(),
            dish_tag: $("#dish_tag").val(),
            name_en: $("#name_en").val(),
            name_cn: $("#name_cn").val(),
            dish_time: $('input[type="radio"][name="dish_time"]:checked').val(),
            eat_type: $('input[type="radio"][name="eat_type"]:checked').val(),
            status: $('input[type="radio"][name="status"]:checked').val(),
            original_price: $("#original_price").val(), 
            sales_total: $("#sales_total").val(), 
            sort: $("#sort").val(),  
            remark: $("#remark").code(),
            description_cn: $("#description_cn").code(),
            description_en: $("#description_en").code(), 
            listImage:JSON.stringify(listImage)
        },
        dataType: 'json',   
        success: function (data) { 
            loadingHide();
            if(data.isSuccess){
                if(isToList){
                    goPageList();
                }else{ 
                $("#hid").val(data.id);
                    $.ajax({
                        type: "post",
                        url: url + "?t=addDishSize",
                        data: { 
                            dish_id: $("#hid").val(),
                            name: $("#name").val(),
                            affect_price: $("#affect_price").val()
                        },
                        dataType: 'json',   
                        success: function (data) { 
                            loadingHide();
                            if(data.isSuccess){
                                layer.msg('保存成功！'); 
                                window.location.href = "bus_dish_edit.htm?id="+$("#hid").val(); 
                            }else{
                             layer.msg('保存失败！'); 
                            }
                        },
                        error:function(){
                            loadingHide();
                        }
                    });
                } 
                
            }else{
             layer.msg('保存失败！'); 
            }
        },
        error:function(){
            loadingHide();
        }
    });
}

 
function opeanAddDishSizeContainer(){
    layer.open({
      type: 1,
      area: ['600px', '220px'],
      title:" 菜品规格",
      scrollbar:false,
      btn: ['确定', '取消'],
      yes: function(index, layero){
          layer.close(index); 
          addDishSize();
      },btn2: function(index, layero){ 
      },
      content:$("#addDishSizeContainer")
    });
}

function addDishSize() {  
    loadingShow(); 
    if($("#hid").val()==""){
        editData(false);
    } else{ 
        $.ajax({
            type: "post",
            url: url + "?t=addDishSize",
            data: { 
                dish_id: $("#hid").val(),
                name: $("#name").val(),
                affect_price: $("#affect_price").val()
            },
            dataType: 'json',   
            success: function (data) { 
                loadingHide();
                if(data.isSuccess){
                    getDishSize();
                }else{
                 layer.msg('保存失败！'); 
                }
            },
            error:function(){
                loadingHide();
            }
        });
    }
}
function getDishSize() {  
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getDishSize",
        data: {
           dish_id:$("#hid").val()
        },
        dataType: 'json',   
        success: function (data) { 
            loadingHide();
            $("#dtSizeList").empty();
            $("#dtSizeListTmpl").tmpl(data).appendTo("#dtSizeList");  
        },
        error:function(){
            loadingHide();
        }
    });
}

function deleteDishSize(id){
 layer.confirm('确定删除吗？', {
      btn: ['确定','取消']
    }, function(){ 
        $.ajax({
            type: "post",
            url: url + "?t=deleteDishSize",
            data: { 
                id: id
            },
            dataType: 'json',   
            success: function (data) { 
                if(data.isSuccess){
                    layer.msg('删除成功！');
                        getDishSize();
                    }else{
                        layer.msg('删除失败！');
                    }
                }
        });
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

function deleteImage(e){
$(e).parent().parent().remove();
}
 

function initPicUpload(){
var uploader = Qiniu.uploader({
                runtimes: 'html5,flash,html4',
                browse_button: 'pickfiles',
                container: 'container',
                drop_element: 'container',
                max_file_size: '50k',
                flash_swf_url: '../../../plupload-2.1.9/js/Moxie.swf',
                dragdrop: true,
                chunk_size: '50k',
                 unique_names: false,
                save_key: false,
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
                domain: "wkps.tedxiong.com",
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
                        console.log("----------FileUploaded1", JSON.stringify(up));
                        console.log("----------FileUploaded2", JSON.stringify(file));
                        console.log("----------FileUploaded3", JSON.stringify(info));
                        var res = $.parseJSON(info);
                        var imageName =res.hash+ res.key.substr(res.key.lastIndexOf('.')); 

                        var imageUrl = imageUrlHost + res.key; 
                        var imageObj = {};
                        imageObj.imageUrl = imageUrl; 
                        imageObj.url = res.key; 
                        $("#imageListTemplate").tmpl(imageObj).appendTo("#imageList"); 
                    },
                    'Error': function (up, err, errTip) {
                        console.log("----------Error", up, err, errTip); 
                        layer.msg(errTip);
                    },
                    'Key': function(up, file) {
                        
                        // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                        // 该配置必须要在unique_names: false，save_key: false时才生效
//                         var d = Date.Now();  
//                        var dd = d.getDate() < 10 ? "0" + d.getDate() : d.getDate().toString();  
//                        var mmm = mths[d.getMonth()];  
//                        var yyyy = d.getFullYear().toString(); //2011  
                            //var YY = YYYY.substr(2);   // 11  
                        //return dd + mmm + yyyy;  
                        var date = Date.now();
                        var key=date+ file.name.substring(file.name.lastIndexOf('.'));;
                        // do something with key here
                        return key
                    }
                }
            });
            uploader.bind('FileUploaded', function () {
                console.log('hello man,a file is uploaded');
            });
}
 