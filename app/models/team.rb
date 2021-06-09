class Team < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_and_belongs_to_many :users
  has_many :clients
end
