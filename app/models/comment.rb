class Comment < ActiveRecord::Base
  attr_accessible :user_id, :content, :commentable_id, :commentable_type
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
