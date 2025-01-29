class Order < ApplicationRecord
  belongs_to :restaurant_table
  belongs_to :restaurant
  belongs_to :user

  validates :order_amount, presence: true
end
