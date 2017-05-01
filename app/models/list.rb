class List < ApplicationRecord
  belongs_to :board
  
  validates :title, presence: true
end