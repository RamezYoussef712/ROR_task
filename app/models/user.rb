
class User < ApplicationRecord
  has_many :stories
  has_many :reviews

  validates :username, presence: true
end
