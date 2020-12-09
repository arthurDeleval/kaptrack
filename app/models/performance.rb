class Performance < ApplicationRecord
  has_many :customer_consumptions
  has_many :recipes, through: :customer_consumptions, dependent: :destroy
  validates :date, presence: true
  validates :customer_number, presence: true
  validates :server_number, presence: true

  def revenue
    result = 0
    customer_consumptions.each do |cons|
      result += cons.quantity * cons.recipe.price
    end
    result
  end

  def average_ticket
    forks_number = 0
    customer_consumptions.each do |cons|
      forks_number += cons.quantity
    end
    (revenue / forks_number.to_f).round(2)
  end

  def global_margin
    cost_dish_served = 0
    customer_consumptions.each do |cons|
      cost_dish_served += cons.recipe.cost * cons.quantity
    end
    (revenue - cost_dish_served.to_f).round(2)
  end

  def margin_rate
    cost_dish_served = 0
    customer_consumptions.each do |cons|
      cost_dish_served += cons.recipe.cost * cons.quantity
    end
    ((global_margin / cost_dish_served.to_f).round(2) * 100)
  end
  # Taux de marge = (Marge commerciale / Coût) x 100

  def self.get_current_week
    days = ["", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    current_day = Time.now.strftime("%A")
    between_days = days.index(current_day)
    if Performance.find_by(date: Time.now)
      performances = self.order(date: :asc).last(between_days)
    else 
      performances = self.order(date: :asc).last(between_days - 1)
    end
    return performances
  end

  def self.revenue_week
    result = 0
    get_current_week.each do |performance|
      result += performance.revenue
    end
    return result
  end

  def self.customer_week
    result = 0
    get_current_week.each do |performance|
      result += performance.customer_number.to_i
    end
    return result
  end

  def self.server_week
    result = 0
    get_current_week.each do |performance|
      result += performance.server_number.to_i
    end
    return result
  end

  def self.weekly_avrevenue_server
    (revenue_week / server_week.to_f).round(2)
  end

  def top_dish_sold
    customer_consumptions.order(quantity: :desc).take(3)
  end

  def self.top_3_weekdish_name
    result = Hash.new(0)
    get_current_week.each do |performance|
      performance.customer_consumptions.each do |customer_consumption|
        result[customer_consumption.recipe.name] += customer_consumption.quantity
      end
    end
    result = result.sort_by { |_, v| -v }.first(3).to_h
    return result
  end

  def self.sevendate
    self.order(date: :asc).last(7)
  end

end
