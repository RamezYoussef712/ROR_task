class Story < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true, length: { in: 6..40}
  validates :body, presence: true, length: { minimum: 10}

end
