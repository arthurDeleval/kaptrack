import {incrementBtn} from "./increment_btn"

const displayDish = () => {
  const addBtn = document.querySelector(".btn.btn-primary");
  const recipesElement = document.querySelector(".recipes");
  if (recipesElement){
    
    const recipes = JSON.parse(recipesElement.dataset.recipes);
    const option = recipes.map(recipe => `<option value="${recipe.id}">${recipe.name}</option>`).join()
    let id = 0
      addBtn.addEventListener("click", (event) => {
        id += 1
        const HTML = `
          <div class="form" id="recipe-choice">
            <select name="recipes[][recipe_id]" class="form-control">
              <option value="">select recipe</option>
              ${option}
            </select>
            <input type="hidden" name="recipes[][quantity]" class="form-control${id}" placeholder="quantity">
            <div class="m-3">
              <a class="btn round-bordered incrementer${id} minus" data-offset="-1">-</a>
                <span id="counter${id}" data-count="1">0</span>
              <a class="btn round-bordered incrementer${id}" data-offset="1">+</a>
            </div>
          </div>
          `
        recipesElement.insertAdjacentHTML("beforeend",HTML)
        incrementBtn(id);
        return id
     });
  }
}

export {displayDish}
