class LotsController < ApplicationController

  def index
    @lots = Lot.all
  end

  def new
    @lot = Lot.new
    @supplier = Supplier.new
    @product = Product.new
  end

  def create
    @lot = Lot.new(lot_params)
    @supplier = Supplier.new(supplier_params)
    @lot.save
  end

  def edit
    @lot = Lot.find(params[:id])
    @supplier = Supplier.find(params[:id])
  end

  def update
    @lot = Lot.find(params[:id])
    @supplier = Supplier.find(params[:id])
    @lot.update(lot_params)
    @supplier.update(supplier_params)
  end

  def destroy
    @lot = Lot.find(params[:id])
    @lot.destroy
  end

  private

  def lot_params
    params.require(:lot).permit(:expiration_date, :cost, :quantity)
  end

  def supplier_params
    params.require(:lot).permit(:name)
  end
end
