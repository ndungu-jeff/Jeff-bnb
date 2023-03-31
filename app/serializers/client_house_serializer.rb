class ClientHouseSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :client
  belongs_to :owner
  belongs_to :house
end
