class User < ApplicationRecord
  has_secure_password

  has_many :boards, through: :members, dependent: :destroy
  has_many :members, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
end