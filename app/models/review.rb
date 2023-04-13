class Review < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :rate, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :comment, presence: true, length: { minimum: 10}
end
