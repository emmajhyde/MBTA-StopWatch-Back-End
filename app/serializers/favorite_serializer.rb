class StationSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :station
end
