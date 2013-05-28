class AddColumnsToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :lat, :decimal, :precision => 17, :scale => 14
    add_column :spots, :lng, :decimal, :precision => 17, :scale => 14
    add_column :spots, :era, :string
    add_column :spots, :material, :string
    add_column :spots, :scale, :string
  end
end
