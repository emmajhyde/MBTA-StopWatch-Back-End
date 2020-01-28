class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :stations, through: :favorites
end
