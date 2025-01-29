class Restaurant < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :menu_items
  has_many :restaurant_tables
  has_many :orders

  validates :restaurant_name, presence: true
  validates :address, presence: true
  validates :contact, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "doesn't match valid format!" }
end
