if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAI5AHV6SW55CVNCCQ',
      :aws_secret_access_key => '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',
      :region => 'us-west-2'
    }
    config.fog_directory     =  'wvbr-data'
  end
end