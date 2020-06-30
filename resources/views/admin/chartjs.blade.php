<canvas id="myChart1" width="200" height="50"></canvas>
<script>
    $(function () {
        var ctx = document.getElementById("myChart1").getContext('2d');
        $.get('/admin/getData', function (res) {
            var myChart = new Chart(ctx, {
                type: 'bar',
                pointDot : false,
                data: {
                    labels: res.day,
                    datasets: [{
                        label: '指数折线图',
                        type: "line",
                        data: res.value,
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
            });
        })

    });
</script>