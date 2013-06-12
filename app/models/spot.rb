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

  has_attached_file :picture, :styles => { :medium => "640x640>", :thumb => "100x100>" },
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => ":attachment/:id/:style.:extension",
  :default_url => "/assets/no_images/spot/:style.png"

  default_scope order('created_at DESC')
  paginates_per Rails.env.development? ? 2 : 10
end
