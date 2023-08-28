Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    #Todo: Change origin to allow only whitelisted domains from scrollcapital.com
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete]
  end
end

