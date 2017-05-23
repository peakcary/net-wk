var url = "../../Handler/bus_market.ashx"; 
var urlUpload = "../Handler/Upload.ashx";
var imageUrlHost = "http://olamk7iwq.bkt.gdipper.com/";


var pickupAddressIds="";
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
            $("#market_code").val(data.market_code);
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
            getPickupList(data.pickup_address_ids);
            //console.log("-----imageList",data.imageList);
            var imageObjArray = [];
            var imageArray = data.imageList.split(";");
            var imageArrayLength = imageArray.length;
             
            if(imageArrayLength>0){
                for(var i=0;i<imageArrayLength;i++){
                    if(imageArray[i]!=""){
                        var imagePath= imageArray[i].split("||")[0];
                        var imageUrl = imageUrlHost + imagePath; 
                        var imageObj = {};
                        imageObj.imagePath = imagePath;
                        imageObj.imageUrl = imageUrl;  
                        imageObjArray.push(imageObj); 
                    } 
                }
            } 
            $("#imageListTemplate").tmpl(imageObjArray).appendTo("#imageList");  
            //console.log("------imageArray",imageArray); 
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
    var imageListArray = []; 
    $("#imageList").find("img").each(function(){
            var imageObj = {};  
            imageObj.imageKey = $(this).attr("ref");
            imageListArray.push(imageObj);  
    });
    $.ajax({
        type: "post",
        url: url + "?t=editData",
        data: { 
            id: $("#hid").val(),
            area_id: $("#area_id").val(),
            market_code: $("#market_code").val(),
            name_en: $("#name_en").val(),
            name_cn: $("#name_cn").val(),
            status: $('input[type="radio"][name="status"]:checked').val(),
            lon: $("#lon").val(), 
            lat: $("#lat").val(),
            market_type: $("#market_type").val(),
            //pickup_address_id: $("#pickup_address_id").val(),
            pickup_address_id: pickupAddressIds,
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
 
 function getPickupList(ids) {   
    $.ajax({
        type: "post",
        url: url + "?t=getPickupList",
        data: {
           pageIndex: 0,
           pageSize: 100 
        },
        dataType: 'json',   
        success: function (data){  
                if(ids!=null&&ids!=""){
                    var aids = ids.split(',');
                    $.each(data, function(j, n){  
                        for(var i=0,l=aids.length;i<l;i++){
                            if(aids[i]==data[j].data){
                             data[j].s = true;
                            }
                        }
                    }); 
                }


            $("#pickup_address_id").empty();
            //$("#pickup_address_id").append("<option value='0'>请选择</option>");
            $("#pickupListTemplate").tmpl(data).appendTo("#pickup_address_id");  
            
            
           
            
            


            //$("#pickup_address_id").val(id); 


             $("#pickup_address_id").multiselect({
                click: function(event, ui){
			        console.log(ui.value + ' ' + (ui.checked ? 'checked' : 'unchecked') );
		        },
               selectedText: function(numChecked, numTotal, checkedItems){
                    pickupAddressIds="";
                    for(var i=0,l= checkedItems.length;i<l;i++){
                    console.log($(checkedItems[i]).attr('value'));
                     pickupAddressIds+=$(checkedItems[i]).attr('value')+","; 
                    } 
               }
            });
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
                max_file_size: '200k',
                flash_swf_url: '../../../plupload-2.1.9/js/Moxie.swf',
                dragdrop: true,
                chunk_size: '200k',
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
                domain: "olamk7iwq.bkt.gdipper.com",
                get_new_uptoken: false,
                auto_start: true,
                log_level: 0,
                init: {
                    'FilesAdded': function (up, files) {
                        $('#success').hide();
//                        console.log("----------FilesAdded", up, file);
                        loadingShow();
                    },
                    'BeforeUpload': function (up, file) {
//                        console.log("----------BeforeUpload", up, file);
//            alert(file.size); 
//            uploader.stop();

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
                    },
                    'Error': function (up, err, errTip) {
//                        console.log("----------UploadProgress", up, err, errTip); 
                        layer.msg(errTip);
                    }
                }
            });
            uploader.bind('FileUploaded', function () {
                console.log('hello man,a file is uploaded');
            });
}
 