class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :congestions, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :exhibitions, through: :clips

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, uniqueness: true

  def active_for_authentication?
    super && self.status == "Active"
  end
end
