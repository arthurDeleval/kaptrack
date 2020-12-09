import Chart from 'chart.js';
Chart.platform.disableCSSInjection = true;

const initMarginChart = () => {
  var ctx = document.getElementById('margins');
  if(ctx){
    const globalMargin = JSON.parse(ctx.dataset.globalmargin)
    const rateMargin = JSON.parse(ctx.dataset.ratemargin)
    const date = JSON.parse(ctx.dataset.date)
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: date,
        datasets: [{
          label: 'Global margin',
          data: globalMargin,
          order: 2,
          backgroundColor: 'rgba(263, 164, 172, .7)',
          borderWidth: 0
        }, {
          label: 'Margin Rate (%)',
          data: rateMargin,
          order: 1,
          backgroundColor: 'transparent',
          borderWidth: 5,
          borderColor: 'rgba(35, 212, 214, .5)',
          type: 'line'
        }],
      },
    });
  }
}
export {initMarginChart};