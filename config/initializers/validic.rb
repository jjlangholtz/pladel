Validic.configure do |config|
  config.api_url        = 'https://api.validic.com'
  config.api_version    = 'v1'
  config.access_token   = ENV['VALIDIC_ACCESS_TOKEN']
  config.organization_id= ENV['VALIDIC_ORGANIZATION_ID']
end
