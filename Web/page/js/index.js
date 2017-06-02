var url = "../../Handler/index.ashx";
var type = 'Date';
var minDays = 7;
$(function () {
    loadingShow();
    getAllDeadlineListAndTime();
    getChartList(type, minDays);
    getListCountByTomorrowEattype(1);
    getListCountByTomorrowEattype(2);
    getListCountByYesterdayCreateUser();
    getListCountByAllUser();
    

    $("#btnChartDate").click(function () {
        type = 'Date';
        getChartList(type, minDays);
    });
    $("#btnChartPerson").click(function () {

        type = 'Person';
        getChartList(type, minDays);
    });
    $("#btnChartPrice").click(function () {

        type = 'Price';
        getChartList(type, minDays);
    });
    $("#btnDate7").click(function () {

        minDays = 7;
        getChartList(type, minDays);
    });
    $("#btnDate30").click(function () {

        minDays = 30;
        getChartList(type, minDays);
    });
    $("#btnDate90").click(function () {

        minDays = 90;
        getChartList(type, minDays);
    });
});

function getListCountByTomorrowEattype(eatType) {
    $.ajax({
        type: "post",
        url: url + "?t=getListCountByTomorrowEattype",
        data: {
            eatType: eatType,
            minDays:1
        },
        dataType: 'json',
        success: function (data) {
            if(eatType==1){
                $('#countTomorrowEatType1').html(data.RecordCount);
            }else if(eatType==2){
                $('#countTomorrowEatType2').html(data.RecordCount);
            }
        }
    });
}
function getListCountByYesterdayCreateUser() {
    $.ajax({
        type: "post",
        url: url + "?t=getListCountByYesterdayCreateUser",
        dataType: 'json',
        success: function (data) {
            $('#countByYesterdayCreateUser').html(data.RecordCount);
         
        }
    });
}
function getListCountByAllUser() {
    $.ajax({
        type: "post",
        url: url + "?t=getListCountByAllUser",
        dataType: 'json',
        success: function (data) {
            $('#countByAllUser').html(data.RecordCount); 
        }
    });
}

function getChartList(type, minDays) {
    var title = '';
    var seriesName = '';
    var yAxisTitle = '';
    var t = "";
    if (type == 'Date') {
        t = 'getDateOrderList';
        seriesName = "订单数";
        yAxisTitle = "订单数";
        title = '最近' + minDays + '天订单数';
        $("#btnChartDate").removeClass("btn-default").addClass("btn-info");
        $("#btnChartPerson").removeClass("btn-info").addClass("btn-default");
        $("#btnChartPrice").removeClass("btn-info").addClass("btn-default");
    } else if (type == 'Person') {
        t = 'getPersonOrderList';
        seriesName = "购买人数";
        yAxisTitle = "购买人数";
        title = '最近' + minDays + '天购买人数'; 
        $("#btnChartDate").removeClass("btn-info").addClass("btn-default");
        $("#btnChartPerson").removeClass("btn-default").addClass("btn-info");
        $("#btnChartPrice").removeClass("btn-info").addClass("btn-default"); 
    } else if (type == 'Price') {
        t = 'getPriceOrderList';
        seriesName = "销售额";
        yAxisTitle = "销售额";
        title = '最近' + minDays + '天销售额';
        $("#btnChartDate").removeClass("btn-info").addClass("btn-default");
        $("#btnChartPerson").removeClass("btn-info").addClass("btn-default");
        $("#btnChartPrice").removeClass("btn-default").addClass("btn-info");
    }
    if (minDays == 7) {
        $("#btnDate7").removeClass("btn-default").addClass("btn-info");
        $("#btnDate30").removeClass("btn-info").addClass("btn-default");
        $("#btnDate90").removeClass("btn-info").addClass("btn-default");
    } else if (minDays == 30) {
        $("#btnDate7").removeClass("btn-info").addClass("btn-default");
        $("#btnDate30").removeClass("btn-default").addClass("btn-info");
        $("#btnChartPrice").removeClass("btn-info").addClass("btn-default");
    } else if (minDays == 90) {
        $("#btnDate7").removeClass("btn-info").addClass("btn-default");
        $("#btnDate30").removeClass("btn-info").addClass("btn-default");
        $("#btnDate90").removeClass("btn-default").addClass("btn-info");
    }
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=" + t,
        data: {
            minDays: minDays
        },
        dataType: 'json',
        success: function (res) {
            loadingHide();

            var xAxisCategories = [];
            var seriesData = [];
            for (var i = 0, l = res.length; i < l; i++) {
                seriesData.push(res[i]['ct']);
                xAxisCategories.push(res[i]['dt']);
            }

            Highcharts.chart('containerChart', {
                title: {
                    text: title
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: xAxisCategories
                },
                yAxis: {
                    title: {
                        text: yAxisTitle
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },


                series: [{
                    name: seriesName,
                    data: seriesData
                }]

            });




        },
        error: function () {
            loadingHide();
        }
    });
}



function getAllDeadlineListAndTime() {
    $.ajax({
        type: "post",
        url: url + "?t=getAllDeadlineListAndTime",
        dataType: 'json',
        success: function (data) {
            console.log(data);
            for (var i = 0, l = data.length; i < l; i++) {
                if (data[i].eat_type == 1) {
                    if (data[i].isDead) {
                        $("#eat_type1").html("已截单");
                    } else {
                        $("#eat_type1").html("截单倒计时：" + data[i].remainTime); 
                    }

                } else if (data[i].eat_type == 2) {
                    if (data[i].isDead) {
                        $("#eat_type2").html("已截单");
                    } else {
                        $("#eat_type2").html("截单倒计时：" + data[i].remainTime);
                    }
                }
            }

        }
    });
}

  


