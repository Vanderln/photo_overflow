class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  permissions 0600

  storage Rails.env.production? ? :fog : :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [600,600]

    version :thumb do
      process :resize_to_fill => [200,200]
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

  # Create different versions of your uploaded files:
  version :thumb do
    process :scale => [50, 50]
  end

end
