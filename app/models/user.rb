class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants, dependent: :destroy
  has_many :reviews

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/, message: "doesn't match valid format!" }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "doesn't match valid format!" }

  after_create :assign_role

  private
  def assign_role
    customer_role = Role.find_or_create_by(role: "customer")
    self.roles << customer_role
  end
end
