class PerformancesController < ApplicationController
  def index
    @performances = policy_scope(Performance).order(created_at: :desc)
  end

  def new
    @performance = Performance.new
    authorize @performance
  end

  def create
    @performance = Performance.new(performance_params)
    authorize @performance
      if @performance.save
      redirect_to performances_path
    else
      render :new
    end
    unless  params[:recipes].nil?
      params[:recipes].each do |recipe|
        CustomerConsumption.create(quantity: recipe[:quantity], recipe_id: recipe[:recipe_id],performance_id: @performance.id)
      end
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:customer_number, :server_number, :date)
  end
end
