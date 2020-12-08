class Performance < ApplicationRecord
  has_many :customer_consumptions
  has_many :recipes, through: :customer_consumptions
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

  def average_revenue_by_server
    (revenue / server_number.to_f).round(2)
  end

  def top_dish_sold
    number_dish_served = 0
    customer_consumptions.each do |cons|
      number_dish_served += cons.quantity
      dish_name = cons.recipe.name
    end
    dish_name.sort_by(number_dish_served).max(3)
  end
end
