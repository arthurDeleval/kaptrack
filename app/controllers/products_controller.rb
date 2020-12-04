class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.save
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    authorize @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    authorize @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :measure_unit)
  end
end
