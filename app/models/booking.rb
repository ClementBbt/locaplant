class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  def total_price
    (end_date - start_date) * plant.price_per_day
  end
end
