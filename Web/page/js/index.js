var url = "../../Handler/index.ashx";
$(function () { 
    getDateOrderList(); 
});

function getDateOrderList() {  
    loadingShow();
    $.ajax({
        type: "post",
        url: url + "?t=getDateOrderList",
        data: {
            minDays: 30
        },
        dataType: 'json',
        success: function (res) {
            loadingHide();

            var title = '最近30日订单';
            var seriesName = '订单数';
            var yAxisTitle = '订单数';
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
  


