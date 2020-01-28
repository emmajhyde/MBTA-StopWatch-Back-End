# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :favorites
  has_many :stations, through: :favorites
end
