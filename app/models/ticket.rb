class Ticket < ApplicationRecord
  belongs_to :list

  validates :title, presence: true

  enum status: {
    bug: 10,
    improvement: 20,
    story: 30,
  }
end