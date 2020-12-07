class SuppliersController < ApplicationController

  def index
    @suppliers = policy_scope(Supplier).order(created_at: :desc)
  end

  def new
    @supplier = Supplier.new
    authorize @supplier
  end

  def create
    @supplier = Supplier.new(supplier_params)
    authorize @supplier
    if @supplier.save
      redirect_to suppliers_path
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    authorize @supplier
  end

  def update
    @supplier = Supplier.find(params[:id])
    authorize @supplier
    if @supplier.update(supplier_params)
      redirect_to suppliers_path
    else
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    authorize @supplier
    @supplier.destroy
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address, :phone_number, :delivery_estimation,:photo)
  end
end
