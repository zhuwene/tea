<canvas id="doughnut" width="200" height="50"></canvas>
<script>
$(function () {
var labels=new Array()
var value=new Array()
@foreach ($indexData['labels'] as $labels)
    labels.push('{{ $labels }}')
@endforeach
console.log(labels)
@foreach ($indexData['value'] as $value)
    value.push('{{ $value }}')
@endforeach
console.log(value)
var config = {
    type: 'bar',
    pointDot : false,
    data: {
        labels:labels,
        datasets: [{
            label: '指数折线图',
            type: "line",
            data:  value,
            backgroundColor:'rgba(54, 162, 235, 0.1)',
            borderColor:'rgba(255,99,132,1)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
};

    var ctx = document.getElementById('doughnut').getContext('2d');
    new Chart(ctx, config);
});
</script>