if Rails.env == "production"
  GMAP_KEY = ENV['GMAP_KEY']
else
  GMAP_KEY = YAML.load(File.read(Rails.root.join("config/gmap_key.yml")))[Rails.env]['gmap_key']
end