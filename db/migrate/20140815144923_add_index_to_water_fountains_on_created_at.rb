class AddIndexToWaterFountainsOnCreatedAt < ActiveRecord::Migration
  def change
    add_index :water_fountains, :created_at
  end
end
