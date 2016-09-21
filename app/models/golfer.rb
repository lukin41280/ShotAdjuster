class Golfer < ActiveRecord::Base
  has_many :clubs
  has_many :distances, through: :clubs
end
