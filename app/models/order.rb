class Order < ApplicationRecord
  belongs_to :restaurant_table
  belongs_to :restaurant
  belongs_to :user
  has_many :order_carts

  validates :order_amount, presence: true
end
