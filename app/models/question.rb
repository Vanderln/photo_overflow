class Question < ActiveRecord::Base
  has_many :votes as: :votable
  has_many :comments as: :commentable
  has_many :tagclouds
  has_many :tags, through: :tagclouds
  belongs_to :user
end
