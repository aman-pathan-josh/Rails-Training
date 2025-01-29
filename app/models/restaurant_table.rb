class RestaurantTable < ApplicationRecord
  belongs_to :restaurant
  has_one :order

  validates :qr_code_url, presence: true
end
