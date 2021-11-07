Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,
           Rails.application.credentials.auth[:key],
           Rails.application.credentials.auth[:secret],
end
