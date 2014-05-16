class AddImageToWaterFountains < ActiveRecord::Migration
  def self.up
    add_attachment :water_fountains, :image
  end

  def self.down
    remove_attachment :water_fountains, :image
  end
end
