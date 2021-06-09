class TeamMembership < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: {admin: 'admin', basic: 'basic'}
end
