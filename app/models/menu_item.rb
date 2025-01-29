class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :reviews

  validates :item_name, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
end
