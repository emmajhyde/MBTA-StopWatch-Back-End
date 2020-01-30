# frozen_string_literal: true

class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :station
end
