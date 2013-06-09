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

require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
