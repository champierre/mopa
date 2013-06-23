# == Schema Information
#
# Table name: spots
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  artist               :string(255)
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  lat                  :decimal(17, 14)
#  lng                  :decimal(17, 14)
#  era                  :string(255)
#  material             :string(255)
#  scale                :string(255)
#  user_id              :integer
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Spot < ActiveRecord::Base
  attr_accessible :artist, :description, :name, :lat, :lng, :era, :material, :scale, :picture, :user_id
  belongs_to :user

  has_attached_file :picture, :styles => { :medium => "640x640>", :thumb => "160x160>" },
  :convert_options => {:all => "-auto-orient", :thumb => "-gravity Center -crop 120x120+0+0"},
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => ":attachment/:id/:style.:extension",
  :default_url => "/assets/no_images/spot/:style.png"

  paginates_per Rails.env.development? ? 2 : 10

  scope :in_area, lambda {|options|
    {
      :select => "spots.*, sqrt(power((#{EARTH_EQUATORIAL_RADIUS} * (#{options[:center_lng]} - lng) * (pi()/180) * cos(lat * (pi()/180))), 2) + power(#{EARTH_EQUATORIAL_RADIUS} * (#{options[:center_lat]} - lat) * (pi()/180), 2)) as distance",
      :conditions =>
      ["lat < :n AND lng < :e AND lng > :w AND lat > :s", {:n => options[:n], :e => options[:e], :w => options[:w], :s => options[:s]}],
      :limit => APP_CONFIG[:in_area_limit],
      :order => 'distance ASC'
    }
  }

  EARTH_EQUATORIAL_RADIUS = 6378137

  def as_json(options = {})
    super :only => [:name, :lat, :lng, :id, :distance], :methods => [:thumb_url]
  end

  def thumb_url
    self.picture.url(:thumb)
  end
end
