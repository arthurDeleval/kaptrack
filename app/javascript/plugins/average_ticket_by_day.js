import Chart from 'chart.js';
Chart.platform.disableCSSInjection = true;

var ctx = document.getElementById('average-ticket');
if(ctx){
  var averageTicketChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      datasets: [
        {
          label: 'point',
          data: [10, 20, 30, 40, 20, 100, 60],
          backgroundColor: 'transparent',
          borderColor: '#34D399',
          pointBackgroundColor: '#F3A4AC',
          pointBorderColor: 'circle',
          pointBorderWidth: 20,
          pointStyle: '#F3A4AC',
          borderWidth: 5
        },
      ]
    }
  });
}
export {averageTicketChart};