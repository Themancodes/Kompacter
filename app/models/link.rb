class Link < ApplicationRecord
    before_validation :generate_ending
    validates :url, presence: true    
    validates :url, format: URI::regexp(%w[http https])
    validates_length_of :url, within: 3..511, on: :create, message: "too long"

    def generate_ending
        self.ending = SecureRandom.uuid[0..5] if self.ending.nil? || self.ending.empty?
        true
    end

    def short
        Rails.application.routes.url_helpers.short_url(ending: self.ending)
    end

    def self.shorten(url, ending = '')
        # return short when URL with that ending was created before
        link = Link.where(url: url, ending: ending).first
        return link.short if link 
          
        # create a new
        link = Link.new(url: url, ending: ending)
        return link.short if link.save
          
        # if ending is taken, try to add random characters
        Link.shorten(url, ending + SecureRandom.uuid[0..2])
    end


end
