const incrementBtn = (id) => {
  let btns = `.incrementer${id}`
  let counterId = `#counter${id}`
  let quant = `.form-control${id}`
  const btn = document.querySelectorAll(btns);
  let sum = 0;
  btn.forEach((button) => {
  const counter = document.querySelector(counterId);
  const recipeQuantity = document.querySelector(quant);
  button.addEventListener("click", (event) => {
    const nb = button.dataset.offset;
    if (nb == -1 && sum == 0) {
      sum = 0
      counter.innerText = sum;
      recipeQuantity.value = sum;
      return sum
    }
      sum += parseInt(nb, 10);
      counter.innerText = sum;
      recipeQuantity.value = sum;
  });
  return sum;
});
}
export {incrementBtn};