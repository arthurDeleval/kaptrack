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
      render new
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:customer_number, :date)
  end
end
