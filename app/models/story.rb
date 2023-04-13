class Story < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true, length: { in: 6..60}
  validates :body, presence: true, length: { in: 6..100000}

end
