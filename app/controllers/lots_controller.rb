class LotsController < ApplicationController

  def index
    @lots = Lot.all
  end

  def new
    @lot = Lot.new
  end

  def create
    @lot = Lot.new(lot_params)
    @lot.save
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  def update
    @lot = Lot.find(params[:id])
    @lot.update(lot_params)
  end

  def destroy
    @lot = Lot.find(params[:id])
    @lot.destroy
  end

  private

  def lot_params
    params.require(:lot).permit(:expiration_date, :cost, :quantity)
  end
end
