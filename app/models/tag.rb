class Tag < ActiveRecord::Base
  has_many :tagclouds
  has_many :questions, through: :tagclouds

  attr_accessible :name, :description, :question_id
end
