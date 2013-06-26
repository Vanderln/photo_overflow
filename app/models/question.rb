class Question < ActiveRecord::Base
  attr_accessible :file
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :tagclouds
  has_many :tags, through: :tagclouds
  belongs_to :user

  mount_uploader :file, PhotoUploader
end
