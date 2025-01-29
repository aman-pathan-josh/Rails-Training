class Review < ApplicationRecord
  belongs_to :menu_item

  validates :rating, presence: true
  validates :comment, presence: true
end
