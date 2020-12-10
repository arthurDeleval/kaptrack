class MenusController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
    @recipes = Recipe.global_search(params[:query]) if params[:query].present?
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end
end
