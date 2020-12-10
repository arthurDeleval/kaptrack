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
            label: 'Average ticket(€)',
            data: averageTicket,
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

    // new Chart(ctx, {
    //   type: 'line',
    //   data: {
    //     labels: date,
    //     datasets: [
    //       {
    //         label: 'Average ticket',
    //         data: averageTicket,
    //         backgroundColor: '#34D399',
    //         borderColor: '#34D399',
    //         pointBackgroundColor: '#F3A4AC',
    //         pointBorderColor: 'rgba(263, 164, 172, .7)',
    //         pointBorderStyle: 'circle',
    //         pointBorderWidth: 2,
    //         pointStyle: '#F3A4AC',
    //         borderWidth: 5
    //       },
    //     ]
    //   },
    //   options: {
    //     labels: {
    //       fontColor: 'black'
    //     },
    //     scales: {
    //       xAxes: [{
    //         gridLines: {
    //           display:false
    //         }
    //       }],
    //       yAxes: [{
    //         gridLines: {
    //           display:false
    //         }  
    //       }]
    //     }
    //   }
    // });
  }
}
export {initAverageTicketChart};