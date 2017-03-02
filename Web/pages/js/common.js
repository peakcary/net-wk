function getLeftNav() {
    $.ajax({
        type: "GET",
        url: "leftnav.json",
        dataType: 'json',
        success: function (data) {
            $("#leftNav").empty();
            $("#leftNavTemplate").tmpl(data).appendTo("#leftNav");
        }
    });
}