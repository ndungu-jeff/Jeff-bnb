class ClientSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :phone_number, :email
end
