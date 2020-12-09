import Chart from 'chart.js';
Chart.platform.disableCSSInjection = true;

const initAverageTicketChart = () => {
  var ctx = document.getElementById('average-ticket');
  if(ctx){
    const averageTicket = JSON.parse(ctx.dataset.averageticket)
    const date = JSON.parse(ctx.dataset.date)

    new Chart(ctx, {
      type: 'line',
      data: {
        labels: date,
        datasets: [
          {
            label: 'Average ticket',
            data: averageTicket,
            backgroundColor: '#34D399',
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
}
export {initAverageTicketChart};