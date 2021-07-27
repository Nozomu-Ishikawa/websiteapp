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
      region: ENV['S3_REGION']
    }
    config.fog_provider = 'fog/aws'
    config.asset_host = ENV['S3_HOST']
    config.storage :fog
    config.cache_storage = :fog
    config.fog_directory = ENV['S3_BAKET']
    config.fog_public = false
  end
end
