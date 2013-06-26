class Question < ActiveRecord::Base
  has_many :votes as: :votable
end
