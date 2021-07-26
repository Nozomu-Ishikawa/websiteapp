require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  case Rails.env
  when 'development', 'production'#<=test
    config.storage = :file #修正箇所
    config.cache_storage = :file #修正箇所
  else
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1',
    }
    config.fog_provider = 'fog/aws'
    config.storage :fog
    config.cache_storage = :fog
    config.fog_directory = 'websiteapp'
    config.fog_public = false
  end
end
