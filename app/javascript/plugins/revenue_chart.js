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
            label: 'Revenue(€)',
            data: perf,
            backgroundColor: '#4BC0C0',
            borderWidth: 2
          },
        ]
      },
      options: {
        labels: {
          fontColor: 'black'
        },
        scales: {
          xAxes: [{
            stacked: true,
            gridLines: {
              display:false
            }
          }],
          yAxes: [{
            stacked: true,
            gridLines: {
              display:false
            }  
          }]
        }
      }
    });
  }
}
export {initRevenueChart};