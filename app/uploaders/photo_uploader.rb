# app/uploaders/avatar_uploader.rb

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :display do
    process :eager => true
    process :resize_to_fill => [200, 200, :north]
  end

  version :thumbnail do
    process :eager => true
    process :resize_to_fit => [100, 100]
  end

end
