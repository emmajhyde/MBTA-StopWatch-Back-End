class StationSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :url_path
  belongs_to :user
end
