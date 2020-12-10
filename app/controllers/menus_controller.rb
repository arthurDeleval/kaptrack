class MenusController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_after_action :verify_authorized

  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end
end
