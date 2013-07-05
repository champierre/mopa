if Rails.env.production?
  GA_PROPERTY_ID = ENV['GA_PROPERTY_ID']
end