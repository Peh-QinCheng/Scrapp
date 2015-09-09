if Rails.env.production? || Rails.env.staging? || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.permissions = 0666

    config.fog_credentials = {
      :provider               => 'AWS',                             # required
      :aws_access_key_id      => ENV['S3_KEY'],              # required
      :aws_secret_access_key  => ENV['S3_SECRET'],                  # required
      :region                 => ENV['S3_REGION']
    }
    config.fog_directory  = ENV["FOG_DIRECTORY"]                  # required
    config.fog_use_ssl_for_aws = true
    config.fog_public     = true                                    # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end

if Rails.env.test? || Rails.env.cucumber? 
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  if Rails.env.test?
    # make sure our uploader is auto-loaded
    # use different dirs when testing
    CarrierWave::Uploader::Base.descendants.each do |klass|
      next if klass.anonymous?
      klass.class_eval do
        def cache_dir
          "#{Rails.root}/spec/support/uploads/tmp"
        end

        def store_dir
          "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
        end
      end
    end
  end
end
