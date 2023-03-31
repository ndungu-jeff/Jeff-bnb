class Owner < ApplicationRecord
    has_secure_password

    validates :full_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :phone_number, length: { is: 12 }

    has_many :houses
    has_many :client_houses
    has_many :clients, through: :client_houses
end
