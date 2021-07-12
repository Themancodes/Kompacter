class Visitor < ApplicationRecord
  has_many :visits
  has_many :links, through: :visits

  validates :ip, :location, :user_agent, :platform, presence: true
  validates :ip, uniqueness: true
end
