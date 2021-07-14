class Visit < ApplicationRecord
  belongs_to :link
  belongs_to :visitor
end
