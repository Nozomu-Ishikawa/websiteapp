require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  case Rails.env
  when 'development', 'test'
    config.storage = :file
    config.cache_storage = :file
  else
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1',
    }
    config.fog_provider = 'fog/aws'
    config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/websiteapp"
    config.storage :fog
    config.cache_storage = :fog
    config.fog_directory = 'websiteapp'
    config.fog_public = false
  end
end
