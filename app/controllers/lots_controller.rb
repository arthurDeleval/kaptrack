class LotsController < ApplicationController

  def index
    @lots = Lot.all
  end

  def new
    @lot = Lot.new
  end

  def create
    @lot = Lot.new(lot_params)
    @product = Product.find(params[:lot][:product_id])
    @supplier = Supplier.find(params[:lot][:supplier_id])
    @lot.product = @product
    @lot.supplier = @supplier
    if @lot.save
      redirect_to lots_path
    else
      render :new
    end
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  def update
    @lot = Lot.find(params[:id])
    if @lot.update(lot_params)
      redirect_to lots_path
    else
      render :edit
    end
  end

  def destroy
    @lot = Lot.find(params[:id])
    @lot.destroy
  end

  private

  def lot_params
    params.require(:lot).permit(:expiration_date, :cost, :quantity, :photo)
  end

  def supplier_params
    params.require(:lot).permit(:name)
  end
end
