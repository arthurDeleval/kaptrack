class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.save
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_params)
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroys
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address, :phone_number, :delivery_estimation)
  end
end
