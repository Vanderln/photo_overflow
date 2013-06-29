class User < ActiveRecord::Base
  attr_accessible :username, :password, :email
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  has_secure_password

  validates_uniqueness_of :email, :username
  validates :email, :username, :password, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  def to_s
    "#{username}"
  end
end
