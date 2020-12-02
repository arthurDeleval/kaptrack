class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroys
  end

  private

  def product_params
    params.require(:product).permit(:name, :measure_unit)
  end
end
