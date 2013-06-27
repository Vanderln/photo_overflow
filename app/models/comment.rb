class Comment < ActiveRecord::Base
  attr_accessible :user_id, :content
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
