class LotsController < ApplicationController

  def index
    @lots = policy_scope(Lot).order(created_at: :desc)
    # if params[:query].present?
    #   @lots = Lot.global_search(params[:query])
    # end
  end

  def new
    @lot = Lot.new
    authorize @lot
  end

  def create
    @lot = Lot.new(lot_params)
    @product = Product.find(params[:lot][:product_id])
    @supplier = Supplier.find(params[:lot][:supplier_id])
    @lot.product = @product
    @lot.supplier = @supplier
    authorize @lot
    if @lot.save
      redirect_to lots_path
    else
      render :new
    end
  end

  def edit
    @lot = Lot.find(params[:id])
    authorize @lot
  end

  def update
    @lot = Lot.find(params[:id])
    authorize @lot
    if @lot.update(lot_params)
      redirect_to lots_path
    else
      render :edit
    end
  end

  def destroy
    @lot = Lot.find(params[:id])
    authorize @lot
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
