class Photo < ActiveRecord::Base
   attr_accessible :title, :file
  mount_uploader :file, AvatarUploader
end
