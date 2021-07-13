class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  
end
