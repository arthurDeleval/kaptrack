class PerformancesController < ApplicationController
  def index
    @performances = policy_scope(Performance).order(created_at: :desc)
    @revenue_array = []
    @date_array = []
    Performance.sevendate.each do |performance|
      @revenue_array << performance.revenue.to_i
      @date_array << performance.date
    end
    @margin_array = []
    @margin_rate_array = []
    @date_array = []
    Performance.sevendate.each do |performance|
      @margin_array << performance.global_margin.to_i
      @margin_rate_array << performance.margin_rate.to_i
      @date_array << performance.date
    end
    @average_ticket_array = []
    @date_array = []
    Performance.sevendate.each do|performance|
      @average_ticket_array << performance.average_ticket.to_i
      @date_array << performance.date
    end
    @weekly_revenue = Performance.revenue_week
    @weekly_customer = Performance.customer_week
    @weekly_average_server = Performance.weekly_avrevenue_server
    @weekly_dishes = Performance.top_3_weekdish

  end

  def new
    @performance = Performance.new
    authorize @performance
  end

  def create
    @performance = Performance.find_by(date: params["performance"]["date"])
    if @performance
      @performance.attributes = performance_params
    else
      @performance = Performance.new(performance_params)
    end
    authorize @performance
      if @performance.save
      redirect_to performances_path
    else
      render :new
    end
    unless params[:recipes].nil?
      params[:recipes].each do |recipe|
        CustomerConsumption.create(quantity: recipe[:quantity], recipe_id: recipe[:recipe_id], performance_id: @performance.id)
      end
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:customer_number, :server_number, :date)
  end
end
