
class User < ApplicationRecord
  has_many :stories
  has_many :reviews
end
