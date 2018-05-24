class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  # include CarrierWave::MiniMagick
  process :resize_to_fill => [400, 300]

  def extension_whitelist
    %w(jpg png)
  end
end
