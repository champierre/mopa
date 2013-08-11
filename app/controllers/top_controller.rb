class TopController < ApplicationController
  skip_before_filter :require_login
  def index
    @default_lat = Spot.last.lat
    @default_lng = Spot.last.lng
  end

  def how_to_join
  end
end