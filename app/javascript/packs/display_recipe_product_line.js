
const displayRecipeProductLine = () => {
  const addBtn = document.querySelector(".btn-grey");
  const productsElement = document.querySelector(".products");
  if (productsElement){
    const products = JSON.parse(productsElement.dataset.products);
    const option = products.map(product => `<option value="${product.id}">${product.name}</option>`).join()
    console.log(products)
    addBtn.addEventListener("click", (event) => {
      const HTML = `
        <div class="form-inline">
          <select name="products[][product_id]" class="form-control">
            <option value="">select product</option>
            ${option}
          </select>
          <input type="number" name="products[][quantity]" class="form-control" placeholder="quantity">
          <input type="text" name="product_recipes[][unit]" class="form-control" placeholder="recipe unit">
          <div></div>
        </div>
        `
      productsElement.insertAdjacentHTML("beforeend",HTML)
    });
  }
}

export {displayRecipeProductLine}
