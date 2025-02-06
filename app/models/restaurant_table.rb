class RestaurantTable < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  validates :qr_code_url, presence: true
end
