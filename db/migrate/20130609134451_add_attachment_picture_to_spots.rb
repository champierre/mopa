class AddAttachmentPictureToSpots < ActiveRecord::Migration
  def self.up
    change_table :spots do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :spots, :picture
  end
end
