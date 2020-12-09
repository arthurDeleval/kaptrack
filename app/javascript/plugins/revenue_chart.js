import Chart from 'chart.js';
Chart.platform.disableCSSInjection = true;

const initRevenueChart = () => {
  var ctx = document.getElementById('revenue');
  if(ctx){
    const perf = JSON.parse(ctx.dataset.performances)
    const date = JSON.parse(ctx.dataset.date)

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: date,
        datasets: [
          {
            label: 'Revenue',
            data: perf,
            backgroundColor: '#F8C3A7',
            borderColor: '#F8C3A7',
            borderWidth: 1
          },
        ]
      },
      options: {
        scales: {
          xAxes: [{
            stacked: true
          }],
          yAxes: [{
            stacked: true
          }]
        }
      }
    });
  }
}
export {initRevenueChart};