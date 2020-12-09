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
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    authorize @product
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :measure_unit, :photo)
  end
end
