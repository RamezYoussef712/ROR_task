class Story < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true, length: { in: 6..40 }
  validates :body, presence: true, length: { minimum: 10 }

  scope :top_stories, -> { joins(:reviews).group(:id).order('AVG(reviews.rate) DESC ') }
end
