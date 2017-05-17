
var userid = 0;

$(function () {

    var loginId = "";

    if (window.sessionStorage) {
        loginId = sessionStorage.getItem('loginId');
        loginName = sessionStorage.getItem('loginName');
    }

    $("#userInfo").html(loginName);

    if (loginId == null && location.href.indexOf("login.htm") < 0) {
        window.location.href = "login.htm?re=" + location.href;
        $("#loginState").html("登录");
    } else {
        $("#loginState").html("注销");
    }
    $("#loginState").on("click", function () {
        if (window.sessionStorage) {
            loginId = sessionStorage.removeItem('loginId');
            loginName = sessionStorage.removeItem('loginName');
        }
        window.location.href = "login.htm?re=" + location.href;
    });
});

function loadingShow() {
    layer.load();
}
function loadingHide() {
    setTimeout(function () {
        layer.closeAll('loading');
    }, 10);
}
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

function bytesToSize(bytes) {
    if (bytes === 0) return '0 B';
    var k = 1024, // or 1024
        sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = Math.floor(Math.log(bytes) / Math.log(k));
    return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
}

function bytesToSizeNo(bytes) {
    if (bytes === 0) return '0';
    var k = 1024,
        i = Math.floor(Math.log(bytes) / Math.log(k));
    return (bytes / Math.pow(k, i)).toPrecision(3);
}