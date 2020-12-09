import Chart from 'chart.js';
Chart.platform.disableCSSInjection = true;

var ctx = document.getElementById('margins');
if(ctx){
  var marginsChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
        datasets: [{
            label: 'Bar',
            data: [10, 20, 30, 40, 20, 100, 60],
            order: 2,
            backgroundColor: 'rgba(35, 212, 214, .5)',
            borderWidth: 0
        }, {
            label: 'Line',
            data: [50, 60, 90, 70, 25, 50, 47],
            order: 1,
            backgroundColor: 'transparent',
            borderWidth: 5,
            borderColor: 'rgba(263, 164, 172, .7)',
            type: 'line'
        }],
        
    },
  });
}
export {marginsChart};