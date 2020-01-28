class Favorite < ApplicationRecord
  attr_accessor :description

  belongs_to :user
  belongs_to :station
end
