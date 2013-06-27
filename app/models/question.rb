class Question < ActiveRecord::Base
  attr_accessible :file, :title, :content, :path, :user_id
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :tagclouds
  has_many :tags, through: :tagclouds
  belongs_to :user
  has_many :answers

  mount_uploader :file, PhotoUploader
end
