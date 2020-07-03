<!-- 引入 ECharts 文件 -->
<script src="echarts.min.js"></script>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 100%;height:400px;"></div>
<script>
$(function () {
var labels=new Array()
var value=new Array()
@foreach ($indexData['labels'] as $labels)
    labels.push('{{ $labels }}')
@endforeach
@foreach ($indexData['value'] as $value)
    value.push('{{ $value }}')
@endforeach
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
var option = {
    title: {
        // text: '堆叠区域图'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data: ['大盘指数']
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: [
        {
            type: 'category',
            boundaryGap: false,
            data: labels
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series: [
        {
            name: '大盘指数',
            type: 'line',
            stack: '总量',
            areaStyle: {},
            data: value
        }
    ]
};


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

});
</script>