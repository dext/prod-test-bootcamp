class TeamConnection < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :connection_type, presence: true
  validates :connection_details, presence: true
end
