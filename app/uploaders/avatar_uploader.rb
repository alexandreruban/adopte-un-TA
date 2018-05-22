class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  # include CarrierWave::MiniMagick
  process :resize_to_fill => [200, 200]

  def extension_whitelist
    %w(jpg jpeg png)
  end
end
