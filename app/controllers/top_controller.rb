class TopController < ApplicationController
  skip_before_filter :require_login
  def index
    if latest_spot = Spot.last
      @default_lat = latest_spot.lat
      @default_lng = latest_spot.lng
    else
      @default_lat = 34.809639
      @default_lng = 135.532306
    end
  end

  def how_to_join
  end
end
