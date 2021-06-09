class Client < ApplicationRecord
    has_one :user
    has_one :team

    validates :name, presence: true
    validates :provider, presence: true
    validates :business_type, presence: true
end
