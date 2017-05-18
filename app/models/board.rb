class Board < ApplicationRecord
  has_many :lists
  
  has_many :users, through: :members
  has_many :members, dependent: :destroy

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :title, presence: true
end