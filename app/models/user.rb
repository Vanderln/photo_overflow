class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  attr_accessible :username, :email, :password
  has_secure_password
end
