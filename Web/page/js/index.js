﻿var url = "../../Handler/index.ashx";
var type = 'Date';
var minDays = 7;
$(function () {
    getChartList(type, minDays);

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

function getChartList(type, minDays) {
    var title = '最近' + minDays + '日订单';
    var seriesName = '';
    var yAxisTitle = '';
    var t = "";
    if (type == 'Date') {
        t = 'getDateOrderList';
        seriesName = "订单数";
        yAxisTitle = "订单数";
        $("#btnChartDate").removeClass("btn-default").addClass("btn-info");
        $("#btnChartPerson").removeClass("btn-info").addClass("btn-default");
        $("#btnChartPrice").removeClass("btn-info").addClass("btn-default");
    } else if (type == 'Person') {
        t = 'getPersonOrderList';
        seriesName = "购买人数";
        yAxisTitle = "购买人数";
        $("#btnChartDate").removeClass("btn-info").addClass("btn-default");
        $("#btnChartPerson").removeClass("btn-default").addClass("btn-info");
        $("#btnChartPrice").removeClass("btn-info").addClass("btn-default"); 
    } else if (type == 'Price') {
        t = 'getPriceOrderList';
        seriesName = "销售额";
        yAxisTitle = "销售额";
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
  


