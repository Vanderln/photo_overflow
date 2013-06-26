class Answer < ActiveRecord::Base
  has_many :votes, as: :votable

end
