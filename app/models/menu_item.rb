class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :reviews

  validates :item_name, :price, :image_url, presence: true
end
