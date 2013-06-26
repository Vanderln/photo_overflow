class Tag < ActiveRecord::Base
  has_many :tagclouds
  has_many :questions, through: :tagclouds
end
