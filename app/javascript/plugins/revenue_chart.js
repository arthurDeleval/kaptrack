import Chart from 'chart.js';
Chart.platform.disableCSSInjection = true;

var ctx = document.getElementById('revenue');
if(ctx){
  const perf = JSON.parse(ctx.dataset.performances)

  const date = ctx.dataset.date

  var revenueFunction = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      datasets: [
        {
          label: 'Revenue',
          data: perf,
          backgroundColor: '#D6E9C6',
          borderColor: '#D6E9C6',
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

export {revenueFunction};