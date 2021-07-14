class Visitor < ApplicationRecord
  has_many :visits
  has_many :links, through: :visits
end
