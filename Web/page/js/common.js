function loadingShow() {
    layer.load();
}
function loadingHide() { 
    setTimeout(function () {
        layer.closeAll('loading');
    }, 10);
}