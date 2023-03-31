class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :phone_number
end
