
const displayDish = () => {
  const addBtn = document.querySelector(".btn.btn-primary");
  const recipesElement = document.querySelector(".recipes");
  if (recipesElement){
    
    const recipes = JSON.parse(recipesElement.dataset.recipes);
    const option = recipes.map(recipe => `<option value="${recipe.id}">${recipe.name}</option>`).join()

      addBtn.addEventListener("click", (event) => { 
        const HTML = `
          <div class="form" id="recipe-choice">
            <select name="recipes[][recipe_id]" class="form-control">
              <option value="">select recipe</option>
              ${option}
            </select>
            <input type="number" name="recipes[][quantity]" class="form-control" placeholder="quantity">
          </div>
          `
        recipesElement.insertAdjacentHTML("beforeend",HTML)
     });
  }
}

export {displayDish}
