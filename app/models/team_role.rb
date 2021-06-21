class TeamRole < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: {admin: 'admin', basic: 'basic'}
  enum staff_role: {junior: "junior", senior: "senior"}
end
