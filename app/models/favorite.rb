class Favorite < ApplicationRecord
  attr_accessor :description
  # this is a JOIN MODEL
  # essentially, creates a join table when migration is generated
  # if you forget about joins:
  # https://www.sql-join.com/

  belongs_to :user
  belongs_to :station
end
