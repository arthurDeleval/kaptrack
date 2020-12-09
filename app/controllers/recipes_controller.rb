class RecipesController < ApplicationController

  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
    @recipes = Recipe.global_search(params[:query]) if params[:query].present?
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe
    @recipe.user = current_user
    @products = params[:products]
    if @recipe.save!
      @products.each do |product|
        @product_recipe = ProductRecipe.new
        @product_recipe.recipe_quantity = product[:quantity].to_i
        @product_recipe.unit = params[:product_recipes][0][:unit]
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
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @products = params[:products]
    unless @products.nil?
      @products.each do |product|
        @product_recipe = ProductRecipe.find_by(recipe: @recipe, product_id: product[:product_id])
          unless @product_recipe
            @product_recipe = ProductRecipe.new
          end
          @product_recipe.recipe_quantity = product[:quantity].to_i
          @product_recipe.unit = params[:product_recipes][0][:unit]
          @product_recipe.product_id = product[:product_id]
          @product_recipe.recipe = @recipe
          @product_recipe.save!
      end
    end
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :specificity, :recipe_description, :meal_description, :preparation_time, :price, :menu_visible, :photo, :cost)
  end
end
