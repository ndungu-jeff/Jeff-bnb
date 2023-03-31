class ClientHouse < ApplicationRecord
    belongs_to :client
    belongs_to :owner
    belongs_to :house
end
