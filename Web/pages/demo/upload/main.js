/*global Qiniu */
/*global plupload */
/*global FileProgress */
/*global hljs */


$(function () {
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
        uptoken: "pfbSmizd7FGjdPqJ4l9jbvXDNgegvB3gZ2FqyPpI:B3k8oiJQ81hYZV_VDgmUaZNEUr4=:eyJzY29wZSI6ImJ1c2ltYWdlcyIsImRlYWRsaW5lIjoxNDg4MzczNjQ5fQ==",
        domain: "om2v517pk.bkt.clouddn.com",
        get_new_uptoken: false,
        auto_start: true,
        log_level: 5,
        init: {
            'FilesAdded': function (up, files) { 
                $('#success').hide();
                console.log("----------FilesAdded", up, file);
                
            },
            'BeforeUpload': function (up, file) {
                console.log("----------BeforeUpload", up, file);
                
            },
            'UploadProgress': function (up, file) {
                console.log("----------UploadProgress", up, file);
                
            },
            'UploadComplete': function () {
                $('#success').show();
            },
            'FileUploaded': function (up, file, info) {
                console.log("----------FileUploaded1", JSON.stringify(up));
                console.log("----------FileUploaded2",   JSON.stringify(file) );
                console.log("----------FileUploaded3",   JSON.stringify(info));
               
            },
            'Error': function (up, err, errTip) {
                console.log("----------UploadProgress", up, err, errTip);
               
            }
        }
    });

    uploader.bind('FileUploaded', function () {
        console.log('hello man,a file is uploaded');
    });

});
