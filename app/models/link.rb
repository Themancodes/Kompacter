class Link < ApplicationRecord
  belongs_to :user
  has_many :visits
  has_many :visitors, through: :visits

  before_validation :generate_ending
  validates :url, presence: true    
  validates :url, format: URI::regexp(%w[http https])
  validates_length_of :url, within: 3..511, on: :create, message: "too long"
  
   def generate_ending
     self.ending = SecureRandom.uuid[0..5] if self.ending.nil? || self.ending.empty?
     true
   end
  
   def short
     Rails.application.routes.url_helpers.redirex_url(ending: self.ending)
   end
  
   def self.shorten(url, ending = '')
  #   # return short when URL with that ending was created before
     link = Link.where(url: url, ending: ending, users_id: users_id).first
     return link.short if link 
        
  #   # create a new
     link = Link.new(url: url, ending: ending, users_id: users_id)
     return link.short if link.save
        
  #   # if ending is taken, try to add random characters
    Link.shorten(url, ending + SecureRandom.uuid[0..2])
  end
  

end