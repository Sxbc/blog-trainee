require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.fog_provider = 'fog'
    config.enable_processing = false
    config.storage = :fog
  end
end
