class StationSerializer < ActiveModel::Serializer
  attributes :id, :name, :url_path
  has_many :users, through: :favorites
end
