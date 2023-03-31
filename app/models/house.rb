class House < ApplicationRecord
    validates :location, presence: true
    validates :description, presence: true
    validates :price, presence: true

    belongs_to :owner
end
