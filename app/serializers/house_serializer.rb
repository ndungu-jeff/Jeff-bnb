class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :location, :description, :price, :owner_id
end
