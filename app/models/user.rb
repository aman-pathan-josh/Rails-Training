class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants, dependent: :destroy
  has_many :reviews

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/, message: "doesn't match valid format!" }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "doesn't match valid format!" }
end
