
const displayRecipeProductLine = () => {
  const addBtn = document.querySelector(".btn.btn-primary");
  const productsElement = document.querySelector(".products");
  if (productsElement){
    const products = JSON.parse(productsElement.dataset.products);
    const option = products.map(product => `<option value="${product.id}">${product.name}</option>`).join()

    addBtn.addEventListener("click", (event) => {
      const HTML = `
        <div class="form-inline">
          <select name="products[][product_id]" class="form-control">
            <option value="">select product</option>
            ${option}
          </select>
          <input type="number" name="products[][quantity]" class="form-control" placeholder="quantity">
        </div>
        `
      productsElement.insertAdjacentHTML("beforeend",HTML)
    });
  }
}

export {displayRecipeProductLine}
