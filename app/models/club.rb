class Club < ActiveRecord::Base
  belongs_to :golfer
  has_many :distances
end
