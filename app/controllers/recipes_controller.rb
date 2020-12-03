class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @products = params[:products]
    if @recipe.save!
      @products.each do |product|
        @product_recipe = ProductRecipe.new
        @product_recipe.recipe_quantity = product[:quantity].to_i
        @product_recipe.product_id = product[:product_id]
        @product_recipe.recipe = @recipe
        @product_recipe.save!
      end
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :specificity, :recipe_description, :meal_description, :preparation_time, :price, :menu_visible)
  end
end
