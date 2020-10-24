class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  def total_price
    return 0 if plant.price_per_day.nil? || end_date.nil? || start_date.nil?
    (end_date - start_date).to_i * plant.price_per_day
  end
end
