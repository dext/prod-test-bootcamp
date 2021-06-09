class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :client, dependent: :destroy

  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships
end
