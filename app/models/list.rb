class List < ApplicationRecord
  belongs_to :board
  has_many :tickets
  
  validates :title, presence: true
end